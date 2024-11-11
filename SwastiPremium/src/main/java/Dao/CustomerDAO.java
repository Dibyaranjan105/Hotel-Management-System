package Dao;

import java.sql.Date;
import java.sql.Time;

import model.Customer;

public interface CustomerDAO {
    boolean checkIn(Customer customer);
    boolean checkOut(String customerId, Date checkOutDate, Time checkOutTime);
    Customer getCustomer(String customerId);
	boolean checkIn1(Customer customer);
}