package servlet;

import dao.CustomerStatDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.CustomerStat;

@WebServlet(name = "CustomerStatServlet", urlPatterns = {"/customerStat"})
public class CustomerStatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("detail".equals(action)) {
            String customerIdStr = request.getParameter("id");
            int customerId;
            try {
                customerId = Integer.parseInt(customerIdStr);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Customer ID format.");
                return;
            }
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect(request.getContextPath() + "/customerStat"); 
                return;
            }
            ArrayList<CustomerStat> listCS = (ArrayList<CustomerStat>) session.getAttribute("lastCustomerStatList");
            CustomerStat foundCustomer = null; 
            for (CustomerStat cs : listCS) {
                if (cs.getId() == customerId) {
                    foundCustomer = cs;
                    break;
                }
            }
            if (foundCustomer != null) {
                session.setAttribute("customerDetail", foundCustomer);
                request.getRequestDispatcher("/listOrder").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/customerStat"); 
            }
        }else if("cleanup".equals(action)){
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.removeAttribute("customerDetail");
                session.removeAttribute("lastOrderList");
            }
            request.getRequestDispatcher("/CustomerStatView.jsp").forward(request, response);
        }else if(action == null){
            String startParam = request.getParameter("start");
            String endParam = request.getParameter("end");
            if (startParam == null || endParam == null || startParam.isEmpty() || endParam.isEmpty()) {
                request.getRequestDispatcher("/CustomerStatView.jsp").forward(request, response);
                return;
            }

            try {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                LocalDate localDateStart = LocalDate.parse(startParam, formatter);
                Date start = Date.valueOf(localDateStart);
                LocalDate localDateEnd = LocalDate.parse(endParam, formatter);
                Date end = Date.valueOf(localDateEnd);

                CustomerStatDAO csd = new CustomerStatDAO();
                ArrayList<CustomerStat> cs = csd.getCustomerStat(start, end);
                
                HttpSession session = request.getSession();
                session.setAttribute("lastCustomerStatList", cs);
                session.setAttribute("startDate", start);
                session.setAttribute("endDate", end);
                request.setAttribute("listCS", cs);
                
                request.getRequestDispatcher("/CustomerStatView.jsp").forward(request, response);
            } catch(java.time.format.DateTimeParseException e) {
                request.setAttribute("errorMessage", "Must be dd/MM/yyyy.");
                request.getRequestDispatcher("/CustomerStatView.jsp").forward(request, response);
                e.printStackTrace();
            } catch(Exception e) {
                request.setAttribute("errorMessage", "Can't load the list ?????");
                request.getRequestDispatcher("/CustomerStatView.jsp").forward(request, response);
                e.printStackTrace();
            }
        }
    }
}
