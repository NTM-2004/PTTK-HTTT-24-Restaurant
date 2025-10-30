package servlet;

import dao.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import model.CustomerStat;
import model.Order;

@WebServlet(name = "OrderServlet", urlPatterns = {"/listOrder"})
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("detail".equals(action)) {
            String orderIdStr = request.getParameter("id");
            int orderId;
            try {
                orderId = Integer.parseInt(orderIdStr);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID format.");
                return;
            }
            HttpSession session = request.getSession();
            if (session == null) {
                response.sendRedirect(request.getContextPath() + "/listOrder"); 
                return;
            }
            ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("lastOrderList");
            if (orders == null) {
                response.sendRedirect(request.getContextPath() + "/listOrder"); 
                return;
            }
            Order foundOrder = null;
            for (Order o : orders) {
                if (o.getId() == orderId) {
                    foundOrder = o;
                    break;
                }
            }
            if (foundOrder != null) {
                session.setAttribute("orderDetail", foundOrder);
                request.getRequestDispatcher("/listOrder?action=list").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Can't find detail.");
                request.getRequestDispatcher("/ListOrderView.jsp").forward(request, response);
            }
        }else if("list".equals(action)){
            try{
                HttpSession session = request.getSession();
                OrderDAO od = new OrderDAO();
                Order o = (Order) session.getAttribute("orderDetail");
                Order resultOrder = od.getListDishAndCombo(o);
                
                request.setAttribute("order", resultOrder);
                request.getRequestDispatcher("/OrderStatView.jsp").forward(request, response);
            }catch(Exception e){
                e.printStackTrace();
                request.setAttribute("errorMessage", "Can't load the list ?????");
                request.getRequestDispatcher("/OrderStatView.jsp").forward(request, response);
            }
        } else if("cleanup".equals(action)){
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.removeAttribute("orderDetail");
            }
            response.sendRedirect(request.getContextPath() + "/listOrder");
        }else if(action == null){
            try {
                HttpSession session = request.getSession();
                OrderDAO od = new OrderDAO();
                ArrayList<Order> orders = od.getListOrder(
                        ((CustomerStat) session.getAttribute("customerDetail")).getId(),
                        (Date) session.getAttribute("startDate"), 
                        (Date) session.getAttribute("endDate"));
                
                session.setAttribute("lastOrderList", orders);
                request.setAttribute("listOrders", orders);
                request.getRequestDispatcher("/ListOrderView.jsp").forward(request, response);
            } catch(Exception e) {
                request.setAttribute("errorMessage", "Can't load the list ?????");
                request.getRequestDispatcher("/ListOrderView.jsp").forward(request, response);
                e.printStackTrace();
            }
        }
    }
}
