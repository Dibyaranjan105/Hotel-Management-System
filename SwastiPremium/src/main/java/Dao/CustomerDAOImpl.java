package Dao; 

import java.sql.*;

import Util.DBConnection;
import model.Customer;

public class CustomerDAOImpl implements CustomerDAO {
    private Connection connection;

    public CustomerDAOImpl() {
        connection = DBConnection.getConnection();
    }

    @Override
    public boolean checkIn(Customer customer) {
    	 PreparedStatement ps = null;
        try {
            String sql = "INSERT INTO customer_stays (customer_id, name, email, mobile, id_type, " +
                    "id_number, check_in_date, check_in_time, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps1 = connection.prepareStatement(sql);
            ps1.setString(1, customer.getCustomerId());
            ps1.setString(2, customer.getName());
            ps1.setString(3, customer.getEmail());
            ps1.setString(4, customer.getMobile());
            ps1.setString(5, customer.getIdType());
            ps1.setString(6, customer.getIdNumber());
            ps1.setDate(7, customer.getCheckInDate());
            ps1.setTime(8, customer.getCheckInTime());
            ps1.setString(9, "CHECKED_IN");

            return ps1.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public boolean checkOut(String customerId, java.sql.Date checkOutDate, java.sql.Time checkOutTime) {
        PreparedStatement ps = null;
        try {
            String sql = "UPDATE customer_stays SET check_out_date = ?, check_out_time = ?, " +
                    "status = 'CHECKED_OUT' WHERE customer_id = ? AND status = 'CHECKED_IN'";

            ps = connection.prepareStatement(sql);
            ps.setDate(1, checkOutDate);
            ps.setTime(2, checkOutTime);
            ps.setString(3, customerId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public Customer getCustomer(String customerId) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM customer_stays WHERE customer_id = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, customerId);

            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getString("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
                customer.setMobile(rs.getString("mobile"));
                customer.setIdType(rs.getString("id_type"));
                customer.setIdNumber(rs.getString("id_number"));
                customer.setCheckInDate(rs.getDate("check_in_date"));
                customer.setCheckInTime(rs.getTime("check_in_time"));
                customer.setCheckOutDate(rs.getDate("check_out_date"));
                customer.setCheckOutTime(rs.getTime("check_out_time"));
                customer.setStatus(rs.getString("status"));
                return customer;
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

	@Override
	public boolean checkIn1(Customer customer) {
	
		return false;
	}
}