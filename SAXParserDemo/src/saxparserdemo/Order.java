/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package saxparserdemo;

import java.util.List;

/**
 *
 * @author KienLT
 */
public class Order {
    private String code;
    private String orderDate;
    private String content;
    private List<Item> items;

    public Order() {
    }

    public Order(String code, String orderDate, String content, List<Item> items) {
        this.code = code;
        this.orderDate = orderDate;
        this.content = content;
        this.items = items;
    }

    public Order(String code, String orderDate, String content) {
        this.code = code;
        this.orderDate = orderDate;
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Order{" + "code=" + code + ", orderDate=" + orderDate + ", content=" + content + ", items=" + items + '}';
    }
}
