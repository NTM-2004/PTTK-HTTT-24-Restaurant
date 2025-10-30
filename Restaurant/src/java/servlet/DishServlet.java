package servlet;

import dao.DishDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Dish;

@WebServlet(name = "DishServlet", urlPatterns = {"/dish/*"})
public class DishServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action == null || action.equals("/")) {
            try {
                DishDAO dd = new DishDAO();
                ArrayList<Dish> dishes = dd.getAllDish();

                request.setAttribute("listDish", dishes);
                
                request.getRequestDispatcher("/ManageDishView.jsp").forward(request, response);
                
            } catch (Exception e) {
                request.setAttribute("errorMessage", "Something wrong :D");
                request.getRequestDispatcher("/ManagementHomeView.jsp").forward(request, response);
                e.printStackTrace();
            }
        } else {
             response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        DishDAO dd = new DishDAO();
        try {
            switch (action) {
                case "/add" -> {
                    Dish dish = new Dish();
                    dish.setName(request.getParameter("name"));
                    dish.setPrice(Float.parseFloat(request.getParameter("price"))); 
                    dish.setDescription(request.getParameter("description"));
                    boolean result = dd.addDish(dish);
                    
                    if(result == true){
                        response.sendRedirect(request.getContextPath() + "/dish"); 
                    }else{
                        request.setAttribute("errorMessage", ":((((((((((((((");                
                        request.getRequestDispatcher("/AddDishView.jsp").forward(request, response);
                    }
                }
                default -> {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        } catch (IOException | NumberFormatException e) {
            request.setAttribute("errorMessage", "Unexcepted data?");
            e.printStackTrace();
        }
    }
}
