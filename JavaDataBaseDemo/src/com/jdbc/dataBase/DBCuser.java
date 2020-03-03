package com.jdbc.dataBase;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: DBCuser
 * @Description: 数据库的分页处理
 * @author 
 * @date
 */
public class DBCuser {
	private List<Object[]> result = new ArrayList<Object[]>();
	private int skip = 0;
	private int limit = 0;

	public DBCuser() {
	}

	public DBCuser(List<Object[]> result,int limit,int skip) {
		this.limit = limit;
		this.skip = skip;
		this.result = result;
	}

	/**
	 * @Title: skip
	 * @Description: 从哪里开始
	 * @param @param skip 参数说明
	 * @return void 返回类型
	 * @throws
	 */
	public DBCuser skip(int skip) {
		return new DBCuser(result,limit,skip);
	}

	/**
	 * @Title: limit
	 * @Description: 显示多少条数据
	 * @param @param limit 参数说明
	 * @return void 返回类型
	 * @throws
	 */
	public DBCuser limit(int limit) {
		return new DBCuser(result,limit,skip);
	}

	public List<Object[]> toArray() {
		try {
			List<Object[]> dbCuser = new ArrayList<Object[]>();
			if(skip > result.size()){
				throw new Exception("分页出错，错误原因：设置的下标数据超出了集合下标！");
			}
			
			if(limit > result.size()){
				return result;
			}
			
			if(skip != 0 && limit == 0){
				for(int i =0 ; i < result.size() ; i++){
					if(i >= skip){
						dbCuser.add(result.get(i));
					}
				}
				return dbCuser;
			}else if(skip == 0 && limit != 0){
				for(int i =0 ; i < result.size() ; i++){
					if(i < limit){
						dbCuser.add(result.get(i));
					}
				}
				return dbCuser;
			}else if(skip != 0 && limit != 0){
				for(int i =0 ; i < result.size() ; i++){
					if(i >= skip){
						if((i - skip) < limit){
							dbCuser.add(result.get(i));
						}
					}
				}
				return dbCuser;
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
