<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mission Tracker</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    </head>

    <body>

        <!-- Navbar -->
       <!---- <div id="logo-intro" class="d-flex justify-content-center align-items-center">
            <img src="${pageContext.request.contextPath}/images/MTsinfondo.png" id="logo-image" alt="Mission Tracker Logo">
        </div>-->
        <jsp:include page="/includes/navbar.jsp" />


        <div class="container mt-5">

            <!-- Misiones -->
            <h1 class="text-center mb-4">Most Famous Missions</h1>
            <div id="missionsCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/images/16apollo11.jpg" class="d-block w-100"
                            alt="Apollo 11">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/images/16marsOdyssey.jpg" class="d-block w-100"
                            alt="Mars Odyssey">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/images/16voyager1.jpg" class="d-block w-100"
                            alt="Voyager 1">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/images/16artemis1.jpg" class="d-block w-100"
                            alt="Curiosity Rover">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/images/16ConstellationProgram.png"
                            class="d-block w-100" alt="International Space Station">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#missionsCarousel"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#missionsCarousel"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <!-- Astronautas -->
            <h1 class="text-center mb-4"> Most Famous Astronauts</h1>
            <div id="astronautsCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/images/neilAmstrong.webp" class="d-block w-100"
                            alt="Neil Armstrong">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/images/16YuriGaragin.jpg" class="d-block w-100"
                            alt="Yuri Gagarin">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/images/16sunitaWilliams.jpg" class="d-block w-100"
                            alt="Sunita Williams">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/images/16charlesBolden.jpg" class="d-block w-100"
                            alt="Sally Ride">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/images/16christinaKoch.jpg" class="d-block w-100"
                            alt="Chris Hadfield">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#astronautsCarousel"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#astronautsCarousel"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

    </body>



    </html>