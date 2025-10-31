package servlet;

import dao.StaffDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;

@WebServlet(name = "StaffServlet", urlPatterns = {"/login", "/", "/logout"})
public class StaffServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/login".equals(path)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                StaffDAO sd = new StaffDAO();
                Staff staff = sd.checkLogin(username, password);
                
                if (staff != null && staff.getId() != 0) { 
                    HttpSession session = request.getSession();
                    session.setAttribute("staff", staff);                    
                    
                    response.sendRedirect(request.getContextPath() + "/ManagementHomeView.jsp"); 
                    
                } else {
                    request.setAttribute("errorMessage", "Sai tên đăng nhập hoặc mật khẩu.");
                    request.getRequestDispatcher("/LoginView.jsp").forward(request, response);
                }
            } catch (Exception e) {
                request.setAttribute("errorMessage", ":(((((((((((((");
                request.getRequestDispatcher("/LoginView.jsp").forward(request, response);
                e.printStackTrace();
            }
        } 
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/logout".equals(path)) {
            HttpSession session = request.getSession(false); 
            if (session != null) {
                session.invalidate(); 
            }
            
            response.sendRedirect(request.getContextPath() + "/LoginView.jsp"); 
        } else {
            request.getRequestDispatcher("/LoginView.jsp").forward(request, response);
        }
    }
}
