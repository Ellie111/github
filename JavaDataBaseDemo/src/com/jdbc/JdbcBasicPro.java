package com.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.jdbc.dataBase.JdbcBasicImpl;

public enum JdbcBasicPro {

	identityKey,create,insert,into,select,update,delete,or,and,$ne,$lt,$lte,$gt,$gte,$in,$regex;
	private static Vector<String> vector = new Vector<String>();
	private static double douValue;
	private static double intValue;
	private static double douObjValue;
	private static double intObjValue;
	
	public static JdbcBasicPro getPostfix(String postfix){   
        return valueOf(postfix.toLowerCase());   
    }  
	
	public static boolean isPostfix(LinkedHashMap<String, Object> map){
		int i = 0;
		if(map.size() == 2){
			for(Map.Entry<String, Object> entry : map.entrySet()){
				String operName = entry.getKey();
				if(getIsPostfix(operName)!=null){
					i++;
				}
			}
		}
		if( i == 2){
			return true;
		}
		return false;
	}
 	public static String getIsPostfix(String operName){
		String postfix = null;
		switch (JdbcBasicPro.getPostfix(operName)) {
		case $ne:
			postfix = "!=";
			break;
		case $lt:
			postfix = "<";
			break;
		case $lte:
			postfix = "<=";
			break;
		case $gt:
			postfix = ">";
			break;
		case $gte:
			postfix = ">=";
			break;
		}
		return postfix;
	}
	
	public static String getIsDatabaseOper(String operName,String tableName){
		String postfix = null;
		switch (JdbcBasicPro.getPostfix(operName)) {
		case select:
			postfix = "select * from " +tableName;
			break;
		case update:
			postfix = "update " +tableName + " set";
			break;
		case delete:
			postfix = "delete from " +tableName;
			break;
		}
		return postfix;
	}
	/** 
	* @Title: getOperator 
	* @Description: 所有的运算符
	* @param @return  参数说明 
	* @return List<String>    返回类型 
	* @throws 
	*/
	public static List<String> getOperator(){
		List<String> list = new ArrayList<String>();
		list.add(">");
		list.add("<");
		list.add("=");
		list.add(">=");
		list.add("<=");
		list.add("!=");
		return list;
	}
	
	public static Map<String, Object[]> getDataOperator(String oper,Vector<String> result ,String keyName){
		vector = result;
		Map<String, Object[]> map = new HashMap<String,Object[]>();
		String name = keyName.substring(0,keyName.indexOf(oper));
		String valueName = keyName.substring(keyName.indexOf(oper)+oper.length());
		if(oper.equals(">")){
			map = getMoreThan(1,name,valueName);
		}else if(oper.equals("<")){
			map = getMoreThan(2,name,valueName);
		}else if(oper.equals("=")){
			map = getBeEqualTo(name,valueName);
		}else if(oper.equals(">=")){
			map = getEqualMoreThan(name,valueName);
		}else if(oper.equals("<=")){
			map = getEqualLessThan(name,valueName);
		}else{
			map = getNotBeEqualTo(name,valueName);
		}
		return map;
	}
	
	/** 
	* @Title: getGreaterThan 
	* @Description: 逻辑运算符的大于
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public static Map<String, Object[]> getMoreThan(int conter,String name,String value){
		Map<String, Object[]> map = new HashMap<String,Object[]>();
		List<String> list = new ArrayList<String>();
		List<Object[]> listAll = new ArrayList<Object[]>();
		JdbcBasicImpl.selectFiledTable(listAll, vector, name);
		//是小数位
		if(value.indexOf(".") != -1){	
			douValue = Double.parseDouble(value);
		}else{
		//为整数
			intValue = Integer.parseInt(value);
		}
		for(Object[] obj : listAll){
			for(int i=0;i<obj.length;i++){
				//是小数位
				if(value.indexOf(".") != -1){	
					douObjValue =Double.parseDouble(obj[i].toString());
					if(conter == 1){
						if(douObjValue > douValue){
							list.add(obj[i].toString());
						}	
					}else if(conter == 2){
						if(douObjValue < douValue){
							list.add(obj[i].toString());
						}	
					}
				}else{
				//为整数
					intObjValue = Integer.parseInt(obj[i].toString());
					if(conter == 1){
						if(intObjValue > intValue){
							list.add(obj[i].toString());
						}
					}else if(conter == 2){
						if(intObjValue < intValue){
							list.add(obj[i].toString());
						}	
					}
				}
			}
		}
		dataTable(map, list,value);
		return map;
	}
	
	/** 
	* @Title: getBeEqualTo 
	* @Description: 逻辑运算符等于
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public static Map<String, Object[]> getBeEqualTo(String name,String value){
		Map<String, Object[]> map = new HashMap<String,Object[]>();
		List<Object[]> listAll = new ArrayList<Object[]>();
		List<String> list = new ArrayList<String>();
		JdbcBasicImpl.selectFiledTable(listAll, vector, name);
		for(Object[] obj : listAll){
			for(int i=0;i<obj.length;i++){
				if(value.equals(obj[i])){
					list.add(obj[i].toString());
				}
			}
		}
		dataTable(map, list,name);
		return map;
	}
	
	/** 
	* @Title: getGreaterThan 
	* @Description: 逻辑运算符的大于等于
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public static Map<String, Object[]> getEqualMoreThan(String name,String value){
		Map<String, Object[]> map = new HashMap<String,Object[]>();
		map = getMoreThan(1,name,value);
		Map<String, Object[]> mapValue = getBeEqualTo(name, value);
		map.putAll(mapValue);
		return map;
	}
	
	/** 
	* @Title: getLessThan 
	* @Description: 逻辑运算符小于等于
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public static Map<String, Object[]> getEqualLessThan(String name,String value){
		Map<String, Object[]> map = new HashMap<String,Object[]>();
		map = getMoreThan(2,name,value);
		Map<String, Object[]> mapValue = getBeEqualTo(name, value);
		map.putAll(mapValue);
		return map;
	}
	
	/** 
	* @Title: getBeEqualTo 
	* @Description: 逻辑运算符不等于
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public static Map<String, Object[]> getNotBeEqualTo(String name,String value){
		Map<String, Object[]> map = new HashMap<String,Object[]>();
		List<Object[]> listAll = new ArrayList<Object[]>();
		List<String> list = new ArrayList<String>();
		JdbcBasicImpl.selectFiledTable(listAll, vector, name);
		for(Object[] obj : listAll){
			for(int i=0;i<obj.length;i++){
				if(!value.equals(obj[i])){
					list.add(obj[i].toString());
				}
			}
		}
		dataTable(map, list,value);
		return map;
	}
	
	public static Map<String,Object[]> dataTable(Map<String,Object[]> map ,List<String> valueList , String name){
		String[] res = vector.get(0).split(",");
		int index = 0;
		//字段匹配,不区分大小写
		for(int i = 0; i<res.length; i++){
			if(name.toLowerCase().equals(res[i].toLowerCase())){
				index = i;
			}
		}
		//根据下标获取数据
		for(int i=1 ; i<vector.size() ; i++){
			String data = vector.get(i);
			String[] query = data.split(",");
			if(valueList.contains(query[index])){
				map.put(query[0], query);
			}
		}
		return map;
	}
}
