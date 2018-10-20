<%@ page import="pl.mBoniecki.DTO.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>To Do App</title>
    <link rel="stylesheet" href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" type="text/css">
    <script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="webjars/popper.js/1.14.4/popper.min.js"></script>
</head>
<body>
    <h1>To Do List</h1>

    <%!
        List<Cookie> cookies = new ArrayList<>();
    %>

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
                               data-error="Task name is required"
                               ">
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
                                  data-error="Task description is required"
                                  "></textarea>
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
            String task = request.getParameter("task");
            String message = request.getParameter("message");

            if (task != null && !task.isEmpty()) {
                Cookie cookie = new Cookie("task", task);
                cookie.setMaxAge(60);
                response.addCookie(cookie);
                cookies.add(cookie);
            }
            if (message != null && !message.isEmpty()) {
                Cookie cookie = new Cookie("message", message);
                cookie.setMaxAge(60);
                response.addCookie(cookie);
                cookies.add(cookie);
            }

            out.println("<tr>");
            out.println("<td>");
            out.print("Name");
            out.println("</td>");
            out.println("<td>");
            out.print("Task");
            out.println("</td>");
            out.println("</tr>");
            for (Cookie c : cookies) {
                out.println("<tr>");
                out.println("<td>");
                out.print(c.getName());
                out.println("</td>");
                out.println("<td>");
                out.print(c.getValue());
                out.println("</td>");
                out.println("</tr>");
            }
        %>
    </table>

</body>
</html>
