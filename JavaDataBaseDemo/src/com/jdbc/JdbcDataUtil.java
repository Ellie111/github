package com.jdbc;

import java.io.File;

public interface JdbcDataUtil {
	//���ݿ�洢�ļ�·��
	static String dataPathCVS = System.getProperty("user.dir") + File.separatorChar +"JDBCDATA" + File.separatorChar;
	
	//��д���ݿ������е�·��
	static String identityPath = System.getProperty("user.dir") + File.separatorChar +"JDBCDATA" + File.separatorChar + JdbcBasicPro.identityKey.toString() + ".csv";
}
