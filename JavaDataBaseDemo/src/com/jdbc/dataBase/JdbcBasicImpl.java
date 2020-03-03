package com.jdbc.dataBase;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.jdbc.JdbcBasicPro;
import com.jdbc.JdbcDataUtil;

/** 
* @ClassName: JdbcBasicImpl 
* @Description: 数据库的实现类，继承接口JdbcBasic
* @author 
* @date
*/
public class JdbcBasicImpl{
	
	/** 
	* @Title: createTable 
	* @Description: 建表的实现类
	* @return void    返回类型 
	* @throws 
	*/
	public void createTable(String tableName,Vector<String> tableHead,boolean flag) {
		String strTemp = "";
		if(!JavaDataBaseUtil.isTable(tableName) || flag){
			List<String> list = new ArrayList<String>();
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			if (tableHead.size()==0) {
				System.out.println("error : 表头发生错误：JdbcBasicImpl.createTable(String tableName,Vector<String> tableHead)");
				return;
			}
			for (int i = 0; i < tableHead.size(); i++) {
				if (i==0) {
					strTemp = JavaDataBaseUtil.getIdentity(tableHead.elementAt(0));
					//返回tableHead这个vector里面存放的第一个元素
				}else {
					strTemp += (","+JavaDataBaseUtil.getIdentity(tableHead.elementAt(i)));
				}
			}
			list.add(strTemp);
			JavaDataBaseUtil.getDataWrite(tablePath,list);
		}else{
			System.out.println("error : 创建表发生错误，错误原因：已存在此表单【"+tableName+"】【JdbcBasicImpl.createTable(String tableName,Vector<String> tableHead)】");
			return;
		}
	}
	
	/** 
	* @Title: insertTable 
	* @Description: 数据库的插入的操作
	* @param @param tableName
	* @param @param tableHeadJ  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void insertTable(String tableName, Vector<String> tableData) {
		if(JavaDataBaseUtil.isTable(tableName)){
			List<String> list = new ArrayList<String>();
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			String identityKeyPath = JdbcDataUtil.identityPath;
			//读取书库中的数据
			Vector<String> vecTemp = JavaDataBaseUtil.getDataRead(tablePath);
			Vector<String> identity = JavaDataBaseUtil.getDataRead(identityKeyPath);
			if(vecTemp.size() == 0){
				System.out.println("error : 插入的数据无表头：JdbcBasicImpl.insertTable(String tableName, Vector<String> tableContent)");
				return;
			}else {
				boolean flag = false;
				String strTemp = "";
				int index = tableData.size();
				int headLength = vecTemp.get(0).split(",").length;
				for(String iden : identity){
					String[] str = iden.split(",");
					if(tableName.equals(str[0])){
						index = tableData.size()+1;
						flag = true;
					}
				}
				if (headLength != index) {
					System.out.println("error : 插入数据与表头不符：JdbcBasicImpl.insertTable(String tableName, Vector<String> tableContent)");
					return;
				}else {
					//存在自增
					if(flag){
						int conter = vecTemp.size();
						String num = "0";
						if(conter > 1){
							num = vecTemp.get(conter-1).split(",")[0];
						}
						strTemp = ""+(Integer.parseInt(num)+1)+"";
						for (int i = 0; i < tableData.size(); i++) {
							strTemp += (","+tableData.elementAt(i));
						}
					}else{
						for (int i = 0; i < headLength; i++) {
							if (i==0) {
								strTemp = tableData.elementAt(0);
							}else {
								strTemp += (","+tableData.elementAt(i));
							}
						}
					}
					
					list.add(strTemp);
					JavaDataBaseUtil.getDataWrite(tablePath, list);
				}
			}
		}else{
			System.out.println("error : 插入出错，不存在此表：【JdbcBasicImpl.insertTable(String tableName, Vector<String> tableData)】");
			return;
		}
	}
	
	/** 
	* @Title: selectAllTable 
	* @Description: 查询所有的数据
	* @param @param tableName  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public List<Object[]> selectAllTable(String tableName,String filed){
		if(JavaDataBaseUtil.isTable(tableName)){
			List<Object[]> list = new ArrayList<Object[]>();
			Vector<String> result = selectAllResult(tableName);
			if(filed != null){
				selectFiledTable(list, result,filed);
				return list;
			}
			for(int i=1;i<result.size();i++){
				String data = result.get(i);
				String[] query = data.split(",");
				Object[] obj = new Object[query.length];
				for(int j=0;j<query.length;j++){
					obj[j] = query[j];
				}
				list.add(obj);
			}
			return list;
		}else{
			System.out.println("error : 查询出错，不存在此表：【JdbcBasicImpl.selectAllTable(String tableName,String filed)】");
			return null;
		}
	}
	
	/** 
	* @Title: selectFiledTable 
	* @Description: 查询所有，并指定返回的字段数据
	* @param @param list
	* @param @param result
	* @param @param filed
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public static List<Object[]> selectFiledTable(List<Object[]> list,Vector<String> result,String filed){
		String[] str = filed.split(",");
		String[] res = result.get(0).split(",");
		List<Integer> index = new ArrayList<Integer>(); 
		//字段匹配,不区分大小写
		for(int i = 0; i<str.length; i++){
			for(int j = 0 ;j < res.length; j++){
				if(str[i].toLowerCase().equals(res[j].toLowerCase())){
					index.add(j);
				}
			}
		}
		
		//根据下标获取数据
		for(int i=1 ; i<result.size() ; i++){
			int conter = 0;
			String data = result.get(i);
			String[] query = data.split(",");
			Object[] obj = new Object[str.length];
			for(int j=0;j<query.length;j++){
 				if(index.contains(j)){
					obj[conter] = query[j];
					conter++;
				}
			}
			list.add(obj);
		}
		return list;
	}
	
	/** 
	* @Title: selectOneOpreTable 
	* @Description: where的条件查询，根据运算符判断，得到数据
	* @param @param tableName
	* @param @param dataList
	* @param @param oper
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public List<Object[]> selectOneOpreTable(String tableName,List<String> dataList,List<String> oper,List<String> listAll){
		if(JavaDataBaseUtil.isTable(tableName)){
			List<Object[]> list = new ArrayList<Object[]>();
			Map<String, Object[]> map = new HashMap<String,Object[]>();
			List<Object[]> list1 = new ArrayList<Object[]>();
			List<Object[]> list2 = new ArrayList<Object[]>();
			Vector<String> result = selectAllResult(tableName);
			String fileds = result.get(0);
			if(oper != null){
				String operator = getOper(result, dataList.get(0));
				String operator1 = getOper(result, dataList.get(1));
				if(operator != null && operator1 != null){
					if(JdbcBasicPro.getOperator().contains(operator) && JdbcBasicPro.getOperator().contains(operator1)){
						Map<String, Object[]> mapValue1 = null;
						Map<String, Object[]> mapValue2 = null;
						if(listAll.size() != 0){
							mapValue1 = JdbcBasicPro.getDataOperator(operator, result , dataList.get(0));
							mapValue2 = JdbcBasicPro.getDataOperator(operator1, result , dataList.get(1));
							sepDataSelectTable(list1, mapValue1, listAll.get(0), fileds);
							sepDataSelectTable(list2, mapValue2, listAll.get(0), fileds);
						}else{
							mapValue1 = JdbcBasicPro.getDataOperator(operator, result , dataList.get(0));
							mapValue2 = JdbcBasicPro.getDataOperator(operator1, result , dataList.get(1));
						}
						if(oper.contains(JdbcBasicPro.and.toString())){
							for(Map.Entry<String, Object[]> entry : mapValue1.entrySet()){
								if(mapValue2.containsKey(entry.getKey())){
									//判断value的值是否相同
									Object[] isObj = entry.getValue();
									Object[] obj = mapValue2.get(entry.getKey());
									boolean flag = true;
									for(int i=0;i<obj.length;i++){
										if(!isObj[i].equals(obj[i])){
											flag =false;
										}
									}
									if(flag){
										list.add(entry.getValue());
									}
								}
							}
						}else{
							map.putAll(mapValue1);
							map.putAll(mapValue2);
							for(Map.Entry<String, Object[]> entry : map.entrySet()){
								list.add(entry.getValue());
							}
						}
					}else{
						System.out.println("error : 不是规定的运算符：【JdbcBasicImpl.selectOneOpreTable(String tableName,String operator)】");
						return null;
					}
				}else{
					System.out.println("error : 不存在此字段,字段为："+dataList.get(0)+" 或"+dataList.get(1));
					return null;
				}
				
			}else{
				String operator = getOper(result, dataList.get(0));
				if(operator != null){
					if(listAll.size() == 0){
						map = JdbcBasicPro.getDataOperator(operator, result , dataList.get(0));
						list = sepDataSelectTable(list, map, fileds, fileds);
					}else{
						map = JdbcBasicPro.getDataOperator(operator, result , dataList.get(0));
						list = sepDataSelectTable(list, map, listAll.get(0), fileds);
					}
				}else{
					System.out.println("error : 不存在此字段,字段为："+dataList.get(0));
					return null;
				}
			}
			return list;
		}else{
			System.out.println("error : 查询出错，不存在此表：【JdbcBasicImpl.selectOneOpreTable(String tableName,String operator)】");
			return null;
		}
	}
	
	/** 
	* @Title: selectFiledTable 
	* @Description: 查询所有，并指定返回的字段数据
	* @param @param list
	* @param @param result
	* @param @param filed
	* @param @return  参数说明 
	* @return List<Object[]>    返回类型 
	* @throws 
	*/
	public List<Object[]> sepDataSelectTable(List<Object[]> list,Map<String, Object[]> map,String filed,String fileds){
		String[] str = filed.split(",");
		String[] res = fileds.split(",");
		List<Integer> index = new ArrayList<Integer>(); 
		//字段匹配,不区分大小写
		for(int i = 0; i<str.length; i++){
			for(int j = 0 ;j < res.length; j++){
				if(str[i].toLowerCase().equals(res[j].toLowerCase())){
					index.add(j);
				}
			}
		}
		for(Map.Entry<String, Object[]> entry : map.entrySet()){
			Object[] obj = entry.getValue();
			int conter = 0;
			Object[] object = new Object[str.length];
			for(int i=0;i<obj.length;i++){
				if(index.contains(i)){
					object[conter] = obj[i];
					conter++;
				}
			}
			list.add(object);
		}
		return list;
	}
	
	/** 
	* @Title: deleteAllTableData 
	* @Description: 删除表中所有数据
	* @param   参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void deleteAllTableData(String tableName){
		if(JavaDataBaseUtil.isTable(tableName)){
			//现货区表头在直接删除此表
			Vector<String> result = selectAllResult(tableName);
			String[] fileds = result.get(0).split(",");
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			File file = new File(tablePath);
			//删除之后再创建
			file.delete();
			Vector<String> tableHead = new Vector<String>();
			for(int i=0;i<fileds.length;i++){
				tableHead.add(fileds[i]);
			}
			this.createTable(tableName, tableHead,true);
		}else{
			System.out.println("error : 删除数据出错，没有找到此表：【JdbcBasicImpl.deleteAllTableData(String tableName)】");
		}
	}
	
	/** 
	* @Title: deleteTableData 
	* @Description: 条件删除
	* @param @param tableName
	* @param @param dataList
	* @param @param oper  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void deleteTableData(String tableName,List<String> dataList,List<String> oper){
		if(JavaDataBaseUtil.isTable(tableName)){
			Vector<String> result = selectAllResult(tableName);
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			List<String> listAll = new ArrayList<String>();
			IdentityHashMap<String, String> map = new IdentityHashMap<String, String>();
			List<String> updateData = new ArrayList<String>();
			if(oper != null){
				//获取需要删除的数据
				List<Object[]> list = this.selectOneOpreTable(tableName, dataList, oper, listAll);
				if(list == null){
					return;
				}
				int filed1 = 0;
				int filed2 = 0;
				int k =0;
				for(String str : dataList){
					String operator = this.getOper(result, str);
					String name = str.substring(0,str.indexOf(operator));
					if(k == 0){
						filed1 = this.getFiledIndex(name, result);
					}else{
						filed2 = this.getFiledIndex(name, result);
					}
					k++;
				}
				
				for(Object[] obj : list)
					map.put(obj[filed1].toString(), obj[filed2].toString());
				
				if(filed1 != -1 && filed2 != -1){
					for(int i=1;i<result.size();i++){
						String data = result.get(i);
						String[] query = data.split(",");
						boolean flag = false;
						for(Map.Entry<String, String> entry : map.entrySet()){
							if(query[filed1].equals(entry.getKey()) && query[filed2].equals(entry.getValue())){
								flag = true;
							}
						}
						if(!flag){
							updateData.add(result.get(i));
						}
					}
					this.deleteAllTableData(tableName);
					JavaDataBaseUtil.getDataWrite(tablePath,updateData);
				}else{
					System.out.println("error : 删除数据出错，不存在此字段【"+dataList+"】");
				}
			}else{
				//但条件删除
				String str = dataList.get(0);
				String operator = this.getOper(result, str);
				String name = str.substring(0,str.indexOf(operator));
				List<Object[]> list = this.selectOneOpreTable(tableName, dataList, oper, listAll);
				List<String> strList = new ArrayList<String>();
				int index = this.getFiledIndex(name, result);
				for(Object[] obj : list)
					strList.add(obj[index].toString());
				if(index != -1){
					for(int i=1;i<result.size();i++){
						String data = result.get(i);
						String[] query = data.split(",");
						if(!strList.contains(query[index])){
							updateData.add(result.get(i));
						}
					}
					this.deleteAllTableData(tableName);
					JavaDataBaseUtil.getDataWrite(tablePath,updateData);
				}else{
					System.out.println("error : 删除数据出错，不存在此字段【"+name+"】");
				}
			}
		}else{
			System.out.println("error : 删除数据出错，没有找到此表：【JdbcBasicImpl.deleteTableData(String tableName)】");
		}
	}
	/** 
	* @Title: updateAllTableData 
	* @Description: 数据库修改操作
	* @param @param tableName
	* @param @param setValue  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void updateAllTableData(String tableName,String setValue){
		if(JavaDataBaseUtil.isTable(tableName)){
			Vector<String> result = selectAllResult(tableName);
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			List<String> list = updateTableData(setValue,tableName, result, null);
			this.deleteAllTableData(tableName);
			JavaDataBaseUtil.getDataWrite(tablePath,list);
		}else{
			System.out.println("error : 修改数据出错，没有找到此表：【JdbcBasicImpl.updateAllTableData(String tableName,String setValue)】");
		}
	}
	
	/** 
	* @Title: updateTableData 
	* @Description: where条件修改
	* @param @param tableName
	* @param @param setValue  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void getUpdateTableData(String tableName,String setValue,List<String> dataList,List<String> oper){
		if(JavaDataBaseUtil.isTable(tableName)){
			Vector<String> result = selectAllResult(tableName);
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			List<String> listAll = new ArrayList<String>();
			List<Object[]> list = this.selectOneOpreTable(tableName, dataList, oper, listAll);
			listAll = this.updateTableData(setValue, tableName, result, list);
			if(listAll.size() == 0){
				return;
			}
			this.deleteAllTableData(tableName);
			JavaDataBaseUtil.getDataWrite(tablePath,listAll);
		}else{
			System.out.println("error : 修改数据出错，没有找到此表：【JdbcBasicImpl.getUpdateTableData(String tableName,String setValue,List<String> dataList,List<String> oper)】");
		}
	}
	/** 
	* @Title: getFiledIndex 
	* @Description: 判断下标所在位置
	* @param @param str
	* @param @param result
	* @param @return  参数说明 
	* @return int    返回类型 
	* @throws 
	*/
	public int getFiledIndex(String str,Vector<String> result){
		String[] fileds = result.get(0).split(",");
		for(int i=0;i<fileds.length;i++){
			if(fileds[i].equals(str)){
				return i;
			}
		}
		return -1;
	}
	
	/** 
	* @Title: getTableFileIndex 
	* @Description: 在知道tablename的是否判断下标
	* @param @param tableName
	* @param @return  参数说明 
	* @return int    返回类型 
	* @throws 
	*/
	public int getTableFileIndex(String tableName,String field){
		Vector<String> result = selectAllResult(tableName);
		return getFiledIndex(field, result);
	}
	
	/** 
	* @Title: updateTableData 
	* @Description: 修改数据的方法，包含全部修改，修改部分等，以list集合的形式返回
	* @param @param setValue
	* @param @param vaTemp
	* @param @param result
	* @param @param list  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public List<String> updateTableData(String setValue,String table,Vector<String> result,List<Object[]> objList){
		Vector<String> indentity = selectAllResult(JdbcBasicPro.identityKey.toString());
		List<String> list = new ArrayList<String>();
		//截取setValue中的字段和设置的值，用map集合进行保存
		Map<Integer, String> map = new HashMap<Integer, String>();
		String[] values = setValue.split(",");
		for(String str : values){
			//截取字段
			String filed = str.substring(0,str.indexOf("="));
			//截取值
			String value = str.substring(str.indexOf("=")+1,str.length());
			boolean flag = false;
			//是否修改了主键，主键不能修改
			for(int i=1;i<indentity.size();i++){
				String data = indentity.get(i);
				String[] query = data.split(",");
				if(query[0].equals(table) && query[1].equals(filed)){
					System.out.println("error : 语法出错，不能修改主键：【JdbcBasicImpl.updateTableData(String setValue,String table,Vector<String> result,List<Object[]> objList)】");
					flag = true;
					break;
				}
			}
			if(flag){
				return list;
			}
			//查找此字段的下标
			int key = getFiledIndex(filed, result);
			map.put(key, value);
		}
		//对数据进行修改
		for(int i=1;i<result.size();i++){
			String data = result.get(i);
			String[] query = data.split(",");
			String strTemp = null;
			if(objList==null){
				for(int j=0;j<query.length;j++){
					if(j==0){
						strTemp = map.containsKey(j)?map.get(j):query[j];
					}else{
						strTemp += map.containsKey(j)?(","+map.get(j)):(","+query[j]);
					}
				}
				list.add(strTemp);
			}else{
				boolean flag = true;
				for(Object[] object : objList){
					Object[] obj = object;
					int index = 0;
					for(int j=0;j<obj.length;j++){
						if(obj[j].equals(query[j])){
							index++;
						}
					}
					if(index == obj.length){
						int k = 0;
						while (index != k) {
							if(k==0){
								strTemp = map.containsKey(k)?map.get(k):query[k];
							}else{
								strTemp += map.containsKey(k)?(","+map.get(k)):(","+query[k]);
							}
							k++;
							flag = false;
						}
					}
				}
				if(flag){
					strTemp = data;
				}
				list.add(strTemp);
			}
		}
		return list;
	}
	
	/** 
	* @Title: selectAllResult 
	* @Description: 获取表单的所有数据
	* @param @param tableName
	* @param @return  参数说明 
	* @return Vector<String>    返回类型 
	* @throws 
	*/
	public Vector<String> selectAllResult(String tableName){
		String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
		Vector<String> result = JavaDataBaseUtil.getDataRead(tablePath);
		return result;
	}

	/** 
	* @Title: getOper 
	* @Description: 截取什么运算
	* @param @param result
	* @param @param reg
	* @param @return  参数说明 
	* @return String    返回类型 
	* @throws 
	*/
	public String getOper(Vector<String> result,String reg){
		String[] data= result.get(0).split(",");
		String operator = null;
		for(String str : data){
			if(reg.indexOf(str) != -1){
				//截取运算符
				operator = reg.substring(str.length(),str.length()+1);
				if(reg.substring(str.length()+1,str.length()+2).equals("=")){
					operator = reg.substring(str.length(),str.length()+2);
				}
			}
		}
		return operator;
	}
}
