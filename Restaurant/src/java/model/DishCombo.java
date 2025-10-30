package model;

public class DishCombo {
    private int id;
    private int amount;
    private Dish dish;

    public DishCombo() {}

    public DishCombo(int id, int amount, Dish dish) {
        this.id = id;
        this.amount = amount;
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

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }
    
    
}
