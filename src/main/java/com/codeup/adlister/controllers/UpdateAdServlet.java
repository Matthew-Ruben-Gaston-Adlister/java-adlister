
package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//comment
@WebServlet(name = "controllers.UpdateAdServlet", urlPatterns = "/updateAd")
public class UpdateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/updateAd.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String title = request.getParameter("editTitle");
        String description = request.getParameter("editDescription");
        String price = request.getParameter("editPrice");

        if (title != null && description != null && price != null) {
            try {
                Ad ad = DaoFactory.getAdsDao().getAdById( Integer.parseInt((String)session.getAttribute("id")));
                ad.setTitle(title);
                ad.setDescription(description);
                ad.setPrice(price);
                DaoFactory.getAdsDao().updateAd(ad);
                response.sendRedirect("/profile");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("/updateAd");
        }
    }
}