package com.missiontracker.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.model.Astronaut;
import com.missiontracker.database.DBConnection;

import javax.servlet.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/detalle")

public class AstronautDetailServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    int id = Integer.parseInt(request.getParameter("id"));

    DBConnection db = new DBConnection(); // ✅ instanciamos el objeto
    Connection connection = db.getConnection(); // ✅ llamada válida

    AstronautDAO dao = new AstronautDAO(connection);
    Astronaut astronaut = dao.getAstronautById(id);

    request.setAttribute("astronaut", astronaut);
    RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/detalle.jsp");
    dispatcher.forward(request, response);
}
}