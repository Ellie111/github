package com.jdbc;

import java.io.File;

public interface JdbcDataUtil {
	//数据库存储文件路径
	static String dataPathCVS = System.getProperty("user.dir") + File.separatorChar +"JDBCDATA" + File.separatorChar;
	
	//编写数据库自增列的路径
	static String identityPath = System.getProperty("user.dir") + File.separatorChar +"JDBCDATA" + File.separatorChar + JdbcBasicPro.identityKey.toString() + ".csv";
}
