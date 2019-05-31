package uuu.gtt.entity;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Cart {

    private Customer member;
    private Map<CartItem, Integer> cart = new HashMap<>();

    public Customer getMember() {
        return member;
    }

    public void setMember(Customer member) {
        this.member = member;
    }

    //以下提供修改Map內容的mutator(s):          
    public void add(Product p) {
        add(p, 1);
    }

    public void add(Product p, int quantity) {
        CartItem item = new CartItem(p);
        Integer oldQ = cart.get(item);
        if (oldQ != null) {
            quantity = quantity + oldQ;
        }
        cart.put(item, quantity);
    }

    public void update(Product p, int quantity) {
        CartItem item = new CartItem(p);
        cart.put(item, quantity);
    }

    public void remove(Product p) {
        CartItem item = new CartItem(p);
        cart.remove(item);
    }

    public int getSize() {
        return cart.size();
    }

    public boolean isEmpty() {
        return cart.isEmpty();
    }

    public Set<CartItem> getCartItemSet() {
        return cart.keySet();
    }
    
    public int getItemQuantity(CartItem item) {
        Integer q = cart.get(item);
        return q == null ? 0 : q;
    }

    public int getTotalQuantity() { // 總件數
        Collection<Integer> values = cart.values();
        int total = 0;
        for (Integer i : values) {
            if (i != null) {
                total = total + i;
            }
        }
        return total;
    }

    public double getTotalAmount() {
        double sum = 0;
        for (CartItem item : cart.keySet()) {
            double price = item.getProduct().getPrice();
            Integer qty = cart.get(item);
            if (qty != null) {
                sum = sum + (price * qty);
            }
        }
        return sum;
    }

    public double getTotalDiscountedAmount() {
            return getTotalAmount();
    }

    @Override
    public String toString() {
        return "購買人=" + member + ",\n 明細=" + cart 
                + ",\n共買了" + this.getSize() + "項,"
                + this.getTotalQuantity() + "件,"
                + this.getTotalAmount() + "元,"
                + this.getTotalDiscountedAmount() + "元(折扣後)";
    }
    
}
