<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.missiontracker.model.Astronaut" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Astronaut List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

   
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #111;
            color: #f8f9fa;
            font-family: 'Orbitron', sans-serif;
        }
        .card {
            text-align: center;
        }
        .form-label {
            color: #fff;
        }
    </style>
</head>
<body>

<div class="container py-5 text-center">

    <% String deletedName = (String) session.getAttribute("deletedAstronaut"); %>
    <% if (deletedName != null) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ✅ Astronaut <strong><%= deletedName %></strong> was successfully deleted.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% session.removeAttribute("deletedAstronaut"); %>
    <% } %>

    <h1 class="text-info display-3 mb-4">👨‍🚀 Astronauts</h1>

    <a href="<%= request.getContextPath() %>/astronautas/formulario" class="btn btn-lg btn-success mb-4">
        ➕ Add Astronaut
    </a>


    <form class="row g-3 justify-content-center mb-5" method="get" action="<%= request.getContextPath() %>/astronautas/lista">
        <div class="col-md-4">
            <input type="text" class="form-control" name="q" placeholder="Search by name or role"
                   value="<%= request.getParameter("q") != null ? request.getParameter("q") : "" %>">
        </div>
        <div class="col-md-3">
            <select class="form-select" name="nationality">
                <option value="">All Nationalities</option>
                <option value="United States" <%= "United States".equals(request.getParameter("nationality")) ? "selected" : "" %>>United States</option>
                <option value="Russia" <%= "Russia".equals(request.getParameter("nationality")) ? "selected" : "" %>>Russia</option>
                <option value="Italy" <%= "Italy".equals(request.getParameter("nationality")) ? "selected" : "" %>>Italy</option>
                <option value="Spain" <%= "Spain".equals(request.getParameter("nationality")) ? "selected" : "" %>>Spain</option>
                <option value="Japan" <%= "Japan".equals(request.getParameter("nationality")) ? "selected" : "" %>>Japan</option>
            </select>
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-outline-info w-100">🔍 Search</button>
        </div>

        <%
            String q = request.getParameter("q");
            String nationality = request.getParameter("nationality");
            boolean hasFilters = (q != null && !q.trim().isEmpty()) || (nationality != null && !nationality.trim().isEmpty());
        %>
        <% if (hasFilters) { %>
            <div class="col-md-2">
                <a href="<%= request.getContextPath() %>/astronautas/lista" class="btn btn-outline-secondary w-100">🔙 Back to List</a>
            </div>
        <% } %>
    </form>

    <%
        List<Astronaut> astronauts = (List<Astronaut>) session.getAttribute("filteredAstronauts");
        if (astronauts == null) {
            astronauts = (List<Astronaut>) request.getAttribute("astronauts");
        }
        session.removeAttribute("filteredAstronauts");
    %>

    <% if (astronauts == null || astronauts.isEmpty()) { %>
        <div class="alert alert-warning">⚠️ No astronauts found.</div>
    <% } else { %>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
        <% for (Astronaut a : astronauts) { %>
        <div class="col">
            <div class="card h-100 bg-secondary text-white border-info shadow-sm">
                <div class="card-body">
                    <h5 class="card-title"><%= a.getName() %></h5>
                    <p class="card-text">
                        <strong>Nationality:</strong> <%= a.getNationality() %><br>
                        <strong>Role:</strong> <%= a.getRole() %>
                    </p>
                    <div class="d-flex justify-content-center gap-2">
                        <a href="<%= request.getContextPath() %>/astronautas/detalle?id=<%= a.getId() %>" class="btn btn-outline-info btn-sm">Details</a>
                        <form method="get" action="<%= request.getContextPath() %>/astronautas/eliminar"
                              onsubmit="return confirm('Are you sure you want to delete <%= a.getName() %>?');">
                            <input type="hidden" name="id" value="<%= a.getId() %>">
                            <button type="submit" class="btn btn-outline-danger btn-sm">Delete</button>
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
