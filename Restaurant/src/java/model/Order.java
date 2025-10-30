package model;

import java.util.ArrayList;

public class Order {
    private int id;
    private float price;
    private String note;
    private boolean status;
    private String type;
    private Reservation res;
    private ArrayList<DishOrder> listDish;
    private ArrayList<ComboOrder> listCombo;

    public Order() {}

    public Order(int id, float price, String note, boolean status, String type, Reservation res, ArrayList<DishOrder> listDish, ArrayList<ComboOrder> listCombo) {
        this.id = id;
        this.price = price;
        this.note = note;
        this.status = status;
        this.type = type;
        this.res = res;
        this.listDish = listDish;
        this.listCombo = listCombo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Reservation getRes() {
        return res;
    }

    public void setRes(Reservation res) {
        this.res = res;
    }

    public ArrayList<DishOrder> getListDish() {
        return listDish;
    }

    public void setListDish(ArrayList<DishOrder> listDish) {
        this.listDish = listDish;
    }

    public ArrayList<ComboOrder> getListCombo() {
        return listCombo;
    }

    public void setListCombo(ArrayList<ComboOrder> listCombo) {
        this.listCombo = listCombo;
    }
   
}
