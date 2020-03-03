package com.hbsi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hbsi.domain.Book;
import com.hbsi.utils.DBManager;

public class BookDaoImpl implements BookDao{

	@Override
	public Book find(String id) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			String sql = "select * from book where id=?";
			pt = conn.prepareStatement(sql);
			
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			//Book b = null;
			if(rs.next()){
				Book b = new Book();
				b.setId(rs.getString("id"));
				b.setName(rs.getString("name"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getDouble("price"));
				b.setDescription(rs.getString("description"));
				return b;
				
			}
			return null;
			

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			DBManager.closeDB(conn, pt, rs);
		}
	}

	@Override
	public List<Book> getAll() {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			String sql = "select id,name,author,price,description from book";
			pt = conn.prepareStatement(sql);
			rs = pt.executeQuery();

			List<Book> list = new ArrayList<Book>();

			while (rs.next()) {
				Book b = new Book();
				b.setId(rs.getString("id"));
				b.setName(rs.getString("name"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getDouble("price"));
				b.setDescription(rs.getString("description"));

				list.add(b);

			}
			return list;

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			DBManager.closeDB(conn, pt, rs);
		}

	}

}
