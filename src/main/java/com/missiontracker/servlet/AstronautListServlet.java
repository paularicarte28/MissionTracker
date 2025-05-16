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

@WebServlet("/lista")
public class AstronautListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         DBConnection db = new DBConnection(); // ✅ instanciamos el objeto
        Connection connection = db.getConnection(); // ✅ llamada válida
        AstronautDAO dao = new AstronautDAO(connection);
        List<Astronaut> astronauts = dao.getAllAstronauts();

        request.setAttribute("astronauts", astronauts);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/lista.jsp");
        dispatcher.forward(request, response);
    }
}