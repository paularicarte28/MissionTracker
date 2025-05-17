package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.dao.MissionDAO;
import com.missiontracker.database.DBConnection;
import com.missiontracker.model.Astronaut;
import com.missiontracker.model.Mission;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/astronautas/formulario")
public class AstronautRegisterServlet extends HttpServlet {

    // mUESTRA FORMULARIO 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            MissionDAO missionDAO = new MissionDAO(connection);
            List<Mission> missions = missionDAO.getAllMissions();
            request.setAttribute("missions", missions);

            db.disconnect();
            request.getRequestDispatcher("/astronautas/formulario.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error loading the form</h2>");
        }
    }

    // REGISTRO
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String nationality = request.getParameter("nationality");
        String role = request.getParameter("role");
        String missionIdParam = request.getParameter("missionid");

        if (name == null || nationality == null || role == null || missionIdParam == null ||
                name.isEmpty() || nationality.isEmpty() || role.isEmpty() || missionIdParam.isEmpty()) {
            request.setAttribute("error", "❌ All fields are required.");
            doGet(request, response); // volvemos al formulario
            return;
        }

        try {
            int missionId = Integer.parseInt(missionIdParam);

            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            // Validar si la misión existe
            MissionDAO missionDAO = new MissionDAO(connection);
            if (missionDAO.getMissionById(missionId) == null) {
                db.disconnect();
                request.setAttribute("error", "❌ The selected mission does not exist.");
                doGet(request, response); // vuelve al formulario
                return;
            }

            Astronaut astronaut = new Astronaut();
            astronaut.setName(name);
            astronaut.setNationality(nationality);
            astronaut.setRole(role);
            astronaut.setMissionid(missionId);

            AstronautDAO astronautDAO = new AstronautDAO(connection);
            astronautDAO.insertAstronaut(astronaut);

            db.disconnect();
            response.sendRedirect(request.getContextPath() + "/astronautas/lista");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "❌ The mission ID must be a valid number.");
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Internal error while registering astronaut.");
            doGet(request, response);
        }
    }
}
