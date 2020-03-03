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
	* <p>Description: 初始化主键表</p>  
	*/
	public ExecutJdbcDAO(){
		//看自增列表是否创建
		if(!JavaDataBaseUtil.isTable(JdbcBasicPro.identityKey.toString())){
			String sql = "create identityKey (tableName,filedName)";
			executeCreate(sql);
		}
	}
	
	/** 
	* @Title: executeCreate 
	* @Description: sql的建表操作--->相当于sql的：create table (字段)
	* @param   参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void executeCreate(String sql){
		String[] keyword = getStrSql(sql);
		//判断是不是create建表操作
		if(keyword[0].toLowerCase().equals(JdbcBasicPro.create.toString())){
			String tableName = keyword[1];
			Vector<String> tableHead = JavaDataBaseUtil.getKeyWord(keyword[2]);
			if(!JavaDataBaseUtil.isTable(tableName)){
				for(String str : tableHead){
					if(str.indexOf('.') != -1){
						String lastIndex = str.substring(str.indexOf(".")+1,str.length());
						//存在自增列
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
			System.out.println("error : 不是正确sql语句的建表操作："+sql);
			return;
		}
	}
	/** 
	* @Title: executeInsert 
	* @Description: 执行插入操作--->相当于sql的：insert table(数据)或者insert into table(数据)
	* @param  sql  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void executeInsert(String sql){
 		boolean flag = false;
		String[] keyword = getStrSql(sql);
		//判断是不是insert插入数据的操作
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
			//存在自增列
			if(flag){
				String tablePath = JdbcDataUtil.dataPathCVS + tableName+".csv";
				Vector<String> vecTemp = JavaDataBaseUtil.getDataRead(tablePath);
				String[] index = vecTemp.get(0).split(",");
				if(index.length != (tableHead.size()+1)){
					System.out.println("error : 表中含有自增列,自增列不能填数据："+sql);
					return;
				}	
			}
			//判断是否有主键
			jdbcBasic.insertTable(tableName, tableHead);
		}else{
			System.out.println("error : 不是正确sql语句的插入操作："+sql);
			return;
		}		
	}
	
	/** 
	* @Title: executeSelect 
	* @Description: 执行查找操作--->相当于sql的：select * from table  where .. 或  select 字段  from table where ..
	* @param @param sql  参数说明 
	* @return void    返回类型 
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
				//where 查询 ，规定的where查询，暂时不支持排序，分页查询等,暂时规定 where 之后的字段字符串不用单引号，例如id=1 and name=java等,暂时只支持and和or单个查询，不支持复杂查询
				//占时只支持  = 、> ，< 、!= 、>= 、<=  其中范围查询判断暂时只支持整数，例如 id>12不支持id>12.00或时间的范围查询
				//判断是否是查询全部字段
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
			System.out.println("error : 不是正确sql语句的查询操作："+sql);
			return null;
		}
		DBCuser cuser = null;
		if(result == null){
			return cuser;
		}
		//初始化页数，初始化都是0
		cuser =new DBCuser(result,0,0);
		return cuser;
	}
	
	/** 
	* @Title: executeDelete 
	* @Description: 删除数据操作 delete from 【表名】  删除全部数据              delete from 【表名】  where  。。。删除指定数据获取区间数据
	* @param @param sql  参数说明 
	* @return void    返回类型 
	* @throws 
	*/
	public void executeDelete(String sql){
		String[] keyword = getStrSql(sql);
		if(keyword[0].toLowerCase().equals(JdbcBasicPro.delete.toString())){
			String tableName = keyword[2];
			//删除表中所有数据
			if(keyword.length == 3){
				jdbcBasic.deleteAllTableData(tableName);
			}else{
				List<String> list = new ArrayList<String>();
				//单条件删除，delete from table where id=1
				if(keyword.length == 5){
					String key = keyword[4];
					list.add(key);
					jdbcBasic.deleteTableData(tableName, list, null);
				}else{
					//双条件删除delete from table where id=1 and id>2等
					//暂时只支持这两种
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
			System.out.println("error : 不是正确sql语句的删除操作："+sql);
			return;
		}
	}
	
    /** 
    * @Title: executeUpdate 
    * @Description: 修改数据update 【表名】 set id=。。,age=。。 where id=1002 或者 where id=4 and id=5等 ,
    * @param @param sql  参数说明 
    * @return void    返回类型 
    * @throws 
    */
    public void executeUpdate(String sql){
    	String[] keyword = getStrSql(sql);
		if(keyword[0].toLowerCase().equals(JdbcBasicPro.update.toString())){
			//获取表名
			String tableName = keyword[1];
			//获取要修改的值
			String setValue = keyword[3];
			//修改所有字段的值
			if(keyword.length == 4){
				jdbcBasic.updateAllTableData(tableName, setValue);
			}else{
				List<String> list = new ArrayList<String>();
				//单条件删除，update 【表名】 set id=。。,age=。。 where id=1002
				if(keyword.length == 6){
					String key = keyword[5];
					list.add(key);
					jdbcBasic.getUpdateTableData(tableName, setValue, list, null);
				}else{
					//双条件删除update 【表名】 set id=。。,age=。。  where id=4 and id=5等 ,
					//暂时只支持这两种
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
			System.out.println("error : 不是正确sql语句的修改操作："+sql);
			return;
		}
	}
    
	/** 
	* @Title: getStrSql 
	* @Description: 判断sql语句的类型，以及那种操作
	* @param @param sql
	* @return String[]    返回类型 
	* @throws 
	*/
	public String[] getStrSql(String sql){
		String[] keySql = sql.split(" ");
		if(keySql.length < 3){
			System.out.println("error : sql语法错误："+sql);
			System.exit(-1);
		}
		return keySql;
	}
}
