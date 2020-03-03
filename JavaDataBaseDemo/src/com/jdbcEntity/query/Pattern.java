package com.jdbcEntity.query;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: Pattern : 重写Pattern类
 * @Description: 匹配的几种模式
 * @author
 * @date
 */
public final class Pattern implements Serializable {
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 1L;

	// 全匹配
	public static final Integer ALL_REGEX_MATCH = 0;
	// 左匹配
	public static final Integer LEFT_REGEX_MATCH = 1;
	// 右匹配
	public static final Integer RIGHT_REGEX_MATCH = 2;
	// 模糊匹配
	public static final Integer FUZZY_REGEX_MACTH = 3;

	Map<String, Integer> patternMap = new HashMap<String, Integer>();

	private Pattern() {
	}

	private Pattern(String key, Integer num) {
		patternMap.put(key, num);
	}

	public static Pattern compile(String key, Integer num) {
		if (!getPatternList().contains(num)) {
			System.out.println("error:请选择匹配正确的模式!");
			return null;
		}
		return new Pattern(key, num);
	}

	public static Pattern compile(String key) {
		return new Pattern(key, Pattern.FUZZY_REGEX_MACTH);
	}

	private static List<Integer> getPatternList() {
		List<Integer> list = new ArrayList<Integer>();
		list.add(ALL_REGEX_MATCH);
		list.add(LEFT_REGEX_MATCH);
		list.add(RIGHT_REGEX_MATCH);
		list.add(FUZZY_REGEX_MACTH);
		return list;
	}

	/** 
	* @Title: getPatternData 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param pattern
	* @param @param intList
	* @param @param list
	* @param @param getOr
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public List<Object[]> getPatternData(Pattern pattern,List<Integer> intList, List<Object[]> list,String getOr) {
		List<Object[]> result = new ArrayList<Object[]>();
		for (Map.Entry<String, Integer> entry : pattern.patternMap.entrySet()) {
			switch (entry.getValue()) {
			case 0:
				result = this.getAllRegexMatch(entry.getKey(), intList, list,getOr);
				break;
			case 1:
				result = this.getLeftRegexMatch(entry.getKey(), intList, list,getOr);
				break;
			case 2:
				result = this.getRightRegexMatch(entry.getKey(), intList, list,getOr);
				break;
			case 3:
				result = this.getFuzzyRegexMatch(entry.getKey(), intList, list,getOr);
				break;
			}
		}
		return result;
	}
	
	/** 
	* @Title: getAllRegexMatch 
	* @Description: 完全匹配
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public List<Object[]> getAllRegexMatch(String keyValue,List<Integer> intList, List<Object[]> list,String getOr){
		List<Object[]> result = new ArrayList<Object[]>();
		for(Object[] object : list){
			//完全匹配判断是否全部相同
			if(intList.size() == 1){
				if(keyValue.equals(object[intList.get(0)].toString())){
					result.add(object);
				}
			}else{
				if(keyValue.equals(object[intList.get(0)].toString()) && keyValue.equals(object[intList.get(1)].toString()) && getOr == null){
					result.add(object);
				}
				if( getOr != null){
					if(keyValue.equals(object[intList.get(0)].toString()) || keyValue.equals(object[intList.get(1)].toString())){
						result.add(object);
					}
				}
			}
		}
		return result;
	}
	
	/** 
	* @Title: getLeftRegexMatch 
	* @Description: 左匹配
	* @param @param keyValue
	* @param @param intList
	* @param @param list
	* @param @param getOr
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public List<Object[]> getLeftRegexMatch(String keyValue,List<Integer> intList, List<Object[]> list,String getOr){
		List<Object[]> result = new ArrayList<Object[]>();
		for(Object[] object : list){
			if(intList.size() == 1){
				String str = object[intList.get(0)].toString();
				if(str.length() < keyValue.length()){
					continue;
				}
				String value = str.substring(0, keyValue.length());
				if(keyValue.equals(value)){
					result.add(object);
				}
			}
			else{
				String str = object[intList.get(0)].toString();
				String str1 = object[intList.get(1)].toString();
				if(str.length() < keyValue.length() || str1.length() < keyValue.length()){
					continue;
				}
				String value = str.substring(0, keyValue.length());
				String value1 = str1.substring(0, keyValue.length());
				if(keyValue.equals(value) && keyValue.equals(value1) && getOr == null){
					result.add(object);
				}
				if( getOr != null){
					if(keyValue.equals(value) || keyValue.equals(value1)){
						result.add(object);
					}
				}
			}
		}
		return result;
	}
	/** 
	* @Title: getRightRegexMatch 
	* @Description: 右匹配
	* @param @param keyValue
	* @param @param intList
	* @param @param list
	* @param @param getOr
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public List<Object[]> getRightRegexMatch(String keyValue,List<Integer> intList, List<Object[]> list,String getOr){
		List<Object[]> result = new ArrayList<Object[]>();
		for(Object[] object : list){
			if(intList.size() == 1){
				String str = object[intList.get(0)].toString();
				if(str.length() < keyValue.length()){
					continue;
				}
				String value = str.substring(str.length()-keyValue.length(), str.length());
				if(keyValue.equals(value)){
					result.add(object);
				}
			}
			else{
				String str = object[intList.get(0)].toString();
				String str1 = object[intList.get(1)].toString();
				if(str.length() < keyValue.length() || str1.length() < keyValue.length()){
					continue;
				}
				String value = str.substring(str.length()-keyValue.length(), str.length());
				String value1 = str1.substring(str1.length()-keyValue.length(), str1.length());
				if(keyValue.equals(value) && keyValue.equals(value1) && getOr == null){
					result.add(object);
				}
				if( getOr != null){
					if(keyValue.equals(value) || keyValue.equals(value1)){
						result.add(object);
					}
				}
			}
		}
		return result;
	}
	/** 
	* @Title: getFuzzyRegexMatch 
	* @Description: 模糊匹配
	* @param @param keyValue
	* @param @param intList
	* @param @param list
	* @param @param getOr
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public List<Object[]> getFuzzyRegexMatch(String keyValue,List<Integer> intList, List<Object[]> list,String getOr){
		List<Object[]> result = new ArrayList<Object[]>();
		for(Object[] object : list){
			if(intList.size() == 1){
				if(object[intList.get(0)].toString().indexOf(keyValue) != -1){
					result.add(object);
				}
			}else{
				if(object[intList.get(0)].toString().indexOf(keyValue) != -1 && object[intList.get(1)].toString().indexOf(keyValue) != -1 && getOr == null){
					result.add(object);
				}
				if( getOr != null){
					if(object[intList.get(0)].toString().indexOf(keyValue) != -1 || object[intList.get(1)].toString().indexOf(keyValue) != -1){
						result.add(object);
					}
				}
			}
		}
		return result;
	}
}
