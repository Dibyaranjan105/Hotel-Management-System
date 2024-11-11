package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.io.Serializable;



import Dao.CustomerDAO;
import Dao.CustomerDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

@WebServlet("/CheckIn")
public class CheckInServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 1L;
    private CustomerDAO customerDAO;

    public void init() {
        customerDAO = new CustomerDAOImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Customer customer = new Customer();
        customer.setCustomerId(request.getParameter("customerid"));
        customer.setName(request.getParameter("name"));
        customer.setEmail(request.getParameter("email"));
        customer.setMobile(request.getParameter("mobile"));
        customer.setIdType(request.getParameter("idType"));
        customer.setIdNumber(request.getParameter("idNumber"));
        customer.setCheckInDate(Date.valueOf(request.getParameter("checkindate")));
        customer.setCheckInTime(Time.valueOf(request.getParameter("checkInTime") + ":00"));

        if (customerDAO.checkIn(customer)) {
            request.setAttribute("MESSAGE", "Check-in successful!");
        } else {
            request.setAttribute("MESSAGE", "Check-in failed. Please try again.");
        }
        
        request.getRequestDispatcher("checkin.jsp").forward(request, response);
    }
}