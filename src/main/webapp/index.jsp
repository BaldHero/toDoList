<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${cookie.lang.value}"/>
<fmt:setBundle basename="labels"/>
<fmt:setBundle basename="languages" var="languages"/>


<html>
<head>
    <title><fmt:message key="application.name"/></title>
    <link rel="stylesheet" href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" type="text/css">
    <script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="webjars/popper.js/1.14.4/popper.min.js"></script>
</head>
<body>

<fmt:setLocale value="${cookie.lang.value}"/>
<fmt:setBundle basename="languages" var="languages"/>

<a href="/language?lang=pl_PL"><fmt:message key="language.polish" bundle="${languages}"/></a>
<a href="/language?lang=en_GB"><fmt:message key="language.english" bundle="${languages}"/></a>
<a href="/language?lang=de_DE"><fmt:message key="language.german" bundle="${languages}"/></a>

<fmt:setBundle basename="labels"/>

<h1><fmt:message key="application.name"/></h1>

<form id="contact-form" method="POST" action="/task" role="form">
    <div class="messages"></div>
    <div class="controls">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_task"><fmt:message key="task.label"/></label>
                    <input id="form_task"
                           type="text"
                           name="task"
                           class="form-control"
                           placeholder="<fmt:message key="task.name"/>"
                           required="required"
                           data-error="<fmt:message key="field.error"/>">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="form_message"><fmt:message key="message.label"/></label>
                    <textarea id="form_message"
                              name="message"
                              class="form-control"
                              placeholder="<fmt:message key="message.name"/>"
                              rows="4"
                              required="required"
                              data-error="<fmt:message key="field.error"/>"></textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-12">
                <button type="submit" class="btn btn-primary"><fmt:message key="button.submit"/></button>
            </div>
        </div>
    </div>
</form>

<c:choose>
    <c:when test="${task==null || task.isEmpty()}">
        <div class="text-center"><fmt:message key="task.empty"/></div>
    </c:when>
    <c:otherwise>
        <table cellspacing="5" cellpadding="10" border=1>
            <tr><td><fmt:message key="task.label"/></td>
                <td><fmt:message key="message.label"/></td>
                <td><fmt:message key="task.delete_column"/></td></tr>
            <c:forEach var="item" items="${task}">
                <c:url var="deleteUrl" value="task">
                    <c:param name="id" value="${item.id}"/>
                </c:url>
                <tr><td>${item.name}</td>
                    <td>${item.description}</td>
                    <td><a href="${deleteUrl}"><fmt:message key="task.delete"/></a></td></tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>