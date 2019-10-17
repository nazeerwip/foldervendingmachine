/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.vendingmachinewebapp.service;

import com.tsguild.vendingmachinewebapp.dao.ItemDao;
import com.tsguild.vendingmachinewebapp.model.Item;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jimmy Cook
 */
@Service
public class ItemServiceImpl implements ItemService {

	private ItemDao itemDao;

	public void setItemDao(ItemDao ItemDao) {
		this.itemDao = ItemDao;
	}

	@Override
	@Transactional
	public Item addItem(Item item) {
		Item items=itemDao.addItem(item);
		return items;
	}

	@Override
	@Transactional
	public Item getItemById(int id) {
			Item item = itemDao.getItemById(id);
			return item;
	}

	@Override
	@Transactional
	public List<Item> getAllItems() {
		List<Item> itemsList = itemDao.getAllItems();
		return itemsList;
	}

	@Override
	@Transactional
	public void updateItem(Item item) {
		itemDao.updateItem(item);
	}

	@Override
	@Transactional
	public void removeItem(int id) {
		itemDao.removeItem(id);
	}

	@Override
	@Transactional
	public List<Item> searchItemsByName(String name) {
		List<Item> itemsList=itemDao.searchItemsByName(name);
		return itemsList;
	}

}
