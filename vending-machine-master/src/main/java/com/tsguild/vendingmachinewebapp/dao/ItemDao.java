/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.vendingmachinewebapp.dao;

import com.tsguild.vendingmachinewebapp.model.Item;
import java.util.List;

/**
 *
 * @author Jimmy Cook
 */
public interface ItemDao {
    
    public Item addItem(Item item);
    
    public Item getItemById(int id);
    public List<Item> getAllItems();
    
    public void updateItem(Item item);
    
    public void removeItem(int id);
    
    public List<Item> searchItemsByName(String name);
    
    
}
