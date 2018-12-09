<%
    session.removeAttribute("haslogined");
    response.sendRedirect("login.jsp");
%>