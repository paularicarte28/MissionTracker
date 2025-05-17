<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.missiontracker.model.Mission" %>
        <%@ page import="java.util.List" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Mission List</title>
                <meta name="viewport" content="width=device-width, initial-scale=1">

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Google Font -->
                <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap"
                    rel="stylesheet">

                <style>
                    body {
                        background-color: #111;
                        color: #f8f9fa;
                        font-family: 'Orbitron', sans-serif;
                    }

                    .card {
                        text-align: center;
                    }
                </style>
            </head>

            <body class="bg-dark text-white">

                <div class="container py-5 text-center">

                    <h1 class="text-warning display-3 mb-4">🚀 Missions</h1>

                    <a href="<%= request.getContextPath() %>/misiones/formulario" class="btn btn-lg btn-success mb-4">
                        ➕ Add Mission
                    </a>

                    <% List<Mission> missions = (List<Mission>) request.getAttribute("missions");
                            if (missions == null || missions.isEmpty()) {
                            %>
                            <div class="alert alert-warning">⚠️ No missions found.</div>
                            <% } else { %>

                                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                                    <% for (Mission m : missions) { %>
                                        <div class="col">
                                            <div class="card h-100 bg-secondary text-white border-warning shadow-sm">
                                                <div class="card-body">
                                                    <h5 class="card-title">
                                                        <%= m.getName() %>
                                                    </h5>
                                                    <p class="card-text">
                                                        <strong>Launch Date:</strong>
                                                        <%= m.getLaunchDate() %><br>
                                                            <strong>Objective:</strong>
                                                            <%= m.getObjective() %><br>
                                                                <strong>Status:</strong>
                                                                <%= m.getStatus() %>
                                                    </p>
                                                    <div class="d-flex justify-content-center gap-2">
                                                        <a href="<%= request.getContextPath() %>/misiones/detalle?id=<%= m.getId() %>"
                                                            class="btn btn-outline-info btn-sm">Details</a>
                                                        <a href="<%= request.getContextPath() %>/misiones/editar?id=<%= m.getId() %>"
                                                            class="btn btn-outline-warning btn-sm">Edit</a>
                                                        <form method="get"
                                                            action="<%= request.getContextPath() %>/misiones/eliminar"
                                                            onsubmit="return confirm('Are you sure you want to delete <%= m.getName() %>?');">
                                                            <input type="hidden" name="id" value="<%= m.getId() %>">
                                                            <button type="submit"
                                                                class="btn btn-outline-danger btn-sm">Delete</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                </div>

                                <% } %>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>