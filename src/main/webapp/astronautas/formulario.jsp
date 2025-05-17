<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>Register Astronaut</title>
            <meta charset="UTF-8">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <style>
                body {
                    background-color: #1a1a1a;
                    color: #f8f9fa;
                    padding: 2rem;
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

                a {
                    color: #0dcaf0;
                }

                a:hover {
                    text-decoration: underline;
                }
            </style>
        </head>

        <body>

            <div class="container mt-5">
                <h2 class="text-center mb-4">🚀 Register New Astronaut</h2>

                <div class="form-container">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/astronautas/registro" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="mb-3">
                            <label for="nationality" class="form-label">Nationality</label>
                            <input type="text" class="form-control" id="nationality" name="nationality" required>
                        </div>

                        <div class="mb-3">
                            <label for="role" class="form-label">Role</label>
                            <input type="text" class="form-control" id="role" name="role" required>
                        </div>

                        <div class="mb-3">
                            <label for="missionid" class="form-label">Assigned Mission</label>
                            <select class="form-select" id="missionid" name="missionid" required>
                                <option value="">-- Select a mission --</option>
                                <c:forEach var="mission" items="${missions}">
                                    <option value="${mission.id}">${mission.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </form>

                    <div class="mt-3 text-center">
                        <a href="${pageContext.request.contextPath}/astronautas/lista">🔙 Back to list</a>
                    </div>
                </div>
            </div>

        </body>

        </html>