/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.vendingmachinewebapp.controller;

import com.tsguild.vendingmachinewebapp.model.Item;
import com.tsguild.vendingmachinewebapp.service.ItemService;

import java.util.List;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author Jimmy Cook
 */
@Controller
public class AdminController {
    
    private ItemService itemService;
    
    @Autowired(required=true)
	@Qualifier(value="itemService")
	public void setPersonService(ItemService itemService){
		this.itemService = itemService;
	}
    
    @RequestMapping(value= "home", method = RequestMethod.GET)
    public String displayHomePage(){
        return "home";
    }
    
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/item", method = RequestMethod.POST)
    public Item createItem(@Valid @RequestBody Item item){
        itemService.addItem(item);
        return item;
    }
    
    @ResponseBody
    @RequestMapping(value = "/item/{id}", method = RequestMethod.GET)
    public Item getItemById(@PathVariable int id){
        return itemService.getItemById(id);
    }
    
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/item/{id}", method = RequestMethod.DELETE)
    public void deleteItem(@PathVariable int id){
        itemService.removeItem(id);
    }
    
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/item/{id}", method = RequestMethod.PUT)
    public void updateItem(@PathVariable int id, @Valid @RequestBody Item item){
        item.setId(id);
        itemService.updateItem(item);
    }
    
    @ResponseBody
    @RequestMapping(value = "/allitems", method = RequestMethod.GET)
    public List<Item> getAllItems(){
        return itemService.getAllItems();
    }
}
