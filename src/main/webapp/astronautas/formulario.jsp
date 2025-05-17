<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Register Astronaut</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <style>
                body {
                    background-color: #1a1a1a;
                    color: #f8f9fa;
                }

                .form-container {
                    background-color: #2c2f33;
                    border: 1px solid #0dcaf0;
                    border-radius: 10px;
                    padding: 2rem;
                    max-width: 600px;
                    margin: auto;
                }

                .btn-primary {
                    background-color: #0dcaf0;
                    border: none;
                }

                .btn-primary:hover {
                    background-color: #31d2f2;
                }
            </style>
        </head>

        <body>
            <div class="container mt-5">
                <h2 class="text-center mb-4">🚀 Register New Astronaut</h2>
                <div class="form-container">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/astronautas/formulario" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="nationality" class="form-label">Nationality</label>
                            <input type="text" id="nationality" name="nationality" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="role" class="form-label">Role</label>
                            <input type="text" id="role" name="role" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="missionid" class="form-label">Assigned Mission</label>
                            <select id="missionid" name="missionid" class="form-select" required>
                                <option value="">-- Select a Mission --</option>
                                <c:forEach var="mission" items="${missions}">
                                    <option value="${mission.id}">${mission.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </form>

                    <div class="text-center mt-3">
                        <a href="${pageContext.request.contextPath}/astronautas/lista" class="text-info">🔙 Back to
                            list</a>
                    </div>
                </div>
            </div>
        </body>

        </html>