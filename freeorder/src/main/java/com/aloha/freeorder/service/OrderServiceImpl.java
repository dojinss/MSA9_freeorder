package com.aloha.freeorder.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aloha.freeorder.domain.Order;
import com.aloha.freeorder.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> list() throws Exception {
        List<Order> orderList = orderMapper.list();
        return orderList;
    }

    @Override
    public Order read(String id) throws Exception {
        Order order = orderMapper.read(id);
        return order;
    }

    @Override
    public int insert(Order order) throws Exception {
        order.setId(UUID.randomUUID().toString());
        int result = orderMapper.insert(order);
        return result;
    }

    @Override
    public int update(Order order) throws Exception {
        int result = orderMapper.update(order);
        return result;
    }

    @Override
    public int delete(String id) throws Exception {
        int result = orderMapper.delete(id);
        return result;
    }    
    
}
