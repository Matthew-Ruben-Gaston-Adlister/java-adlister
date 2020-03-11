package com.codeup.adlister.controllers;

        import com.codeup.adlister.dao.DaoFactory;

        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

@WebServlet(name = "controllers.DeleteAdServlet", urlPatterns = "/delete")
public class DeleteAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        DaoFactory.getAdsDao().delete(Integer.parseInt(request.getParameter("ad_id")));
        response.sendRedirect("/profile");
    }
}