package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.database.DBConnection;
import com.missiontracker.model.Astronaut;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/astronautas/registro")
public class AstronautRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String nationality = request.getParameter("nationality");
        String role = request.getParameter("role");
        String missionIdParam = request.getParameter("missionid");

        // Validación básica
        if (name == null || nationality == null || role == null || missionIdParam == null ||
            name.isEmpty() || nationality.isEmpty() || role.isEmpty() || missionIdParam.isEmpty()) {

            request.setAttribute("error", "❌ Todos los campos son obligatorios.");
            request.getRequestDispatcher("/astronautas/formulario.jsp").forward(request, response);
            return;
        }

        try {
            int missionId = Integer.parseInt(missionIdParam);

            Astronaut astronaut = new Astronaut();
            astronaut.setName(name);
            astronaut.setNationality(nationality);
            astronaut.setRole(role);
            astronaut.setMissionid(missionId);

            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            AstronautDAO dao = new AstronautDAO(connection);
            dao.insertAstronaut(astronaut);

            db.disconnect();

            // Redirigir a la lista si todo salió bien
            response.sendRedirect(request.getContextPath() + "/astronautas/lista");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "❌ El ID de la misión debe ser un número válido.");
            request.getRequestDispatcher("/astronautas/formulario.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Error interno al registrar astronauta.");
            request.getRequestDispatcher("/astronautas/formulario.jsp").forward(request, response);
        }
    }
}