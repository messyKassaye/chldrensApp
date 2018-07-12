package errors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AppErrorHandler")
public class AppErrorHandler extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        proccess(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        proccess(request, response);

    }

    public void proccess(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.Exception");

        Integer status_code = (Integer) request.getAttribute("javax.servlet.error.status_code");

        String servlet_name = (String) request.getAttribute("javax.servlet.error.servlet_name");

        String request_url = (String) request.getAttribute("javax.servlet.error.request_url");

        String message = "";
        if (status_code == 404) {
            response.sendRedirect("404.jsp");
        } else {

            PrintWriter out = response.getWriter();
            out.write("<h3>Exception Details</h3>");
            out.write("<ul><li>Servlet Name:" + servlet_name + "</li>");
            out.write("<li>Exception Name:" + throwable.getClass().getName() + "</li>");
            out.write("<li>Requested URI:" + request_url + "</li>");
            out.write("<li>Exception Message:" + throwable.getMessage() + "</li>");
            out.write("</ul>");
        }
    }
}
