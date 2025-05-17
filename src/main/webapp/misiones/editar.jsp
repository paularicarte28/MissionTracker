<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.missiontracker.model.Mission" %>
        <% Mission mission=(Mission) request.getAttribute("mission"); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Edit Mission</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-dark text-white">
                <div class="container py-5">
                    <h2 class="text-warning mb-4">✏️ Edit Mission</h2>
                    <form method="post" action="<%= request.getContextPath() %>/misiones/actualizar">
                        <input type="hidden" name="id" value="<%= mission.getId() %>">

                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" value="<%= mission.getName() %>"
                                required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Launch Date</label>
                            <input type="text" name="launchDate" class="form-control"
                                value="<%= mission.getLaunchDate() %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Objective</label>
                            <input type="text" name="objective" class="form-control"
                                value="<%= mission.getObjective() %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <input type="text" name="status" class="form-control" value="<%= mission.getStatus() %>"
                                required>
                        </div>

                        <button type="submit" class="btn btn-warning">💾 Save Changes</button>
                        <a href="<%= request.getContextPath() %>/misiones/detalle?id=<%= mission.getId() %>"
                            class="btn btn-light">Cancel</a>
                    </form>
                </div>
            </body>

            </html>