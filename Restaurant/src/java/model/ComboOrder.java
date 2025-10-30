package model;

public class ComboOrder {
    private int id;
    private int amount;
    private float price;
    private Combo combo;

    public ComboOrder() {}

    public ComboOrder(int id, int amount, float price, Combo combo) {
        this.id = id;
        this.amount = amount;
        this.price = price;
        this.combo = combo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Combo getCombo() {
        return combo;
    }

    public void setCombo(Combo combo) {
        this.combo = combo;
    }
    
    
}
