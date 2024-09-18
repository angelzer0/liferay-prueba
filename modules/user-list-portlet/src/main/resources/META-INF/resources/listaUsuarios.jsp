<%@ taglib uri="http://liferay.com/tld/portlet" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.example.userlist.constants.MVCCommandNames" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Lista de Usuarios</h1>
        <form action="<portlet:renderURL><portlet:param name='mvcRenderCommandName' value='<%= MVCCommandNames.LIST_USERS %>'/></portlet:renderURL>" method="get" class="mb-4">
            <div class="form-row align-items-end">
                <div class="col-md-3">
                    <label for="searchField">Buscar por:</label>
                    <select id="searchField" name="searchField" class="form-control">
                        <option value="" <c:if test="${empty param.searchField}">selected</c:if>>Selecciona un campo</option>
                        <option value="name" <c:if test="${param.searchField == 'name'}">selected</c:if>>Nombre</option>
                        <option value="surname1" <c:if test="${param.searchField == 'surname1'}">selected</c:if>>Apellido 1</option>
                        <option value="surname2" <c:if test="${param.searchField == 'surname2'}">selected</c:if>>Apellido 2</option>
                        <option value="email" <c:if test="${param.searchField == 'email'}">selected</c:if>>Correo</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <input type="text" name="searchValue" class="form-control" placeholder="Buscar" value="${param.searchValue}">
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary btn-block">Buscar</button>
                </div>
            </div>
        </form>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Nombre</th>
                    <th>Apellido 1</th>
                    <th>Apellido 2</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.email}</td>
                        <td>${user.name}</td>
                        <td>${user.surname1}</td>
                        <td>${user.surname2}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${page > 1}">
                    <li class="page-item">
                        <a class="page-link" href="<portlet:renderURL><portlet:param name='mvcRenderCommandName' value='<%= MVCCommandNames.LIST_USERS %>'/><portlet:param name='page' value='${page - 1}'/><portlet:param name='searchField' value='${param.searchField}'/><portlet:param name='searchValue' value='${param.searchValue}'/></portlet:renderURL>" aria-label="Previous">
                            <span aria-hidden="true"><</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach var="i" begin="1" end="${total / pageSize + 1}">
                    <c:if test="${i != 5}">
                        <li class="page-item <c:if test="${i == page}">active</c:if>">
                            <a class="page-link" href="<portlet:renderURL><portlet:param name='mvcRenderCommandName' value='<%= MVCCommandNames.LIST_USERS %>'/><portlet:param name='page' value='${i}'/><portlet:param name='searchField' value='${param.searchField}'/><portlet:param name='searchValue' value='${param.searchValue}'/></portlet:renderURL>">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <c:if test="${page < (total / pageSize)}">
                    <li class="page-item">
                        <a class="page-link" href="<portlet:renderURL><portlet:param name='mvcRenderCommandName' value='<%= MVCCommandNames.LIST_USERS %>'/><portlet:param name='page' value='${page + 1}'/><portlet:param name='searchField' value='${param.searchField}'/><portlet:param name='searchValue' value='${param.searchValue}'/></portlet:renderURL>" aria-label="Next">
                            <span aria-hidden="true">></span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</body>
</html>
