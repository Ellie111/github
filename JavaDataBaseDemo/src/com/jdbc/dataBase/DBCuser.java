package com.jdbc.dataBase;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: DBCuser
 * @Description: ���ݿ�ķ�ҳ����
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
	 * @Description: �����￪ʼ
	 * @param @param skip ����˵��
	 * @return void ��������
	 * @throws
	 */
	public DBCuser skip(int skip) {
		return new DBCuser(result,limit,skip);
	}

	/**
	 * @Title: limit
	 * @Description: ��ʾ����������
	 * @param @param limit ����˵��
	 * @return void ��������
	 * @throws
	 */
	public DBCuser limit(int limit) {
		return new DBCuser(result,limit,skip);
	}

	public List<Object[]> toArray() {
		try {
			List<Object[]> dbCuser = new ArrayList<Object[]>();
			if(skip > result.size()){
				throw new Exception("��ҳ��������ԭ�����õ��±����ݳ����˼����±꣡");
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
