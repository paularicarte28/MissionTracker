package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.model.Astronaut;
import com.missiontracker.database.DBConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/astronautas/lista")

public class AstronautListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            DBConnection db = new DBConnection();
            db.connect(); // ✅ Ahora sí, primero conectamos
            Connection connection = db.getConnection();

            AstronautDAO dao = new AstronautDAO(connection);
            List<Astronaut> astronauts = dao.getAllAstronauts();

            request.setAttribute("astronauts", astronauts);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/lista.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // SteamWeb-style: logging directo
        }
    }
}
