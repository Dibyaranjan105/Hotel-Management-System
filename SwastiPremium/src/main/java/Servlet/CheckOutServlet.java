package Servlet;  

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

import Dao.CustomerDAO;
import Dao.CustomerDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/checkout")  
public class CheckOutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;  
    private CustomerDAO customerDAO;  

    @Override
    public void init() throws ServletException {  
        super.init();  
        customerDAO = new CustomerDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String customerId = request.getParameter("customerid");
            
           
            if (customerId == null || customerId.trim().isEmpty()) {
                request.setAttribute("MESSAGE", "Customer ID is required");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
                return;
            }

            
            Date checkOutDate;
            Time checkOutTime;
            try {
                checkOutDate = Date.valueOf(request.getParameter("checkoutdate"));
                checkOutTime = Time.valueOf(request.getParameter("checkouttime") + ":00");  
            } catch (IllegalArgumentException e) {
                request.setAttribute("MESSAGE", "Invalid date or time format");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
                return;
            }

            if (customerDAO.checkOut(customerId, checkOutDate, checkOutTime)) {
                request.setAttribute("MESSAGE", "Check-out successful!");
            } else {
                request.setAttribute("MESSAGE", "Check-out failed. Please try again.");
            }

        } catch (Exception e) {
           
            request.setAttribute("MESSAGE", "An error occurred during check-out");
        }
        
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }
}