package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.dao.MissionDAO;
import com.missiontracker.database.DBConnection;
import com.missiontracker.model.Astronaut;
import com.missiontracker.model.Mission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/astronautas/actualizar")
public class AstronautUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String nationality = request.getParameter("nationality");
        String role = request.getParameter("role");
        String missionName = request.getParameter("missionName");

        if (idParam == null || name == null || nationality == null || role == null || missionName == null ||
                idParam.isEmpty() || name.isEmpty() || nationality.isEmpty() || role.isEmpty() || missionName.isEmpty()) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ All fields are required.</h2>");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);

            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            MissionDAO missionDAO = new MissionDAO(connection);
            Mission mission = missionDAO.getMissionByName(missionName);

            if (mission == null) {
                db.disconnect();
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<h2 style='color:red'>❌ The selected mission does not exist.</h2>");
                return;
            }

            int missionId = mission.getId();

            Astronaut astronaut = new Astronaut();
            astronaut.setId(id);
            astronaut.setName(name);
            astronaut.setNationality(nationality);
            astronaut.setRole(role);
            astronaut.setMissionid(missionId);
            astronaut.setMissionName(mission.getName()); // opcional

            AstronautDAO astronautDAO = new AstronautDAO(connection);
            astronautDAO.updateAstronaut(astronaut);

            db.disconnect();

            response.sendRedirect(request.getContextPath() + "/astronautas/detalle?id=" + id);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error updating astronaut.</h2>");
        }
    }
}
