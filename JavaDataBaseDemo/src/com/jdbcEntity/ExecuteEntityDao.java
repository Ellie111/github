package com.jdbcEntity;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.ExecutJdbcDAO;
import com.jdbc.dataBase.JavaDataBaseUtil;
import com.jdbcEntity.anno.filedName;
import com.jdbcEntity.anno.identityKey;
import com.jdbcEntity.anno.tableName;
import com.jdbcEntity.query.Query;
import com.jdbcEntity.query.Update;

public class ExecuteEntityDao{

	//存储表单名
	public static String tableName = null;
	//存储自增列明
	public static String identityKeyName = null;
	//存储自增列字头的字段名
	public static String value = null;
	//存储字段名
	public static List<String> filedList = new ArrayList<String>();
	
	public static ExecutJdbcDAO dao = new ExecutJdbcDAO();
	
	public <T> void isExecuteEntityDao(Class<T> entity){
		//清理全局变量
		filedList.clear();
		tableName = null;
		identityKeyName = null;
		value = null;
		//判断实体类是否有表单注解
		if(entity.getAnnotation(tableName.class) == null){
			System.out.println("create table error ： 此表单正规的注解表单，注解的tablename为null");
			return;
		}
		//获取表单名
		tableName = entity.getAnnotation(tableName.class).name();
		Field[] fileds = entity.getDeclaredFields();
		for(Field filed : fileds){
			identityKey key = filed.getAnnotation(identityKey.class);
			
			//如果存在identityKey，获取字段
			if(key != null){
				identityKeyName = key.name().equals("")?filed.getName():key.name();
				value = filed.getName();
				filedList.add(identityKeyName);
			}
			filedName name = filed.getAnnotation(filedName.class);
			if(name != null){
				if(name.name().equals("")){
					filedList.add(filed.getName());
				}else{
					filedList.add(name.name());
				}
			}else{
				if(value == null){
					filedList.add(filed.getName());	
				}else{
					if(!value.equals(filed.getName())){
						filedList.add(filed.getName());	
					}
				}
			}
		}
		//验证是否存在存在此表单，存在不创建，不存在创建
		if(!JavaDataBaseUtil.isTable(tableName)){
			StringBuffer sql = new StringBuffer();
			sql.append("create " + tableName);
			String temp = "";
			for(int i=0;i<filedList.size();i++){
				if(identityKeyName != null){
					if(i == 0){
						temp = identityKeyName.equals(filedList.get(i))?filedList.get(i)+".identityKey":filedList.get(i);
					}else{
						temp += identityKeyName.equals(filedList.get(i))?","+filedList.get(i)+".identityKey":","+filedList.get(i);
					}
				}else{
					temp += i == 0?filedList.get(i)+"":","+filedList.get(i);
				}
			}
			sql.append(" ("+temp+")");
			dao.executeCreate(sql.toString());
		}
	}
	
	/**
	 * @throws Exception  
	* @Title: save 
	* @Description: 单个保存
	* @param @param entity  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public <T> void save(T entity) throws Exception{
		isExecuteEntityDao(entity.getClass());
		String temp = UtilInvokeValue.getInvokeValue(entity,false);
		String sql = "insert into " +tableName+ " ("+temp+")";
		dao.executeInsert(sql);
	}
	
	
	/**
	 * @throws Exception  
	* @Title: allSave 
	* @Description: 批量存储
	* @param @param list  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public <T> void allSave(List<T> list) throws Exception{
		for(T entity : list){
			this.save(entity);
		}
	}
	
	public <T> List<T> find(Query query,Class<T> entity) throws Exception{
		isExecuteEntityDao(entity);
		//entity.newInstance() 实例化对象
		List<Object[]> list = query.getFindDataQuery(tableName,entity.newInstance());
		List<T> entityList = new ArrayList<T>();
		//将获取的数据转换成对象
		for(Object[] obj : list){
			entityList.add((T) UtilInvokeValue.setInvokeValue(entity.newInstance(), obj));
		}
		return entityList;
	}
	
	/** 
	* @Title: findOne 
	* @Description: 值返回一条数据
	* @param @param query
	* @param @param entity
	* @param @return
	* @param @throws Exception  参数说明 
	* @return T    返回类型 
	* @throws 
	*/
	public <T> T findOne(Query query,Class<T> entity) throws Exception{
		List<T> list = find(query, entity);
		return list.get(0);
	}
	
	/** 
	* @Title: findAll 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param entity
	* @param @return
	* @param @throws Exception  参数说明 
	* @return List<T>    返回类型 
	* @throws 
	*/
	public <T> List<T> findAll(Class<T> entity) throws Exception{
		Query query = new Query();
		List<T> list = find(query, entity);
		return list;
	}
	
	/** 
	* @Title: update 
	* @Description: 修改数据
	* @param @param query
	* @param @param update
	* @param @param entity
	* @param @throws Exception  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public <T> void update(Query query,Update update,Class<T> entity) throws Exception{
		isExecuteEntityDao(entity);
		query.getUpdateDataQuery(tableName,update,entity.newInstance());
	}
	
	public <T> void removeAll(Class<T> entity) throws Exception{
		isExecuteEntityDao(entity);
		new Query().getRemoveAllDataQuery(tableName);
	}
	
	public <T> void remove(Query query,Class<T> entity) throws Exception{
		isExecuteEntityDao(entity);
		query.getRemoveDataQuery(tableName,entity.newInstance());
	}
}
