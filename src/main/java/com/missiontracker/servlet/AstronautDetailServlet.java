package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.model.Astronaut;
import com.missiontracker.database.DBConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/astronautas/detalle")
public class AstronautDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            AstronautDAO dao = new AstronautDAO(connection);
            Astronaut astronaut = dao.getAstronautById(id);

            request.setAttribute("astronaut", astronaut);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/detalle.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error al cargar el detalle</h2>");
        }
    }
}