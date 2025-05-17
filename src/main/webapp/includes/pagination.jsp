<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" %>

        <c:if test="${totalPages > 1}">
            <nav aria-label="Astronaut pagination" class="mt-5">
                <ul class="pagination justify-content-center">

                    <!-- Anterior -->
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link"
                            href="?page=${currentPage - 1}<c:if test='${param.q != null}'> &amp;q=${param.q}</c:if><c:if test='${param.nationality != null}'> &amp;nationality=${param.nationality}</c:if>">
                            « Anterior
                        </a>
                    </li>

                    <!-- Números -->
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link"
                                href="?page=${i}<c:if test='${param.q != null}'> &amp;q=${param.q}</c:if><c:if test='${param.nationality != null}'> &amp;nationality=${param.nationality}</c:if>">
                                ${i}
                            </a>
                        </li>
                    </c:forEach>

                    <!-- Siguiente -->
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link"
                            href="?page=${currentPage + 1}<c:if test='${param.q != null}'> &amp;q=${param.q}</c:if><c:if test='${param.nationality != null}'> &amp;nationality=${param.nationality}</c:if>">
                            Siguiente »
                        </a>
                    </li>
                </ul>
            </nav>
        </c:if>