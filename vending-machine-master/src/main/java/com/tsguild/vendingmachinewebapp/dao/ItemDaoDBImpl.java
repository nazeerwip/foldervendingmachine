/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.vendingmachinewebapp.dao;

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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jimmy Cook
 */
@Repository
public class ItemDaoDBImpl implements ItemDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public Item addItem(Item item) {
		Session session = this.sessionFactory.getCurrentSession();
		Long id = (Long) session.save(item);

		item.setId(id.intValue());

		return item;
	}

	@Override
	public Item getItemById(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Item item = (Item) session.load(Item.class, new Integer(id));
			return item;
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}

	@Override
	public List<Item> getAllItems() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Item> itemsList = session.createQuery("from Item").list();
		return itemsList;
	}

	@Override
	public void updateItem(Item item) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(item);
	}

	@Override
	public void removeItem(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Item p = (Item) session.load(Item.class, new Integer(id));
		if (null != p) {
			session.delete(p);
		}
	}

	@Override
	public List<Item> searchItemsByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Item> itemsList = session.createQuery("from Item where name=" + name).list();
		return itemsList;
	}

}
