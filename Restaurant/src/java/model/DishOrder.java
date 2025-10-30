package model;

public class DishOrder {
    private int id;
    private int amount;
    private float price;
    private Dish dish;

    public DishOrder() {}

    public DishOrder(int id, int amount, float price, Dish dish) {
        this.id = id;
        this.amount = amount;
        this.price = price;
        this.dish = dish;
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

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }
    
}
