package Server;

import java.util.List;

public interface ExecuteService {
    //创建表的执行
    String executeCreate(String sql);

    //表数据插入的执行
    String executeInsert(String sql);

    //表查询分页
    List<String[]> executeSelect(String sql);

    //表数据删除
    String executeDelete(String sql);

    //表数据更新
    String executeUpdate(String sql);

    //整个表删除
    String executeDrop(String sql);

}
