package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.database.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

public class AstronautDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        // FIXME arreglar metodo conectado
        Connection conn = DBConnection.getConnection();
        AstronautDAO dao = new AstronautDAO(conn);
        dao.deleteAstronautById(id);

        response.sendRedirect("/MissionTracker/astronautas");
    }
}