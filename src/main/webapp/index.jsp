<%@ page import="pl.mBoniecki.DTO.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>To Do App</title>
    <link rel="stylesheet" href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" type="text/css">
    <script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="webjars/popper.js/1.14.4/popper.min.js"></script>
</head>
<body>

<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="languages"/>

<a href="index.jsp?lang=pl_PL"><fmt:message key="language.polish"/></a>
<a href="index.jsp?lang=en_GB"><fmt:message key="language.english"/></a>
<a href="index.jsp?lang=de_DE"><fmt:message key="language.german"/></a>

<fmt:setBundle basename="labels"/>

    <h1>To Do List</h1>

    <%--<%--%>
        <%--Task task = new Task();--%>
        <%--task.setDescription("Do shopping");--%>
        <%--out.print(task);--%>
    <%--%>--%>

    <form id="contact-form" method="POST" action="index.jsp" role="form">
        <div class="messages"></div>
        <div class="controls">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="form_task">Task</label>
                        <input id="form_task"
                               type="text"
                               name="task"
                               class="form-control"
                               placeholder="Task name..."
                               required="required"
                               data-error="Task name is required">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="form_message">Task description</label>
                        <textarea id="form_message"
                                  name="message"
                                  class="form-control"
                                  placeholder="Task to do..."
                                  rows="4"
                                  required="required"
                                  data-error="Task description is required"></textarea>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">Submit task</button>
                </div>
            </div>
        </div>
    </form>

    <table cellspacing="5" cellpadding="10" border=1>
        <%
            Cookie[] cookies = request.getCookies();
            String taskCookie = request.getParameter("task");
            String messageCookie = request.getParameter("message");

            if (taskCookie != null && !taskCookie.isEmpty() &&
                    messageCookie != null && !messageCookie.isEmpty()) {
                Cookie cookie = new Cookie("task." + taskCookie, messageCookie);
                cookie.setMaxAge(60);
                response.addCookie(cookie);
                response.sendRedirect("index.jsp");
            }

            if (cookies.length > 0) {
                out.println("<tr>");
                out.println("<td>");
                out.print("Task name");
                out.println("</td>");
                out.println("<td>");
                out.print("Task description");
                out.println("</td>");
                out.println("</tr>");
                for (Cookie c : cookies) {
                    String cookieName = c.getName();
                    String cookieNamePrefix = cookieName.substring(0, 4);
                    int prefixCount = 0;
                    if (cookieNamePrefix.equals("task")) {
                        prefixCount++;
                        out.println("<tr>");
                        out.println("<td>");
                        out.print(c.getName().substring(5));
                        out.println("</td>");
                        out.println("<td>");
                        out.print(c.getValue());
                        out.println("</td>");
                        out.println("</tr>");
                    }
                    if (prefixCount == 0) {
                        out.println("No data to display");
                    }
                }
            }
        %>
    </table>
</body>
</html>
