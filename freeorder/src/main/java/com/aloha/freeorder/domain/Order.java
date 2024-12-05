package com.aloha.freeorder.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Order {
    
    private String id;
    private String userId;
    private String title;
    private int totalQuantity;
    private int totalCount;
    private int totalPrice;
    private String status;
    private Date orderedAt;
    private Date createdAt;
    private Date updatedAt;

    private List<OrderItem> itemList;
}
