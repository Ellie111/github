package com.jdbcEntity.query;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.jdbc.ExecutJdbcDAO;
import com.jdbc.JdbcBasicPro;
import com.jdbc.dataBase.JdbcBasicImpl;

public class Criteria {

	private static final Object NOT_SET = new Object();
	private static final String INANDREGEX = "I/R";
	private static final String or = "$or";
	private List<String> criteriaList;
	private LinkedHashMap<String, Object> criteria = new LinkedHashMap<String, Object>();
	public List<Object[]> inRexgeList = new ArrayList<Object[]>();
	private String key;
	private String getOr = null;
	private Object value = NOT_SET;
	private ExecutJdbcDAO dao = new ExecutJdbcDAO();
	private JdbcBasicImpl impl = new JdbcBasicImpl();
	
	public Criteria() {
		this.criteriaList = new ArrayList<String>();
	}

	public Criteria(String key) {
		this.criteriaList = new ArrayList<String>();
		this.criteriaList.add(key);
		this.key = key;
	}

	protected Criteria(List<String> criteriaList, String key,String index) {
		this.criteriaList = criteriaList;
		this.criteriaList.add(key);
		this.key = key;
		if(index!=null){
			this.getOr = or;
		}
	}

	public Criteria where(String key) {
		return new Criteria(key);
	}

	public Criteria and(String key) {
		return new Criteria(this.criteriaList, key ,null);
	}
	
	public Criteria or(String key) {
		return new Criteria(this.criteriaList, key , "or");
	}

	public Criteria is(Object value) {
		if (!this.value.equals(NOT_SET)) {
		      System.out.println("error : Multiple 'is' values declared. You need to use 'and' with multiple criteria");
		}
		this.value = value;
		return this;
	}

	/** 
	* @Title: ne
	* @Description: 相当于运算符的 !=
	* @param @param o
	* @param @return  参数说明 
	* @return Criteria    返回类型 
	* @throws 
	*/
	public Criteria ne(Object o) {
		this.criteria.put("$ne", o);
		return this;
	}
	
	/** 
	* @Title: lt 
	* @Description: 相当于运算符的 <
	* @param @param o
	* @param @return  参数说明 
	* @return Criteria    返回类型 
	* @throws 
	*/
	public Criteria lt(Object o) {
		this.criteria.put("$lt", o);
		return this;
	}
	
	/** 
	* @Title: lte 
	* @Description: 相当于运算符的 <=
	* @param @param o
	* @param @return  参数说明 
	* @return Criteria    返回类型 
	* @throws 
	*/
	public Criteria lte(Object o) {
		this.criteria.put("$lte", o);
		return this;
	}
	
	/** 
	* @Title: gt 
	* @Description: 相当于运算符的 >
	* @param @param o
	* @param @return  参数说明 
	* @return Criteria    返回类型 
	* @throws 
	*/
	public Criteria gt(Object o) {
		this.criteria.put("$gt", o);
		return this;
	}
	
	/** 
	* @Title: gte 
	* @Description: 相当于运算符的 >=
	* @param @param o
	* @param @return  参数说明 
	* @return Criteria    返回类型 
	* @throws 
	*/
	public Criteria gte(Object o) {
		this.criteria.put("$gte", o);
		return this;
	}

	/** 
	* @Title: in 
	* @Description: in 匹配查询
	* @param @param o
	* @param @return  参数说明 
	* @return Criteria    返回类型 
	* @throws 
	*/
	public Criteria in(Object object) {
		List<Object> list = new ArrayList<Object>();
		list.add(object);
		return this.in(list);
	}
	
	public Criteria in(Collection<?> collection) {
		this.criteria.put("$in", collection);
		return this;
	}
	
	/** 
	* @Title: regex 
	* @Description: 模糊匹配
	* @param @param o
	* @param @return  参数说明 
	* @return Criteria    返回类型 
	* @throws 
	*/
	public Criteria regex(String regex) {
		Pattern pattern = Pattern.compile(regex);
		return this.regex(pattern);
	}
	
	public Criteria regex(Pattern pattern) {
		this.criteria.put("$regex", pattern);
		return this;
	}
	
	public String getKey() {
		return this.key;
	}
	
	public LinkedHashMap<String, Object> getCriteria() {
		return this.criteria;
	}
	
	
	/*********************************关键字查询，主要包含一些运算**********************************/
	/** 
	* @Title: getBeEqualTo 
	* @Description: 查询相等的如 id=5  -> query.addCriteria(new Criteria("id").is("5"));
	*               根据编写的数据库暂时只支持两个相同的查询，如：
	*               Query query = new Query();
	*               query.addCriteria(new Criteria("loginId")。and("loginName").is("3"));//查询longinId和loginName都为3的数据
	*               或：
	*               query.addCriteria(new Criteria("loginId")。and("loginName").is("3").gt("7"));//查询longinId和loginName都为3的和<=7的数据
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public String getDataOperation (String tableName , String keyName , Criteria criteria ,Update update ,String databaseOper){
		StringBuffer sql = new StringBuffer();
		sql.append(JdbcBasicPro.getIsDatabaseOper(databaseOper, tableName));
		//获取List中的字段，查看有多少字段
		List<String> keyNameList = criteria.criteriaList;
		int keyNum = keyNameList.size();
		String temp = "";
		if(keyNum  == 0 && criteria.criteria.size() == 0){
			return sql.toString();	
		}
		if(update!=null){
			String setValue = update.getUpdateMap(update);
			if(setValue == null){
				System.out.println("error:修改数据的update不能为为空");
				return null;
			}
			sql.append(" "+setValue);
		}
		int index = 0;
		if(keyNum ==1 || keyNum == 2){
			if((criteria.criteria.size() == 0 && !criteria.value.equals(NOT_SET)) || (criteria.criteria.size() == 1 && criteria.value.equals(NOT_SET)) || JdbcBasicPro.isPostfix(criteria.criteria)){
				sql.append(" where ");
				for(int i=0;i<keyNum;i++){
					//不是or运算并且没有运算符的数据，即：query.addCriteria(new Criteria("loginId")。and("loginName").is("3"));
					if(getOr == null && criteria.criteria.size() == 0){
						temp += i==0?keyNameList.get(i)+"="+criteria.value:" and "+keyNameList.get(i)+"="+criteria.value;
					}else if(getOr != null && criteria.criteria.size() == 0){
						//是or运算并且没有运算符的数据，即：query.addCriteria(new Criteria("loginId")。or("loginName").is("3"));
						temp += i==0?keyNameList.get(i)+"="+criteria.value:" or "+keyNameList.get(i)+"="+criteria.value;
					}else if(getOr == null && criteria.criteria.size() != 0){
						//不是or运算并且有运算符的数据，即：query.addCriteria(new Criteria("loginId")。and("loginName").ne("3"));
						for(Map.Entry<String, Object> entry : criteria.criteria.entrySet()){
							if(entry.getKey().equals("$in")){
								this.getInDataTable(entry.getValue(),tableName,criteria);
								return INANDREGEX;
							}else if(entry.getKey().equals("$regex")){
								this.getRegexDataTable(entry.getValue(),tableName,criteria);
								return INANDREGEX;
							}
							String postfix = JdbcBasicPro.getIsPostfix(entry.getKey());
							temp += index==0?keyNameList.get(i)+postfix+entry.getValue():" and "+keyNameList.get(i)+postfix+entry.getValue();
							index ++;
						}
					}else if(getOr != null && criteria.criteria.size() != 0){
						//是or运算并且有运算符的数据，即：query.addCriteria(new Criteria("loginId")。or("loginName").ne("3"));
						for(Map.Entry<String, Object> entry : criteria.criteria.entrySet()){
							if(entry.getKey().equals("$in")){
								this.getInDataTable(entry.getValue(),tableName,criteria);
								return INANDREGEX;
							}else if(entry.getKey().equals("$regex")){
								this.getRegexDataTable(entry.getValue(),tableName,criteria);
								return INANDREGEX;
							}
							String postfix = JdbcBasicPro.getIsPostfix(entry.getKey());
							temp += index==0?keyNameList.get(i)+postfix+entry.getValue():" or "+keyNameList.get(i)+postfix+entry.getValue();
							index ++;
						}
					}
				}
			}else{
				System.out.println("error:运算符过多!!");
				return null;
			}
		}else{
			System.out.println("error:一项查询里的字段不能超过2个！！或者运算符过多");
			return null;
		}
		sql.append(temp);
		return sql.toString();
	}
	
	/** 
	* @Title: getInDataTable 
	* @Description: in 匹配数据，根据in匹配指定字段的值
	* @param @param inValue
	* @param @param tableName
	* @param @param criteria  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	@SuppressWarnings("unchecked")
	public void getInDataTable(Object inValue,String tableName,Criteria criteria){
		List<Object> inValueList = (List<Object>) inValue;
		//判断字段所在的下标
		List<Integer> intList = new ArrayList<Integer>();
		for(String str : criteria.criteriaList){
			int index = impl.getTableFileIndex(tableName, str);
			intList.add(index);
		}
		//获取所有的数据
		List<Object[]> list = dao.executeSelect("select * from "+tableName).toArray();
		criteria.inRexgeList.clear();
		for(Object[] object : list){
			for(Object obj : inValueList){
				if(intList.size() == 1){
					if(obj.toString().equals(object[intList.get(0)].toString())){
						criteria.inRexgeList.add(object);
					}
				}
				else{
					if(obj.toString().equals(object[intList.get(0)].toString()) && obj.toString().equals(object[intList.get(1)].toString()) && getOr == null){
						criteria.inRexgeList.add(object);
					}
					if( getOr != null){
						if(obj.toString().equals(object[intList.get(0)].toString()) || obj.toString().equals(object[intList.get(1)].toString())){
							criteria.inRexgeList.add(object);
						}
					}
				}
			}
		}
	}
	
	/** 
	* @Title: getRegexDataTable 
	* @Description: regex匹配，主要4中匹配方式，常用的模糊匹配
	* @param @param inValue
	* @param @param tableName
	* @param @param criteria  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void getRegexDataTable(Object inValue,String tableName,Criteria criteria){
		criteria.inRexgeList.clear();
		Pattern pattern = (Pattern) inValue;
		//判断字段所在的下标
		List<Integer> intList = new ArrayList<Integer>();
		for(String str : criteria.criteriaList){
			int index = impl.getTableFileIndex(tableName, str);
			intList.add(index);
		}		
		//获取所有的数据
		List<Object[]> list = dao.executeSelect("select * from "+tableName).toArray();
		List<Object[]> result = pattern.getPatternData(pattern, intList, list ,getOr);
		criteria.inRexgeList.addAll(result);
	}
}
