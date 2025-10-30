package model;

import java.util.Date;

public class Reservation {
    private int id;
    private Date reservationDate;
    private String type;
    private Date checkin;
    private Date checkout;
    private boolean status;
    private Table table;
    private Customer customer;

    public Reservation() {}

    public Reservation(int id, Date reservationDate, String type, Date checkin, Date checkout, boolean status, Table table, Customer customer) {
        this.id = id;
        this.reservationDate = reservationDate;
        this.type = type;
        this.checkin = checkin;
        this.checkout = checkout;
        this.status = status;
        this.table = table;
        this.customer = customer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    
}
