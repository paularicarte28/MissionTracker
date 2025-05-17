<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" %>

        <c:if test="${totalPages > 1}">
            <nav aria-label="Astronaut pagination" class="mt-5">
                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item <c:if test='${i == currentPage}'>active</c:if>">
                            <a class="page-link"
                                href="?page=${i}<c:if test='${param.q != null}'> &amp;q=${param.q}</c:if><c:if test='${param.nationality != null}'> &amp;nationality=${param.nationality}</c:if>">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>