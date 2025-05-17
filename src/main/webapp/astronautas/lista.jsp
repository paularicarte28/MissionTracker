<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.missiontracker.model.Astronaut" %>
        <%@ page import="java.util.List" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <title>Astronaut List</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1">

                    <!-- Bootstrap CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <!-- Custom Font -->
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

                <body>

                    <div class="container py-5 text-center">

                        <% String deletedName=(String) session.getAttribute("deletedAstronaut"); %>
                            <% if (deletedName !=null) { %>
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    ✅ Astronaut <strong>
                                        <%= deletedName %>
                                    </strong> was successfully deleted.
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                        aria-label="Close"></button>
                                </div>
                                <% session.removeAttribute("deletedAstronaut"); %>
                                    <% } %>

                                        <h1 class="text-info display-3 mb-4">👨‍🚀 Astronauts</h1>

                                        <a href="${pageContext.request.contextPath}/astronautas/formulario"
                                            class="btn btn-lg btn-success mb-4">
                                            ➕ Add Astronaut
                                        </a>

                                        <!-- Filter form -->
                                        <form class="row g-3 justify-content-center mb-5" method="get"
                                            action="${pageContext.request.contextPath}/astronautas/lista">
                                            <div class="col-md-4">
                                                <input type="text" class="form-control" name="q"
                                                    placeholder="Search by name or role"
                                                    value="${param.q != null ? param.q : ''}">
                                            </div>
                                            <div class="col-md-3">
                                                <select class="form-select" name="nationality">
                                                    <option value="">All Nationalities</option>
                                                    <option value="United States" ${param.nationality=='United States'
                                                        ? 'selected' : '' }>United States</option>
                                                    <option value="Russia" ${param.nationality=='Russia' ? 'selected'
                                                        : '' }>Russia</option>
                                                    <option value="Italy" ${param.nationality=='Italy' ? 'selected' : ''
                                                        }>Italy</option>
                                                    <option value="Spain" ${param.nationality=='Spain' ? 'selected' : ''
                                                        }>Spain</option>
                                                    <option value="Japan" ${param.nationality=='Japan' ? 'selected' : ''
                                                        }>Japan</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="submit" class="btn btn-outline-info w-100">🔍
                                                    Search</button>
                                            </div>
                                            <c:if test="${param.q != null || param.nationality != null}">
                                                <div class="col-md-2">
                                                    <a href="${pageContext.request.contextPath}/astronautas/lista"
                                                        class="btn btn-outline-secondary w-100">🔙 Reset</a>
                                                </div>
                                            </c:if>
                                        </form>

                                        <c:choose>
                                            <c:when test="${empty astronauts}">
                                                <div class="alert alert-warning">⚠️ No astronauts found.</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                                                    <c:forEach var="a" items="${astronauts}">
                                                        <div class="col">
                                                            <div
                                                                class="card h-100 bg-secondary text-white border-info shadow-sm">
                                                                <div class="card-body">
                                                                    <h5 class="card-title">${a.name}</h5>
                                                                    <p class="card-text">
                                                                        <strong>Nationality:</strong>
                                                                        ${a.nationality}<br>
                                                                        <strong>Role:</strong> ${a.role}
                                                                    </p>
                                                                    <div class="d-flex justify-content-center gap-2">
                                                                        <a href="${pageContext.request.contextPath}/astronautas/detalle?id=${a.id}"
                                                                            class="btn btn-outline-info btn-sm">Details</a>
                                                                        <form method="get"
                                                                            action="${pageContext.request.contextPath}/astronautas/eliminar"
                                                                            onsubmit="return confirm('Are you sure you want to delete ${a.name}?');">
                                                                            <input type="hidden" name="id"
                                                                                value="${a.id}">
                                                                            <button type="submit"
                                                                                class="btn btn-outline-danger btn-sm">Delete</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>

                                                <!-- Paginarcion  -->
                                                <jsp:include page="/includes/pagination.jsp" />
                                            </c:otherwise>
                                        </c:choose>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>