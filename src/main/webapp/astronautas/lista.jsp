<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.missiontracker.model.Astronaut" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Astronautas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-white">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-info">👨‍🚀 Lista de Astronautas</h2>
        <a href="<%= request.getContextPath() %>/astronautas/registro" class="btn btn-success">➕ Añadir Astronauta</a>
    </div>

    <%
        List<Astronaut> astronauts = (List<Astronaut>) request.getAttribute("astronauts");

        if (astronauts == null || astronauts.isEmpty()) {
    %>
        <div class="alert alert-warning">⚠️ No hay astronautas registrados en la base de datos.</div>
    <%
        } else {
    %>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
        <% for (Astronaut a : astronauts) { %>
        <div class="col">
            <div class="card h-100 bg-secondary text-white border-info shadow-sm">
                <div class="card-body">
                    <h5 class="card-title"><%= a.getName() %></h5>
                    <p class="card-text">
                        <strong>País:</strong> <%= a.getNationality() %><br>
                        <strong>Rol:</strong> <%= a.getRole() %>
                    </p>
                    <div class="d-flex justify-content-between">
                        <a href="<%= request.getContextPath() %>/astronautas/detalle?id=<%= a.getId() %>" class="btn btn-outline-info btn-sm">Detalles</a>
                        <form method="get" action="<%= request.getContextPath() %>/astronautas/eliminar"
                              onsubmit="return confirm('¿Eliminar a <%= a.getName() %>?');">
                            <input type="hidden" name="id" value="<%= a.getId() %>">
                            <button type="submit" class="btn btn-outline-danger btn-sm">Eliminar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
