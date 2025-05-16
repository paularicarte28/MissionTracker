package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.model.Astronaut;
import com.missiontracker.database.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

public class AstronautDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Connection conn = DBConnection.getConnection();
        AstronautDAO dao = new AstronautDAO(conn);
        Astronaut astronaut = dao.getAstronautById(id);

        request.setAttribute("astronaut", astronaut);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/detalle.jsp");
        dispatcher.forward(request, response);
    }
}