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

	//�洢����
	public static String tableName = null;
	//�洢��������
	public static String identityKeyName = null;
	//�洢��������ͷ���ֶ���
	public static String value = null;
	//�洢�ֶ���
	public static List<String> filedList = new ArrayList<String>();
	
	public static ExecutJdbcDAO dao = new ExecutJdbcDAO();
	
	public <T> void isExecuteEntityDao(Class<T> entity){
		//����ȫ�ֱ���
		filedList.clear();
		tableName = null;
		identityKeyName = null;
		value = null;
		//�ж�ʵ�����Ƿ��б�ע��
		if(entity.getAnnotation(tableName.class) == null){
			System.out.println("create table error �� �˱������ע�����ע���tablenameΪnull");
			return;
		}
		//��ȡ����
		tableName = entity.getAnnotation(tableName.class).name();
		Field[] fileds = entity.getDeclaredFields();
		for(Field filed : fileds){
			identityKey key = filed.getAnnotation(identityKey.class);
			
			//�������identityKey����ȡ�ֶ�
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
		//��֤�Ƿ���ڴ��ڴ˱������ڲ������������ڴ���
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
	* @Description: ��������
	* @param @param entity  ����˵�� 
	* @return void    �������� 
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
	* @Description: �����洢
	* @param @param list  ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public <T> void allSave(List<T> list) throws Exception{
		for(T entity : list){
			this.save(entity);
		}
	}
	
	public <T> List<T> find(Query query,Class<T> entity) throws Exception{
		isExecuteEntityDao(entity);
		//entity.newInstance() ʵ��������
		List<Object[]> list = query.getFindDataQuery(tableName,entity.newInstance());
		List<T> entityList = new ArrayList<T>();
		//����ȡ������ת���ɶ���
		for(Object[] obj : list){
			entityList.add((T) UtilInvokeValue.setInvokeValue(entity.newInstance(), obj));
		}
		return entityList;
	}
	
	/** 
	* @Title: findOne 
	* @Description: ֵ����һ������
	* @param @param query
	* @param @param entity
	* @param @return
	* @param @throws Exception  ����˵�� 
	* @return T    �������� 
	* @throws 
	*/
	public <T> T findOne(Query query,Class<T> entity) throws Exception{
		List<T> list = find(query, entity);
		return list.get(0);
	}
	
	/** 
	* @Title: findAll 
	* @Description: TODO(������һ�仰�����������������) 
	* @param @param entity
	* @param @return
	* @param @throws Exception  ����˵�� 
	* @return List<T>    �������� 
	* @throws 
	*/
	public <T> List<T> findAll(Class<T> entity) throws Exception{
		Query query = new Query();
		List<T> list = find(query, entity);
		return list;
	}
	
	/** 
	* @Title: update 
	* @Description: �޸�����
	* @param @param query
	* @param @param update
	* @param @param entity
	* @param @throws Exception  ����˵�� 
	* @return void    �������� 
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
