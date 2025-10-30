package model;

import java.util.ArrayList;

public class Combo {
    private int id;
    private String name;
    private float price;
    private String description;
    private ArrayList<DishCombo> listDish;

    public Combo() {}

    public Combo(int id, String name, float price, String description, ArrayList<DishCombo> listDish) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.listDish = listDish;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<DishCombo> getListDish() {
        return listDish;
    }

    public void setListDish(ArrayList<DishCombo> listDish) {
        this.listDish = listDish;
    }
    
}
