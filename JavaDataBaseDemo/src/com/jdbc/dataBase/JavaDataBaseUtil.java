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
* @Description: jdbc�����࣬��Ҫ�ĸ���ȫ����������
* @author 
* @date 
*/
public class JavaDataBaseUtil {

	private static Vector<String> vecTemp = new Vector<String>();//save the data of database
	
	/** 
	* @Title: isTable 
	* @Description: �ж��Ƿ���ڱ�
	* @param @param tableName
	* @param @return  ����˵�� 
	* @return boolean    �������� 
	* @throws 
	*/
	public static boolean isTable(String tableName){
		File files = new File(JdbcDataUtil.dataPathCVS);
		//�����ھʹ���
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
			System.out.println("error : ��"+JdbcDataUtil.dataPathCVS+"���ļ��������ļ���");
		}
		return false;
	}
	
	/** 
	* @Title: getPrimaryKey 
	* @Description: ����ÿ���ֶΣ����Ƿ����������ֶ�
	* @param @param fieldName
	* @param @return  ����˵�� 
	* @return String    �������� 
	* @throws 
	*/
	public static String getIdentity(String fieldName){
		if(fieldName.indexOf('.') != -1){
			//�ж�����һ���ǲ�������
			String lastIndex = fieldName.substring(fieldName.indexOf(".")+1,fieldName.length());
			if(lastIndex.equals(JdbcBasicPro.identityKey.toString())){
				fieldName = fieldName.substring(0,fieldName.indexOf("."));
			}
		}
		return fieldName;
	}
	
	/** 
	* @Title: getDataWrite 
	* @Description: ����д�����ݵ����ݿ���
	* @param @param fileName
	* @param @param input  ����˵�� 
	* @return void    �������� 
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
	* @Description: ��ȡ���ݿ������
	* @param @return  ����˵�� 
	* @return Vector<String>    �������� 
	* @throws 
	*/
	public static Vector<String> getDataRead(String fileName){
		Vector<String> vecDataTemp = null;
		try {
			InputStream stream = new FileInputStream(fileName);
			InputStreamReader streamReader = new InputStreamReader(stream,"GBK");
			BufferedReader reader = new BufferedReader(streamReader);
			//�������ݿ�����
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
	* @Description: ��ȡsql������ֶ�
	* @param @param keyword
	* @return Vector<String>    �������� 
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
	* @Description: �ж�ʨ���ֶ����Ƿ��С���
	* @param @param input
	* @return String    �������� 
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
