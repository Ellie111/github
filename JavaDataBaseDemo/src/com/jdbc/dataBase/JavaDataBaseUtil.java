package com.jdbc.dataBase;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;

import com.jdbc.JdbcBasicPro;
import com.jdbc.JdbcDataUtil;

/** 
* @ClassName: JavaDataBaseUtil 
* @Description: jdbc根据类，主要的根据全部集中在这
* @author 
* @date 
*/
public class JavaDataBaseUtil {

	private static Vector<String> vecTemp = new Vector<String>();//save the data of database
	
	/** 
	* @Title: isTable 
	* @Description: 判断是否存在表
	* @param @param tableName
	* @param @return  参数说明 
	* @return boolean    返回类型 
	* @throws 
	*/
	public static boolean isTable(String tableName){
		File files = new File(JdbcDataUtil.dataPathCVS);
		//不存在就创建
		if(!files.exists()){
			files.mkdir();
		}
		
		if (files.isDirectory()){
			File[] fileList = files.listFiles();
			if(fileList.length == 0 || fileList == null){
				return false;
			}else{
				for(File file : fileList){
					String fileName = file.getName().substring(0,file.getName().indexOf("."));
					if(fileName.equals(tableName)){
						return true;
					}
				}
			}
		}else{
			System.out.println("error : 此"+JdbcDataUtil.dataPathCVS+"是文件，不是文件夹");
		}
		return false;
	}
	
	/** 
	* @Title: getPrimaryKey 
	* @Description: 遍历每个字段，看是否含有主键的字段
	* @param @param fieldName
	* @param @return  参数说明 
	* @return String    返回类型 
	* @throws 
	*/
	public static String getIdentity(String fieldName){
		if(fieldName.indexOf('.') != -1){
			//判断最后的一个是不是主键
			String lastIndex = fieldName.substring(fieldName.indexOf(".")+1,fieldName.length());
			if(lastIndex.equals(JdbcBasicPro.identityKey.toString())){
				fieldName = fieldName.substring(0,fieldName.indexOf("."));
			}
		}
		return fieldName;
	}
	
	/** 
	* @Title: getDataWrite 
	* @Description: 进行写入数据到数据库中
	* @param @param fileName
	* @param @param input  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public static void getDataWrite(String fileName , List<String> list){
		try {
			PrintWriter writer = new PrintWriter(new OutputStreamWriter(new FileOutputStream(fileName,true),"GBK"));
			for(String strList : list){
				writer.println(strList);
			}
			writer.flush();
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/** 
	* @Title: getDataRead 
	* @Description: 读取数据库的数据
	* @param @return  参数说明 
	* @return Vector<String>    返回类型 
	* @throws 
	*/
	public static Vector<String> getDataRead(String fileName){
		Vector<String> vecDataTemp = null;
		try {
			InputStream stream = new FileInputStream(fileName);
			InputStreamReader streamReader = new InputStreamReader(stream,"GBK");
			BufferedReader reader = new BufferedReader(streamReader);
			//创建数据库容器
			vecDataTemp = new Vector<String>();
			String strLine;
			vecTemp.clear();
			while ((strLine = reader.readLine()) != null) {
				vecDataTemp.add(strLine);
			}
			reader.close();	
			streamReader.close();
			stream.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return vecDataTemp;
	}
	/** 
	* @Title: getKeyWord 
	* @Description: 截取sql语句中字段
	* @param @param keyword
	* @return Vector<String>    返回类型 
	* @throws 
	*/
	public static Vector<String> getKeyWord(String keyword) {
		// TODO Auto-generated method stub
		Vector<String> output = new Vector<String>();
		
		String strTemp = keyword.substring(1, keyword.length()-1);
		String[] key;
		if (strTemp.contains(",")) {
			key = strTemp.split(",");
		}else{
			key = new String[1];
			key[0] = strTemp;
		}
		
		for (int i = 0; i < key.length; i++)
			output.add(transForWord(key[i]));
		
		return output;
	}
	
	/** 
	* @Title: transForWord 
	* @Description: 判断狮子字段送是否有‘’
	* @param @param input
	* @return String    返回类型 
	* @throws 
	*/
	public static String transForWord(String input) {
		// TODO Auto-generated method stub
		String output = "";
		if (input.equals("''")) {
			output = " ";
		}else {
			output = input;
		}
		
		return output;
	}
}
