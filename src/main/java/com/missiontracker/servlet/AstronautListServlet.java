package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.model.Astronaut;
import com.missiontracker.database.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class AstronautListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = DBConnection.getConnection();
        AstronautDAO dao = new AstronautDAO(conn);
        List<Astronaut> astronauts = dao.getAllAstronauts();

        request.setAttribute("astronauts", astronauts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/lista.jsp");
        dispatcher.forward(request, response);
    }
}