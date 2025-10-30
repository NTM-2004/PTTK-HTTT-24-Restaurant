package model;

public class Table {
    private int id;
    private String type;
    private boolean available;
    private float price;

    public Table() {}

    public Table(int id, String type, boolean available, float price) {
        this.id = id;
        this.type = type;
        this.available = available;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
}
