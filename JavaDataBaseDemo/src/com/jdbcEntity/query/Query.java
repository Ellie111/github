package com.jdbcEntity.query;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.jdbc.ExecutJdbcDAO;
import com.jdbc.JdbcBasicPro;
import com.jdbc.dataBase.DBCuser;
import com.jdbcEntity.UtilInvokeValue;

public class Query {

	private final Map<String, Criteria> criteriaMap = new LinkedHashMap<String, Criteria>();
	public static ExecutJdbcDAO dao = new ExecutJdbcDAO();
	private int skip = 0;
	private int limit = 0;
	
	public static Query query(Criteria criteria) {
		return new Query(criteria);
	}

	public Query() {
	}

	public Query(int limit,int skip) {
		this.limit = limit;
		this.skip = skip;
	}
	
	public Query(Criteria criteria) {
		addCriteria(criteria);
	}
	
	public Query skip(int skip) {
		return new Query(limit,skip);
	}

	public Query limit(int limit) {
		return new Query(limit,skip);
	}
	
	public Query addCriteria(Criteria criteria) {
		Criteria existing = (Criteria) this.criteriaMap.get(criteria.getKey());
		String key = criteria.getKey();
		if (existing == null) {
			this.criteriaMap.put(key, criteria);
		}else{
			System.out.println("error:�������ݿ������,�㲻�������ͬ�ļ�ֵ�Խ��в�ѯ,criteriaMap��map����֮�д�����key�ļ�����һ��ֵ�Ḳ��ǰһ��ֵ");
			return null;
		}
		return this;
	}
	
	public <T> List<Object[]> getFindDataQuery(String tableName,T entity) throws Exception{
		List<Object[]> list = new ArrayList<Object[]>();
		String sql = null;
		DBCuser cuser = null;
		List<Object[]> result = new ArrayList<Object[]>();
		List<Object[]> resultList = new ArrayList<Object[]>();
		if(criteriaMap.size() == 0){
			sql = "select * from " +tableName;
			cuser = dao.executeSelect(sql);
			if(cuser == null){
				return null;
			}
			cuser = new DBCuser(cuser.toArray(), limit, skip);
			list.addAll(cuser.toArray());
			return list;
		}
		int i = 0;
		
		//��ȡmap�����д洢��ֵ
		for(Map.Entry<String, Criteria> entry : criteriaMap.entrySet()){
			sql = entry.getValue().getDataOperation(tableName , entry.getKey(), entry.getValue(),null,JdbcBasicPro.select.toString());
			if(sql == null){
				return result;
			}
			if(sql.equals("I/R")){
				resultList = entry.getValue().inRexgeList;
			}else{
				cuser = dao.executeSelect(sql);
				if(cuser == null){
					continue;
				}
				cuser = new DBCuser(cuser.toArray(), limit, skip);
				resultList = cuser.toArray();
			}
			if( i == 0 ){
				list.addAll(resultList);
				result.addAll(resultList);
			}else{
				result.clear();
				result.addAll(this.getDataEquel(list, resultList,entity));
				list.clear();
				list.addAll(result);
			}
			i++;
		}
		return result;
	}
	
	public <T> List<Object[]> getDataEquel(List<Object[]> list,List<Object[]> resultList,T entity) throws Exception{
		List<Object[]> data = resultList;
		List<Object[]> result = new ArrayList<Object[]>();
		for(int i=0; i<list.size();i++){
			T entityT1 = UtilInvokeValue.setInvokeValue(entity, list.get(i));
			String temp1 = UtilInvokeValue.getInvokeValue(entityT1,true);
			for(int j=0; j<data.size();j++){
				T entityT2 = UtilInvokeValue.setInvokeValue(entity, data.get(j));
				String temp2 = UtilInvokeValue.getInvokeValue(entityT2,true);
				if(temp1.equals(temp2)){
					result.add(data.get(j));
				}
			}
		}
		return result;
	}
	
	public <T> void getUpdateDataQuery(String tableName,Update update,T entity) throws Exception{
		String sql = null;
		String temp = "";
		int i = 0;
		if(criteriaMap.size() == 0){
			System.out.println("error:update�޸�����������Query����Ϊ��");
			return;
		}
		if(criteriaMap.size() <= 2){
			for(Map.Entry<String, Criteria> entry : criteriaMap.entrySet()){
				sql = entry.getValue().getDataOperation(tableName , entry.getKey(), entry.getValue(),update,JdbcBasicPro.update.toString());
				if(sql == null){
					return;
				}
				if(sql.equals("I/R")){
					System.out.println("error:�޸���ʱ��֧������ƥ�䣬�����Ƴ� ��������");
					return;
				}
				if(criteriaMap.size() == 2){
					if(sql.indexOf("and")!=-1 || sql.indexOf("or")!=-1 ){
						System.out.println("error:update�޸�����У�����XXXԭ��query.addCriteria�а���and��or��ѯ��ʹ�������ܴ���2");
						return;
					}else{
						if(i == 0){
							temp = sql.substring(sql.indexOf("where")+5,sql.length()).trim();
							i++;
						}
						sql = sql + " and " + temp;
					}
				}
			}
			dao.executeUpdate(sql);
		}else{
			System.out.println("error:update�޸�����У�����XXXԭ��query.addCriteria���������ܴ���2");
		}
	}

	/** 
	* @Title: getRemoveDataQuery 
	* @Description:ɾ����������
	* @param @param tableName
	* @param @param entity
	* @param @throws Exception  ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public <T> void getRemoveAllDataQuery(String tableName) throws Exception{
		String sql = "delete from "+tableName;
		dao.executeDelete(sql);
	}
	
	public <T> void getRemoveDataQuery(String tableName,T entity) throws Exception{
		String sql = null;
		int i = 0;
		String temp = "";
		if(criteriaMap.size() == 0){
			this.getRemoveAllDataQuery(tableName);
			return;
		}
		if(criteriaMap.size() <= 2){
			for(Map.Entry<String, Criteria> entry : criteriaMap.entrySet()){
				sql = entry.getValue().getDataOperation(tableName , entry.getKey(), entry.getValue(),null,JdbcBasicPro.delete.toString());
				if(sql == null){
					return;
				}
				if(sql.equals("I/R")){
					System.out.println("error:ɾ����ʱ��֧������ƥ�䣬�����Ƴ� ��������");
					return;
				}
				if(criteriaMap.size() == 2){
					if(sql.indexOf("and")!=-1 || sql.indexOf("or")!=-1 ){
						System.out.println("error:deleteɾ������У�����XXXԭ��query.addCriteria�а���and��or��ѯ��ʹ�������ܴ���2");
						return;
					}else{
						if(i == 0){
							temp = sql.substring(sql.indexOf("where")+5,sql.length()).trim();
							i++;
						}
						sql = sql + " and " + temp;
					}
				}
			}
			dao.executeDelete(sql);
		}else{
			System.out.println("error:deleteɾ������У�����XXXԭ��query.addCriteria���������ܴ���2");
		}
		
	}
}
