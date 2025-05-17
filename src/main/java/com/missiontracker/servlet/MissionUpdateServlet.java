package com.missiontracker.servlet;

import com.missiontracker.dao.MissionDAO;
import com.missiontracker.model.Mission;
import com.missiontracker.database.DBConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/misiones/actualizar")
public class MissionUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String launchDate = request.getParameter("launchDate");
        String objective = request.getParameter("objective");
        String status = request.getParameter("status");

        Mission mission = new Mission(id, name, launchDate, objective, status);

        try {
            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            MissionDAO dao = new MissionDAO(connection);
            dao.updateMission(mission);

            response.sendRedirect(request.getContextPath() + "/misiones/detalle?id=" + id);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error al actualizar la misión</h2>");
        }
    }
}
