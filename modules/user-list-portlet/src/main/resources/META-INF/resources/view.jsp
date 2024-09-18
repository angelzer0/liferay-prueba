<%@ taglib uri="http://liferay.com/tld/portlet" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Menu</h1>

        <a class="btn btn-primary" href="<portlet:renderURL><portlet:param name='mvcRenderCommandName' value='view_user_details'/></portlet:renderURL>">Ver Usuarios</a>

    </div>
</body>
</html>
