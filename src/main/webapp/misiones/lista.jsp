<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.missiontracker.model.Mission" %>
        <%@ page import="java.util.List" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Mission List</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-dark text-white">

                <div class="container py-5">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="text-warning">🚀 Mission List</h2>
                        <!-- Aquí podrías poner un botón para agregar misión -->
                    </div>

                    <% List<Mission> missions = (List<Mission>) request.getAttribute("missions");

                            if (missions == null || missions.isEmpty()) {
                            %>
                            <div class="alert alert-warning">⚠️ No missions found in the database.</div>
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