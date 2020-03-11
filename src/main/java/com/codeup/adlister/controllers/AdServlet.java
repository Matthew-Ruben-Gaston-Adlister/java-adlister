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
import java.util.List;

@WebServlet(name = "controllers.AdServlet", urlPatterns = "/ads/ad")
public class AdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("id", request.getParameter("id"));
        int adId = Integer.parseInt( (String) session.getAttribute("id"));
        session.setAttribute("catId", DaoFactory.getAdsDao().chosenAd(adId));
//        List<Ad> one = (List<Ad>)session.getAttribute("catId");
//        Ad two = one.get(0);
//        session.setAttribute("adCategory", DaoFactory.getCategoriesDao().getCategory((int)two.getCategoryId()));
        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
    }

}