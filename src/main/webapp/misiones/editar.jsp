<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.missiontracker.model.Mission" %>
        <% Mission mission=(Mission) request.getAttribute("mission"); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Edit Mission</title>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-dark text-white">
                <div class="container py-5">
                    <h2 class="text-warning mb-4 text-center">✏️ Edit Mission</h2>

                    <div class="card bg-secondary text-white border-warning shadow-lg mx-auto"
                        style="max-width: 700px;">
                        <div class="card-body">
                            <form method="post" action="<%= request.getContextPath() %>/misiones/actualizar">
                                <input type="hidden" name="id" value="<%= mission.getId() %>">

                                <div class="mb-3">
                                    <label for="name" class="form-label">Mission Name</label>
                                    <input type="text" id="name" name="name" class="form-control"
                                        value="<%= mission.getName() %>" required>
                                </div>

                                <div class="mb-3">
                                    <label for="launchDate" class="form-label">Launch Date</label>
                                    <input type="date" id="launchDate" name="launchDate" class="form-control"
                                        value="<%= mission.getLaunchDate() %>" required>
                                </div>

                                <div class="mb-3">
                                    <label for="objective" class="form-label">Objective</label>
                                    <input type="text" id="objective" name="objective" class="form-control"
                                        value="<%= mission.getObjective() %>" required>
                                </div>

                                <div class="mb-3">
                                    <label for="status" class="form-label">Status</label>
                                    <select id="status" name="status" class="form-select" required>
                                        <option value="PLANNED" <%=mission.getStatus().equals("PLANNED") ? "selected"
                                            : "" %>>Planned</option>
                                        <option value="ACTIVE" <%=mission.getStatus().equals("ACTIVE") ? "selected" : ""
                                            %>>Active</option>
                                        <option value="COMPLETED" <%=mission.getStatus().equals("COMPLETED")
                                            ? "selected" : "" %>>Completed</option>
                                        <option value="CANCELLED" <%=mission.getStatus().equals("CANCELLED")
                                            ? "selected" : "" %>>Cancelled</option>
                                    </select>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <button type="submit" class="btn btn-warning">💾 Save Changes</button>
                                    <a href="<%= request.getContextPath() %>/misiones/detalle?id=<%= mission.getId() %>"
                                        class="btn btn-light">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>