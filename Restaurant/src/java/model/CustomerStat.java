package model;

import java.util.Date;

public class CustomerStat extends Customer{
    private float revenue;
    private Date date;

    public CustomerStat() {}

    public CustomerStat(float revenue, Date date) {
        this.revenue = revenue;
        this.date = date;
    }

    public CustomerStat(float revenue, Date date, int id, String name, String phone, String email) {
        super(id, name, phone, email);
        this.revenue = revenue;
        this.date = date;
    }

    public float getRevenue() {
        return revenue;
    }

    public void setRevenue(float revenue) {
        this.revenue = revenue;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
