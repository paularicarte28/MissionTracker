package com.missiontracker.servlet;

import com.missiontracker.dao.MissionDAO;
import com.missiontracker.database.DBConnection;
import com.missiontracker.model.Mission;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/misiones/formulario")
public class MissionRegisterServlet extends HttpServlet {

    private static final List<String> VALID_STATUSES = List.of("PLANNED", "ACTIVE", "COMPLETED", "CANCELLED");

    // Muestra el formulario
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // En caso de que quieras pasar info al formulario (futuro uso)
        request.getRequestDispatcher("/misiones/formulario.jsp").forward(request, response);
    }

    // Procesa el registro de misión
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String launchDate = request.getParameter("launchDate");
        String objective = request.getParameter("objective");
        String status = request.getParameter("status");

        if (name == null || launchDate == null || objective == null || status == null ||
            name.isEmpty() || launchDate.isEmpty() || objective.isEmpty() || status.isEmpty()) {
            request.setAttribute("error", "❌ All fields are required.");
            doGet(request, response);
            return;
        }

        status = status.toUpperCase();

        if (!VALID_STATUSES.contains(status)) {
            request.setAttribute("error", "❌ Invalid status value.");
            doGet(request, response);
            return;
        }

        Mission mission = new Mission(0, name, launchDate, objective, status);

        try {
            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            MissionDAO dao = new MissionDAO(connection);
            dao.insertMission(mission);

            db.disconnect();
            response.sendRedirect(request.getContextPath() + "/misiones/lista");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Internal error while registering mission.");
            doGet(request, response);
        }
    }
}
