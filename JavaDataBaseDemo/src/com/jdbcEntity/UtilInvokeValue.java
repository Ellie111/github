package com.jdbcEntity;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
public class UtilInvokeValue {

	
	/** 
	* @Title: getInvokeValue 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param str
	* @param @param entity
	* @param @return
	* @param @throws Exception  参数说明 
	* @return String    返回类型 
	* @throws 
	*/
	public static <T> String getInvokeValue(T entity,boolean flag) throws Exception {
		String key = ExecuteEntityDao.identityKeyName;
		String value = ExecuteEntityDao.value;
		Field[] fields = entity.getClass().getDeclaredFields();
		String temp = "";
		int i = 0;
		for(Field field : fields){
			String name = field.getName();
			Method method = entity.getClass().getMethod("get"+getMethodName(name));
			if(!flag){
				if(key != null){
					if(i == 0){
						temp = value.equals(name)?"":(String)method.invoke(entity);
					}else{
						temp += value.equals(name)?"":","+(String)method.invoke(entity);
					}
				}else{
					temp += i == 0?(String)method.invoke(entity):","+(String)method.invoke(entity);
				}
				
			}else{
				temp += i == 0?(String)method.invoke(entity):","+(String)method.invoke(entity);
			}
			i++;
		}
		if(temp.charAt(0) == ','){
			temp = temp.substring(1, temp.length());
		}
		return temp;
	}

	@SuppressWarnings("rawtypes")
	public static <T> T setInvokeValue(T entity,Object[] object) throws Exception {
		Field[] fields = entity.getClass().getDeclaredFields();
		int size = 0;
		for(Field field : fields){
			String name = field.getName();
			Class[] types = new Class[] { String.class }; 
			Method method = entity.getClass().getMethod("set"+getMethodName(name),types);
			method.invoke(entity,object[size++].toString());
		}
		return entity;
	}
	
	// 把一个字符串的第一个字母大写、
	private static String getMethodName(String fildeName){
		byte[] items = fildeName.getBytes();
		byte firstChar = (byte)'Z';
		if(items[0] <= firstChar){
			return fildeName;
		}
		items[0] = (byte) ((char) items[0] - 'a' + 'A');
		return new String(items);
	}
}
