package testJdbc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import testJdbc.bean.loginInfo;

import com.jdbc.ExecutJdbcDAO;
import com.jdbcEntity.ExecuteEntityDao;
import com.jdbcEntity.query.Criteria;
import com.jdbcEntity.query.Pattern;
import com.jdbcEntity.query.Query;
import com.jdbcEntity.query.Update;

public class jdbc {

	public static void main(String[] args) throws Exception {
		
		ExecutJdbcDAO dao = new ExecutJdbcDAO();
		ExecuteEntityDao entityDao = new ExecuteEntityDao();
			
		/* //如果设置为自增列，写成xx.identityKey的形式,创建表
		String sql = "create kkk (id.identityKey,userID,userName,sex,age)";
		dao.executeCreate(sql);
		System.out.print("成功建表");
		
		
		// 添加数据
		for(int i=11;i<20;i++){
			String sqls = "insert into aaaa (userID"+i+",userName"+i+","+(Math.random()<0.5?"女":"男")+","+(int)(18+Math.random()*47)+")";
			dao.executeInsert(sqls);
			System.out.print("数据插入成功");
		}*/
		
		
		/*//查询数据，实现分页查询
		String sql1 = "select userID,userName from aaaa";
		
		for(int j =0;j<3;j++){
			System.out.println("=======>第"+(j+1)+"页");
			List<Object[]> list = dao.executeSelect(sql1).skip(8*j).limit(8).toArray();
			for(Object[] obj : list){
				for(int i=0;i<obj.length;i++){
					System.out.print(obj[i]+"     ");
				}
				System.out.println();
			}
		}
		*/
		
		/*//删除数据
		String sqls = "delete from aaaa where id=18";
		dao.executeDelete(sqls);
		System.out.print("数据删除成功");*/
		
		/*//修改数据
		String sqlx = "update userInfo set age=32,userName=tomJava where id=12";
		dao.executeUpdate(sqlx);
		System.out.print("数据修改成功");
		
		List<loginInfo> list = new ArrayList<loginInfo>();
		for(int i =0;i<100;i++){
			loginInfo loginInfo = new loginInfo(""+(i+1), ""+(i+2), ""+(i+3));
			list.add(loginInfo);
		}
		entityDao.allSave(list);
		/*List<Integer> intList = new ArrayList<Integer>();
		for(int i = 10 ;i<11;i++){
			intList.add(i);
		}
		Query query = new Query();
		//query.addCriteria(new Criteria("longinPWD").and("longinName").regex(Pattern.compile("longinName", Pattern.ALL_REGEX_MATCH)));
		query.addCriteria(new Criteria("longinId").and("longinName").regex(Pattern.compile("1", Pattern.FUZZY_REGEX_MACTH)));
		//query.addCriteria(new Criteria("longinId").and("longinName").in(intList));
		//loginInfo info = new loginInfo();
		List<loginInfo> list = entityDao.find(query, loginInfo.class);
		for(loginInfo infos : list){
			System.out.println(infos.getLonginId());
			System.out.println(infos.getLonginName());
			System.out.println(infos.getLonginNote());
			System.out.println(infos.getLonginPWD());
			System.out.println("==================================");
		}*/
		
		/*Query query = new Query();
		query.addCriteria(new Criteria("longinName").is("1"));
		Update update = new Update();
		update.put("longinName", "ssxxxxxxxxxxxxxxxxxxx");
		entityDao.update(query, update, loginInfo.class);*/
		/*Query query = new Query();
		query.addCriteria(new Criteria());
		entityDao.remove(query,loginInfo.class);*/
	}
	
}
