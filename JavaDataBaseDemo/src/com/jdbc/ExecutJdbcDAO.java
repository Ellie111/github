package com.jdbc;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import com.jdbc.dataBase.DBCuser;
import com.jdbc.dataBase.JavaDataBaseUtil;
import com.jdbc.dataBase.JdbcBasicImpl;

public class ExecutJdbcDAO {
	
	private JdbcBasicImpl jdbcBasic = new JdbcBasicImpl();

	/** 
	* <p>Title: </p> 
	* <p>Description: ��ʼ��������</p>  
	*/
	public ExecutJdbcDAO(){
		//�������б��Ƿ񴴽�
		if(!JavaDataBaseUtil.isTable(JdbcBasicPro.identityKey.toString())){
			String sql = "create identityKey (tableName,filedName)";
			executeCreate(sql);
		}
	}
	
	/** 
	* @Title: executeCreate 
	* @Description: sql�Ľ������--->�൱��sql�ģ�create table (�ֶ�)
	* @param   ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public void executeCreate(String sql){
		String[] keyword = getStrSql(sql);
		//�ж��ǲ���create�������
		if(keyword[0].toLowerCase().equals(JdbcBasicPro.create.toString())){
			String tableName = keyword[1];
			Vector<String> tableHead = JavaDataBaseUtil.getKeyWord(keyword[2]);
			if(!JavaDataBaseUtil.isTable(tableName)){
				for(String str : tableHead){
					if(str.indexOf('.') != -1){
						String lastIndex = str.substring(str.indexOf(".")+1,str.length());
						//����������
						if(lastIndex.equals(JdbcBasicPro.identityKey.toString())){
							String hql = "select * from identityKey";
							List<Object[]>  list = executeSelect(hql).toArray();
							boolean flag = true;
							for(Object[] object : list){
								if(object[0].toString().equals(tableName) && object[1].toString().equals(JavaDataBaseUtil.getIdentity(str))){
									flag = false;
								}
							}
							if(flag){
								String identitySql = "insert into identityKey ("+tableName+","+JavaDataBaseUtil.getIdentity(str)+")";
								executeInsert(identitySql);
							}
							
						}
					}
				}
			}
			jdbcBasic.createTable(tableName, tableHead,false);
		}else{
			System.out.println("error : ������ȷsql���Ľ��������"+sql);
			return;
		}
	}
	/** 
	* @Title: executeInsert 
	* @Description: ִ�в������--->�൱��sql�ģ�insert table(����)����insert into table(����)
	* @param  sql  ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public void executeInsert(String sql){
 		boolean flag = false;
		String[] keyword = getStrSql(sql);
		//�ж��ǲ���insert�������ݵĲ���
		if(keyword[0].toLowerCase().equals(JdbcBasicPro.insert.toString())){
			String tableName = keyword[1];
			String key = keyword[2];
			if(tableName.toLowerCase().equals(JdbcBasicPro.into.toString())){
				tableName = keyword[2];
				key = keyword[3];
			}
			Vector<String> tableHead = JavaDataBaseUtil.getKeyWord(key);
			Vector<String> identity = JavaDataBaseUtil.getDataRead(JdbcDataUtil.identityPath);
			for(String iden : identity){
				String[] str = iden.split(",");
				if(tableName.equals(str[0])){
					flag = true;
				}
			}
			//����������
			if(flag){
				String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
				Vector<String> vecTemp = JavaDataBaseUtil.getDataRead(tablePath);
				String[] index = vecTemp.get(0).split(",");
				if(index.length != (tableHead.size()+1)){
					System.out.println("error : ���к���������,�����в��������ݣ�"+sql);
					return;
				}	
			}
			//�ж��Ƿ�������
			jdbcBasic.insertTable(tableName, tableHead);
		}else{
			System.out.println("error : ������ȷsql���Ĳ��������"+sql);
			return;
		}		
	}
	
	/** 
	* @Title: executeSelect 
	* @Description: ִ�в��Ҳ���--->�൱��sql�ģ�select * from table  where .. ��  select �ֶ�  from table where ..
	* @param @param sql  ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public DBCuser executeSelect(String sql){
		String[] keyword = getStrSql(sql);
		List<Object[]> result = new ArrayList<Object[]>();
		if(keyword[0].toLowerCase().equals(JdbcBasicPro.select.toString())){
			String tableName = keyword[3];
			if(keyword.length == 4){
				if(keyword[1].equals("*")){
					result = jdbcBasic.selectAllTable(tableName,null);
				}else{
					String condition = keyword[1];
					result = jdbcBasic.selectAllTable(tableName,condition);
				}
			}else{
				List<String> listAll = new ArrayList<String>();
				List<String> list = new ArrayList<String>();
				//where ��ѯ ���涨��where��ѯ����ʱ��֧�����򣬷�ҳ��ѯ��,��ʱ�涨 where ֮����ֶ��ַ������õ����ţ�����id=1 and name=java��,��ʱֻ֧��and��or������ѯ����֧�ָ��Ӳ�ѯ
				//ռʱֻ֧��  = ��> ��< ��!= ��>= ��<=  ���з�Χ��ѯ�ж���ʱֻ֧������������ id>12��֧��id>12.00��ʱ��ķ�Χ��ѯ
				//�ж��Ƿ��ǲ�ѯȫ���ֶ�
				if(!keyword[1].equals("*")){
					listAll.add(keyword[1]);
				}
				
				if(keyword.length == 6){
					String key = keyword[5];
					list.add(key);
					result = jdbcBasic.selectOneOpreTable(tableName, list, null,listAll);
				}else {
					list.add(keyword[5]);
					list.add(keyword[7]);
					List<String> oper = new ArrayList<String>();
					if(keyword[6].equals(JdbcBasicPro.or.toString())){
						oper.add(JdbcBasicPro.or.toString());
					}else if(keyword[6].equals(JdbcBasicPro.and.toString())){
						oper.add(JdbcBasicPro.and.toString());
					}
					result = jdbcBasic.selectOneOpreTable(tableName, list, oper,listAll);
				}
			}
		}else{
			System.out.println("error : ������ȷsql���Ĳ�ѯ������"+sql);
			return null;
		}
		DBCuser cuser = null;
		if(result == null){
			return cuser;
		}
		//��ʼ��ҳ������ʼ������0
		cuser =new DBCuser(result,0,0);
		return cuser;
	}
	
	/** 
	* @Title: executeDelete 
	* @Description: ɾ�����ݲ��� delete from ��������  ɾ��ȫ������              delete from ��������  where  ������ɾ��ָ�����ݻ�ȡ��������
	* @param @param sql  ����˵�� 
	* @return void    �������� 
	* @throws 
	*/
	public void executeDelete(String sql){
		String[] keyword = getStrSql(sql);
		if(keyword[0].toLowerCase().equals(JdbcBasicPro.delete.toString())){
			String tableName = keyword[2];
			//ɾ��������������
			if(keyword.length == 3){
				jdbcBasic.deleteAllTableData(tableName);
			}else{
				List<String> list = new ArrayList<String>();
				//������ɾ����delete from table where id=1
				if(keyword.length == 5){
					String key = keyword[4];
					list.add(key);
					jdbcBasic.deleteTableData(tableName, list, null);
				}else{
					//˫����ɾ��delete from table where id=1 and id>2��
					//��ʱֻ֧��������
					list.add(keyword[4]);
					list.add(keyword[6]);
					List<String> oper = new ArrayList<String>();
					if(keyword[5].equals(JdbcBasicPro.or.toString())){
						oper.add(JdbcBasicPro.or.toString());
					}else if(keyword[5].equals(JdbcBasicPro.and.toString())){
						oper.add(JdbcBasicPro.and.toString());
					}
					jdbcBasic.deleteTableData(tableName, list, oper);
				}
			}
		}else{
			System.out.println("error : ������ȷsql����ɾ��������"+sql);
			return;
		}
	}
	
    /** 
    * @Title: executeUpdate 
    * @Description: �޸�����update �������� set id=����,age=���� where id=1002 ���� where id=4 and id=5�� ,
    * @param @param sql  ����˵�� 
    * @return void    �������� 
    * @throws 
    */
    public void executeUpdate(String sql){
    	String[] keyword = getStrSql(sql);
		if(keyword[0].toLowerCase().equals(JdbcBasicPro.update.toString())){
			//��ȡ����
			String tableName = keyword[1];
			//��ȡҪ�޸ĵ�ֵ
			String setValue = keyword[3];
			//�޸������ֶε�ֵ
			if(keyword.length == 4){
				jdbcBasic.updateAllTableData(tableName, setValue);
			}else{
				List<String> list = new ArrayList<String>();
				//������ɾ����update �������� set id=����,age=���� where id=1002
				if(keyword.length == 6){
					String key = keyword[5];
					list.add(key);
					jdbcBasic.getUpdateTableData(tableName, setValue, list, null);
				}else{
					//˫����ɾ��update �������� set id=����,age=����  where id=4 and id=5�� ,
					//��ʱֻ֧��������
					list.add(keyword[5]);
					list.add(keyword[7]);
					List<String> oper = new ArrayList<String>();
					if(keyword[6].equals(JdbcBasicPro.or.toString())){
						oper.add(JdbcBasicPro.or.toString());
					}else if(keyword[6].equals(JdbcBasicPro.and.toString())){
						oper.add(JdbcBasicPro.and.toString());
					}
					jdbcBasic.getUpdateTableData(tableName, setValue, list, oper);
				}
			}
		}else{
			System.out.println("error : ������ȷsql�����޸Ĳ�����"+sql);
			return;
		}
	}
    
	/** 
	* @Title: getStrSql 
	* @Description: �ж�sql�������ͣ��Լ����ֲ���
	* @param @param sql
	* @return String[]    �������� 
	* @throws 
	*/
	public String[] getStrSql(String sql){
		String[] keySql = sql.split(" ");
		if(keySql.length < 3){
			System.out.println("error : sql�﷨����"+sql);
			System.exit(-1);
		}
		return keySql;
	}
}
