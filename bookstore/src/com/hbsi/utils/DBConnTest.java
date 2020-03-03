package com.hbsi.utils;
import org.junit.Test;

import com.hbsi.utils.DBConn;

public class DBConnTest {
	@Test
	public void getConn(){
		System.out.println(DBConn.getConn());
	}
}
