package com.missiontracker.servlet;

import com.missiontracker.dao.MissionDAO;
import com.missiontracker.database.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/misiones/eliminar")

public class MissionDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            MissionDAO dao = new MissionDAO(connection);
            boolean deleted = dao.deleteMissionById(id);

            if (deleted) {
                request.getSession().setAttribute("deletedMission", id);
            }

            response.sendRedirect(request.getContextPath() + "/misiones/lista");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("❌ Error while deleting mission.");
        }
    }
}
