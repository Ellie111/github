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
* @Description: ���ݿ��ʵ���࣬�̳нӿ�JdbcBasic
* @author 
* @date
*/
public class JdbcBasicImpl{
	
	/** 
	* @Title: createTable 
	* @Description: �����ʵ����
	* @return void    �������� 
	* @throws 
	*/
	public void createTable(String tableName,Vector<String> tableHead,boolean flag) {
		String strTemp = "";
		if(!JavaDataBaseUtil.isTable(tableName) || flag){
			List<String> list = new ArrayList<String>();
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			if (tableHead.size()==0) {
				System.out.println("error : ��ͷ��������JdbcBasicImpl.createTable(String tableName,Vector<String> tableHead)");
				return;
			}
			for (int i = 0; i < tableHead.size(); i++) {
				if (i==0) {
					strTemp = JavaDataBaseUtil.getIdentity(tableHead.elementAt(0));
					//����tableHead���vector�����ŵĵ�һ��Ԫ��
				}else {
					strTemp += (","+JavaDataBaseUtil.getIdentity(tableHead.elementAt(i)));
				}
			}
			list.add(strTemp);
			JavaDataBaseUtil.getDataWrite(tablePath,list);
		}else{
			System.out.println("error : �����������󣬴���ԭ���Ѵ��ڴ˱���"+tableName+"����JdbcBasicImpl.createTable(String tableName,Vector<String> tableHead)��");
			return;
		}
	}
	
	/** 
	* @Title: insertTable 
	* @Description: ���ݿ�Ĳ���Ĳ���
	* @param @param tableName
	* @param @param tableHeadJ  ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public void insertTable(String tableName, Vector<String> tableData) {
		if(JavaDataBaseUtil.isTable(tableName)){
			List<String> list = new ArrayList<String>();
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			String identityKeyPath = JdbcDataUtil.identityPath;
			//��ȡ����е�����
			Vector<String> vecTemp = JavaDataBaseUtil.getDataRead(tablePath);
			Vector<String> identity = JavaDataBaseUtil.getDataRead(identityKeyPath);
			if(vecTemp.size() == 0){
				System.out.println("error : ����������ޱ�ͷ��JdbcBasicImpl.insertTable(String tableName, Vector<String> tableContent)");
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
					System.out.println("error : �����������ͷ������JdbcBasicImpl.insertTable(String tableName, Vector<String> tableContent)");
					return;
				}else {
					//��������
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
			System.out.println("error : ������������ڴ˱���JdbcBasicImpl.insertTable(String tableName, Vector<String> tableData)��");
			return;
		}
	}
	
	/** 
	* @Title: selectAllTable 
	* @Description: ��ѯ���е�����
	* @param @param tableName  ����˵�� 
	* @return void    �������� 
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
			System.out.println("error : ��ѯ���������ڴ˱���JdbcBasicImpl.selectAllTable(String tableName,String filed)��");
			return null;
		}
	}
	
	/** 
	* @Title: selectFiledTable 
	* @Description: ��ѯ���У���ָ�����ص��ֶ�����
	* @param @param list
	* @param @param result
	* @param @param filed
	* @param @return  ����˵�� 
	* @return List<Object[]>    �������� 
	* @throws 
	*/
	public static List<Object[]> selectFiledTable(List<Object[]> list,Vector<String> result,String filed){
		String[] str = filed.split(",");
		String[] res = result.get(0).split(",");
		List<Integer> index = new ArrayList<Integer>(); 
		//�ֶ�ƥ��,�����ִ�Сд
		for(int i = 0; i<str.length; i++){
			for(int j = 0 ;j < res.length; j++){
				if(str[i].toLowerCase().equals(res[j].toLowerCase())){
					index.add(j);
				}
			}
		}
		
		//�����±��ȡ����
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
	* @Description: where��������ѯ������������жϣ��õ�����
	* @param @param tableName
	* @param @param dataList
	* @param @param oper
	* @param @return  ����˵�� 
	* @return List<Object[]>    �������� 
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
									//�ж�value��ֵ�Ƿ���ͬ
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
						System.out.println("error : ���ǹ涨�����������JdbcBasicImpl.selectOneOpreTable(String tableName,String operator)��");
						return null;
					}
				}else{
					System.out.println("error : �����ڴ��ֶ�,�ֶ�Ϊ��"+dataList.get(0)+" ��"+dataList.get(1));
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
					System.out.println("error : �����ڴ��ֶ�,�ֶ�Ϊ��"+dataList.get(0));
					return null;
				}
			}
			return list;
		}else{
			System.out.println("error : ��ѯ���������ڴ˱���JdbcBasicImpl.selectOneOpreTable(String tableName,String operator)��");
			return null;
		}
	}
	
	/** 
	* @Title: selectFiledTable 
	* @Description: ��ѯ���У���ָ�����ص��ֶ�����
	* @param @param list
	* @param @param result
	* @param @param filed
	* @param @return  ����˵�� 
	* @return List<Object[]>    �������� 
	* @throws 
	*/
	public List<Object[]> sepDataSelectTable(List<Object[]> list,Map<String, Object[]> map,String filed,String fileds){
		String[] str = filed.split(",");
		String[] res = fileds.split(",");
		List<Integer> index = new ArrayList<Integer>(); 
		//�ֶ�ƥ��,�����ִ�Сд
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
	* @Description: ɾ��������������
	* @param   ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public void deleteAllTableData(String tableName){
		if(JavaDataBaseUtil.isTable(tableName)){
			//�ֻ�����ͷ��ֱ��ɾ���˱�
			Vector<String> result = selectAllResult(tableName);
			String[] fileds = result.get(0).split(",");
			String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
			File file = new File(tablePath);
			//ɾ��֮���ٴ���
			file.delete();
			Vector<String> tableHead = new Vector<String>();
			for(int i=0;i<fileds.length;i++){
				tableHead.add(fileds[i]);
			}
			this.createTable(tableName, tableHead,true);
		}else{
			System.out.println("error : ɾ�����ݳ���û���ҵ��˱���JdbcBasicImpl.deleteAllTableData(String tableName)��");
		}
	}
	
	/** 
	* @Title: deleteTableData 
	* @Description: ����ɾ��
	* @param @param tableName
	* @param @param dataList
	* @param @param oper  ����˵�� 
	* @return void    �������� 
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
				//��ȡ��Ҫɾ��������
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
					System.out.println("error : ɾ�����ݳ��������ڴ��ֶΡ�"+dataList+"��");
				}
			}else{
				//������ɾ��
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
					System.out.println("error : ɾ�����ݳ��������ڴ��ֶΡ�"+name+"��");
				}
			}
		}else{
			System.out.println("error : ɾ�����ݳ���û���ҵ��˱���JdbcBasicImpl.deleteTableData(String tableName)��");
		}
	}
	/** 
	* @Title: updateAllTableData 
	* @Description: ���ݿ��޸Ĳ���
	* @param @param tableName
	* @param @param setValue  ����˵�� 
	* @return void    �������� 
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
			System.out.println("error : �޸����ݳ���û���ҵ��˱���JdbcBasicImpl.updateAllTableData(String tableName,String setValue)��");
		}
	}
	
	/** 
	* @Title: updateTableData 
	* @Description: where�����޸�
	* @param @param tableName
	* @param @param setValue  ����˵�� 
	* @return void    �������� 
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
			System.out.println("error : �޸����ݳ���û���ҵ��˱���JdbcBasicImpl.getUpdateTableData(String tableName,String setValue,List<String> dataList,List<String> oper)��");
		}
	}
	/** 
	* @Title: getFiledIndex 
	* @Description: �ж��±�����λ��
	* @param @param str
	* @param @param result
	* @param @return  ����˵�� 
	* @return int    �������� 
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
	* @Description: ��֪��tablename���Ƿ��ж��±�
	* @param @param tableName
	* @param @return  ����˵�� 
	* @return int    �������� 
	* @throws 
	*/
	public int getTableFileIndex(String tableName,String field){
		Vector<String> result = selectAllResult(tableName);
		return getFiledIndex(field, result);
	}
	
	/** 
	* @Title: updateTableData 
	* @Description: �޸����ݵķ���������ȫ���޸ģ��޸Ĳ��ֵȣ���list���ϵ���ʽ����
	* @param @param setValue
	* @param @param vaTemp
	* @param @param result
	* @param @param list  ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public List<String> updateTableData(String setValue,String table,Vector<String> result,List<Object[]> objList){
		Vector<String> indentity = selectAllResult(JdbcBasicPro.identityKey.toString());
		List<String> list = new ArrayList<String>();
		//��ȡsetValue�е��ֶκ����õ�ֵ����map���Ͻ��б���
		Map<Integer, String> map = new HashMap<Integer, String>();
		String[] values = setValue.split(",");
		for(String str : values){
			//��ȡ�ֶ�
			String filed = str.substring(0,str.indexOf("="));
			//��ȡֵ
			String value = str.substring(str.indexOf("=")+1,str.length());
			boolean flag = false;
			//�Ƿ��޸������������������޸�
			for(int i=1;i<indentity.size();i++){
				String data = indentity.get(i);
				String[] query = data.split(",");
				if(query[0].equals(table) && query[1].equals(filed)){
					System.out.println("error : �﷨���������޸���������JdbcBasicImpl.updateTableData(String setValue,String table,Vector<String> result,List<Object[]> objList)��");
					flag = true;
					break;
				}
			}
			if(flag){
				return list;
			}
			//���Ҵ��ֶε��±�
			int key = getFiledIndex(filed, result);
			map.put(key, value);
		}
		//�����ݽ����޸�
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
	* @Description: ��ȡ������������
	* @param @param tableName
	* @param @return  ����˵�� 
	* @return Vector<String>    �������� 
	* @throws 
	*/
	public Vector<String> selectAllResult(String tableName){
		String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
		Vector<String> result = JavaDataBaseUtil.getDataRead(tablePath);
		return result;
	}

	/** 
	* @Title: getOper 
	* @Description: ��ȡʲô����
	* @param @param result
	* @param @param reg
	* @param @return  ����˵�� 
	* @return String    �������� 
	* @throws 
	*/
	public String getOper(Vector<String> result,String reg){
		String[] data= result.get(0).split(",");
		String operator = null;
		for(String str : data){
			if(reg.indexOf(str) != -1){
				//��ȡ�����
				operator = reg.substring(str.length(),str.length()+1);
				if(reg.substring(str.length()+1,str.length()+2).equals("=")){
					operator = reg.substring(str.length(),str.length()+2);
				}
			}
		}
		return operator;
	}
}
