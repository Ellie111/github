package Server;

import java.io.File;
import java.util.*;

public class ExecuteServiceImpl implements ExecuteService{
    //数据库路径
    static String Path = System.getProperty("user.dir") + "\\DATABASE\\";

    //判断该数据库文件中是否已经存在该表
    public static boolean isTable(String tableName){
        File files = new File(Path);
        //不存在该数据库就创建
        if(!files.exists()){files.mkdir();}
        //存在的话就直接遍历
        File[] list = files.listFiles();
        if(list.length == 0 || list == null){
            return false;
        }else{
            for(File i : list){//遍历文件名
                String fileName = i.getName().substring(0,i.getName().indexOf("."));
                if(fileName.equals(tableName)){
                    return true;
                }
            }
        }
        return false;
    }


    //分割出来具体字段------用于查询出对应字段  map是从表中已经筛选出来的字段  filed是要查询的字段，fileds是数据库中查询出来的表头
    public List<String[]> concreteField(List<String[]> list,Map<String, String[]> map,String filed,String fileds){
//        String[] str = filed.split(",");//传过来的字段
//        String[] res = fileds.split(",");//查询出来的字段
//        List<Integer> index = new ArrayList<>();
//        //字段匹配,不区分大小写----获取下标
//        for(int i = 0; i<str.length; i++){
//            for(int j = 0 ;j < res.length; j++){
//                if(str[i].equals(res[j])){
//                    index.add(j);
//                }
//            }
//        }
//        for(Map.Entry<String, String[]> entry : map.entrySet()){
//            String[] cxall = entry.getValue();
//            int c = 0;
//            String[] cxfiel = new String[str.length];
//            for(int i=0;i<cxall.length;i++){
//                if(index.contains(i)){
//                    cxfiel[c] = cxall[i];
//                    c++;
//                }
//            }
//            list.add(cxfiel);
//        }
//        return list;
        if(!filed.equals("all")){
            // 查询所有，并指定返回的字段数据static
            String[] str = filed.split(",");//要查询的数据字段
            String[] res = fileds.split(",");//数据库中查询出来的表头
            List<Integer> index = new ArrayList<Integer>();
            //字段匹配,不区分大小写---开始循环表头和要查询的数据字段是否匹配（大小写严格控制相等）
            for(int i = 0; i<str.length; i++){
                for(int j = 0 ;j < res.length; j++){
                    if(str[i].equals(res[j])){
                        index.add(j);//记录列的下标
                    }
                }
            }
            for(Map.Entry<String, String[]> entry : map.entrySet()){
            String[] cxall = entry.getValue();
            int c = 0;
            String[] cxfiel = new String[str.length];
            for(int i=0;i<cxall.length;i++){
                if(index.contains(i)){
                    cxfiel[c] = cxall[i];
                    c++;
                }
            }
            list.add(cxfiel);
        }
            return list;
        }else{
           ///把查询出来的数据存储在list中----匹配字段
            for(Map.Entry<String, String[]> entry : map.entrySet()){
                String[] cxall = entry.getValue();
                String[] cxfield = new String[cxall.length];
                for(int j=0;j<cxall.length;j++){//因为是查询所有的，所以只需要传出去
                    cxfield[j] = cxall[j];
                }
                list.add(cxfield);//把拿数据放在list
            }
            return list;
        }
    }

    //判断是第几列
    public int column(String str,List<String> result){
        String[] fileds = result.get(0).split(",");
        for(int i=0;i<fileds.length;i++){
            if(fileds[i].equals(str)){
                return i;
            }
        }
        return -1;
    }

    //查询这个表的所有的数据
    public List<String[]> selectAll(String tableName, String filed) {
        String tablePath = Path + tableName+".txt";
        if(isTable(tableName)){//在数据库中检测是否存在该表
            List<String[]> list = new ArrayList<String[]>();
            //把表中所有数据都读出来放在result中
            ArrayList<String> result = fileOper.Read(tablePath);
            //判断字段名为不为空，不为空就要区分字段，只查询需要的字段
            if(!filed.equals("all")){
                // 查询所有，并指定返回的字段数据static
                String[] str = filed.split(",");//要查询的数据字段
                String[] res = result.get(0).split(",");//数据库中查询出来的表头
                List<Integer> index = new ArrayList<Integer>();
                //字段匹配,不区分大小写---开始循环表头和要查询的数据字段是否匹配（大小写严格控制相等）
                for(int i = 0; i<str.length; i++){
                    for(int j = 0 ;j < res.length; j++){
                        if(str[i].equals(res[j])){
                            index.add(j);//记录列的下标
                        }
                    }
                }
                if (index.size()==0){
                    System.out.println("字段都未匹配！");
                    return null;
                }
                //根据下标获取数据
                for(int i=1 ; i<result.size() ; i++){
                    int c = 0;
                    String data = result.get(i);//一个result是一行
                    String[] cxall = data.split(",");//查出来的所有数据
                    String[] cxfield = new String[str.length];//需要的数据
                    for(int j=0;j<cxall.length;j++){
                        if(index.contains(j)){//要查询的有该字段
                            cxfield[c] = cxall[j];//把值放进去
                            c++;
                        }
                    }
                    list.add(cxfield);//一起放在list表中传出去
                }
                return list;
            }
            //把查询出来的数据存储在list中----匹配字段
            for(int i=1;i<result.size();i++){//除开表头，所以从1开始
                String data = result.get(i);
                String[] cxall = data.split(",");
                String[] cxfield = new String[cxall.length];
                for(int j=0;j<cxall.length;j++){//因为是查询所有的，所以只需要传出去
                    cxfield[j] = cxall[j];
                }
                list.add(cxfield);//把拿数据放在list
            }
            return list;
        }else {
            System.out.println("该表格不存在！");
            return null;
        }
    }

    //查询表中的部分数据--带有where条件的  表名  符号>  or 字段名
    public List<String[]> selectWhere(String tableName, List<String> dataList, String oper, String filed) {
        String tablePath = Path + tableName+".txt";
        String condition=dataList.get(0);
        String condition1=dataList.get(1);
        List<String[]> list = new ArrayList<>();
        Map<String, String[]> map = new HashMap<>();
        ArrayList<String> result = fileOper.Read(tablePath);//把所有数据查出来
        String operator = Operator.Oper(result,condition);//获取第一个运算符
        String operator1 = Operator.Oper(result,condition1);//获取第二个运算符
        String fileds = result.get(0);//获取要比较的字敦
        if(isTable(tableName)){
            Map<String, String[]> map1,map2;
            List<String[]> list1 = new ArrayList<>();
            List<String[]> list2 = new ArrayList<>();
            map1 = Operator.DataOper(operator,result,condition);//第一个操作符查出来的值
            concreteField(list1,map1,filed,fileds);//将想要的具体字段分割出来，存放在list1
            map2 = Operator.DataOper(operator1,result,condition1);//第二个操作符查出来的值
            concreteField(list2,map2,filed,fileds);//将想要的具体字段分割出来，存放在list2
            if(oper.equals("and")){//and进行与操作
                for(Map.Entry<String, String[]> entry : map1.entrySet()){
                    if(map2.containsKey(entry.getKey())){//两个map对比
                        //判断value的值是否相同
                        String[] str1 = entry.getValue();
                        String[] str2 = map2.get(entry.getKey());
                        int same=1;//相同为1，不同为0
                        for(int i=0;i<str2.length;i++){
                            if(!str1[i].equals(str2[i])){
                                same=0;
                            }
                        }
                        if(same==1){
                            list.add(entry.getValue());
                        }
                    }
                }
            }else if (oper.equals("or")){
                map.putAll(map1);
                map.putAll(map2);
                for(Map.Entry<String, String[]> entry : map.entrySet()){
                    list.add(entry.getValue());
                }
            }else {
                System.out.println("连接符不正确，只有or 和 and！");
                return null;
            }
            return list;
        }else{
            System.out.println("该表格不存在！");
            return null;
        }
    }

    //查询表中的部分数据--带有where条件的 dataList-- condition listAll--field
    public List<String[]> selectOne(String tableName, String condition, String field) {
        String tablePath = Path + tableName+".txt";
        if(isTable(tableName)){
            List<String[]> list = new ArrayList<String[]>();
            Map<String, String[]> map = new HashMap<String,String[]>();
            ArrayList<String> result = fileOper.Read(tablePath);//把所有数据查出来
            String fileds = result.get(0);//表头数据
            String operator = Operator.Oper(result, condition);//获取操作运算符
            if(operator != null){
                map = Operator.DataOper(operator, result , condition);
                list = concreteField(list,map,field, fileds);
            }else{
                System.out.println("字段未匹配！");
                return null;
            }
            return list;
        }else{
            System.out.println("该表格不存在！");
            return null;
        }
    }

    //删除这个表的所有的数据
    public String deleteAll(String tableName) {
        String tablePath = Path + tableName+".txt";
        if(isTable(tableName)){
            //现货区表头在直接删除此表
            ArrayList<String> result = fileOper.Read(tablePath);//把所有数据查出来
            String tableHead=result.get(0);
            File file = new File(tablePath);
            //删除之后再创建
            file.delete();
//            ArrayList<String> tableHead = new ArrayList<String>();
//            for(int i=0;i<fileds.length;i++){
//                tableHead.add(fileds[i]);
//            }
            //开始执行创建表操作
            if(!isTable(tableName)) {//判断是否已经有了同款表
                List<String> list = new ArrayList<String>();
                list.add(tableHead);
                fileOper.Write(tablePath, list);//把数据写到数据库中
            }
        }else{
            return "该表格不存在！";
        }
        return "删除成功！";
    }

    //删除这个表的所有的数据List<String> dataList--condition
    public String deleteOne(String tableName,String condition) {
        String tablePath = Path + tableName+".txt";
        if(isTable(tableName)){
            ArrayList<String> result = fileOper.Read(tablePath);//把所有数据查出来
            List<String> newData = new ArrayList<String>();
            String operator = Operator.Oper(result, condition);
            String name = condition.substring(0,condition.indexOf(operator));
            List<String[]> list = selectOne(tableName, condition, "all");//先把要删除的数据查出来
            List<String> strList = new ArrayList<String>();
            int index = column(name, result);//记录条件是哪一列
            for(String[] str : list)
                strList.add(str[index]);//将条件数据的这一列存储在list表里面
            if(index != -1){
                for(int i=1;i<result.size();i++){
                    String data = result.get(i);
                    String[] cxall = data.split(",");
                    if(!strList.contains(cxall[index])){//将不是这个数据的保存下来
                        newData.add(data);
                    }
                }
                deleteAll(tableName);
                fileOper.Write(tablePath,newData);
            }else{
                return "字段未匹配！";
            }
        }return "删除成功";
    }

    //删除表中的部分数据--带有where条件的
    public String deleteWhere(String tableName,List<String> dataList,String oper){
        String tablePath = Path + tableName+".txt";
        if(isTable(tableName)){
            ArrayList<String> result = fileOper.Read(tablePath);//把所有数据查出来
            Map<String, String> map = new HashMap<String,String>();
            List<String> newData = new ArrayList<>();
            //获取需要删除的数据
            List<String[]> list = selectWhere(tableName, dataList, oper, "all");
            if(list == null){
                return "未查询到要删除的数据！";
            }
            int filed1 = 0;
            int filed2 = 0;
            int k =0;
            for(String str : dataList){
                String operator = Operator.Oper(result, str);//获取操作运算符
                String name = str.substring(0,str.indexOf(operator));//获取条件字段名
                if(k == 0){
                    filed1 = column(name, result);//判断第一个条件字段是第几个下标
                }else{
                    filed2 = column(name, result);//判断第二个条件字段是第几个下标
                }
                k++;//一共就两列需要有该操作
            }
            for(String[] str : list)
                map.put(str[filed1], str[filed2]);//把查询出来的数据都放在map中，因为map可以一次存两个值
            if(filed1 != -1 && filed2 != -1){
                for(int i=1;i<result.size();i++){
                    String data = result.get(i);
                    String[] cxall = data.split(",");
                    boolean flag = true ;
                    for(Map.Entry<String, String> entry : map.entrySet()){//map.entrySet()返回值就是这个map中各个键值对映射关系的集合
                        if(cxall[filed1].equals(entry.getKey()) && cxall[filed2].equals(entry.getValue())){
                            flag = false;//比对出来，相同的不要了
                        }
                    }
                    if(flag){
                        newData.add(result.get(i));//不同的放在新的list里面，再重新写到数据库中
                    }
                }
                deleteAll(tableName);//先把所有的都删除
                fileOper.Write(tablePath,newData);//把不符合条件的重新写到数据库里面去
            }else{
                return "字段未匹配！";
            }
        }else{
            return "该表格不存在！";
        }
        return "删除成功";
    }



    //更改表的所有数据（先删除再重写入）
    public String updateAll(String tableName, String setValue) {
        String tablePath = Path + tableName+".txt";
        if(isTable(tableName)){
            List<String> list = new ArrayList<String>();
            ArrayList<String> result = fileOper.Read(tablePath);//把所有数据查出来
            //截取setValue中的字段和设置的值，用map集合进行保存
            Map<Integer, String> map = new HashMap<Integer, String>();
            String[] values = setValue.split(",");
            for(String str : values){
                //截取字段
                String filed = str.substring(0,str.indexOf("="));
                //截取值
                String value = str.substring(str.indexOf("=")+1);
                //查找此字段的下标
                int key = column(filed, result);
                map.put(key, value);
            }
            //对数据进行修改
            for(int i=1;i<result.size();i++){//数据的行
                String data = result.get(i);
                String[] cxall = data.split(",");//原来查询出来的数据
                String str = null;
                for(int j=0;j<cxall.length;j++){//数据的列
                    if(j==0){
                        if(map.containsKey(j)){//扫描到这一列了，就获取到新数据
                            str=map.get(j);
                        }else{//否则还是原来的数据
                            str=cxall[j];
                        }
                    }else{//除了第一个字段前数据没有“，”，后面的数据都有“，”
                        if(map.containsKey(j)){
                            str=","+map.get(j);
                        }else{
                            str=","+cxall[j];
                        }
                    }
                }
                list.add(str);
            }
            deleteAll(tableName);
            fileOper.Write(tablePath,list);
        }else{
            return  "该表格不存在！";
        }
        return "修改成功！";
    }

    //ist<String> dataList--condition
    public String updateOne(String tableName, String setValue, String condition) {
        String tablePath = Path + tableName+".txt";
        if(isTable(tableName)){
            ArrayList<String> result = fileOper.Read(tablePath);//把所有数据查出来
            List<String> listAll = new ArrayList<String>();
            List<String[]> list = selectOne(tableName, condition,"all");
            //截取setValue中的字段和设置的值，用map集合进行保存
            Map<Integer, String> map = new HashMap<Integer, String>();
            String[] values = setValue.split(",");
            for(String str : values){
                //截取字段
                String filed = str.substring(0,str.indexOf("="));
                //截取值
                String value = str.substring(str.indexOf("=")+1);
                //查找此字段的下标
                int key = column(filed, result);
                map.put(key, value);
            }
            //对数据进行修改
            for(int i=1;i<result.size();i++){
                String data = result.get(i);
                String[] cxall = data.split(",");
                String str = null;
                boolean flag = true;

                for(String[] str1 : list){//遍历行
                    String[] clum = str1;
                    int index = 0;
                    for(int j=0;j<clum.length;j++){//遍历列
                        if(clum[j].equals(cxall[j])){
                            index++;
                        }
                    }

                    //开始进行修改
                    if(index == clum.length){
                        int j = 0;
                        while (index != j) {
                            if(j==0){
                                if(map.containsKey(j)){//扫描到这一列了，就获取到新数据
                                    str=map.get(j);
                                }else{//否则还是原来的数据
                                    str=cxall[j];
                                }
                            }else{
                                if(map.containsKey(j)){
                                    str=","+map.get(j);
                                }else{
                                    str=","+cxall[j];
                                }
                            }
                            j++;
                            flag = false;
                        }
                    }
                }
                if(flag){
                    str = data;
                }
                listAll.add(str);
            }
            if(listAll.size() == 0){
                return "未查询到要修改的数据！";
            }
            deleteAll(tableName);
            fileOper.Write(tablePath,listAll);
        }else{
            return "该表格不存在！";
        }
        return "修改成功！";
    }


    //更改表中的部分数据（返回改后的数据）
    public String updateWhere(String tableName, String setValue, List<String> dataList,String oper) {
        String tablePath = Path + tableName+".txt";
        if(isTable(tableName)){
            ArrayList<String> result = fileOper.Read(tablePath);//把所有数据查出来
            List<String> listAll = new ArrayList<String>();
            List<String[]> list = selectWhere(tableName, dataList, oper, "all");
            //截取setValue中的字段和设置的值，用map集合进行保存
            Map<Integer, String> map = new HashMap<Integer, String>();
            String[] values = setValue.split(",");
            for(String str : values){
                //截取字段
                String filed = str.substring(0,str.indexOf("="));
                //截取值
                String value = str.substring(str.indexOf("=")+1);
                //查找此字段的下标
                int key = column(filed, result);
                map.put(key, value);
            }
            //对数据进行修改
            for(int i=1;i<result.size();i++){
                String data = result.get(i);
                String[] cxall = data.split(",");
                String str = null;
                boolean flag = true;

                for(String[] str1 : list){//遍历行
                    String[] clum = str1;
                    int index = 0;
                    for(int j=0;j<clum.length;j++){//遍历列
                        if(clum[j].equals(cxall[j])){
                            index++;
                        }
                    }
                    if(index == clum.length){
                        int j = 0;
                        while (index != j) {
                            if(j==0){
                                if(map.containsKey(j)){//扫描到这一列了，就获取到新数据
                                    str=map.get(j);
                                }else{//否则还是原来的数据
                                    str=cxall[j];
                                }
                            }else{
                                if(map.containsKey(j)){
                                    str=","+map.get(j);
                                }else{
                                    str=","+cxall[j];
                                }
                            }
                            j++;
                            flag = false;
                        }
                    }
                }
                if(flag){
                    str = data;
                }
                listAll.add(str);
            }
            if(listAll.size() == 0){
                return "未查询到要修改的数据！";
            }
            deleteAll(tableName);
            fileOper.Write(tablePath,listAll);
        }else{
            return "该表格不存在！";
        }
        return "修改成功！";
    }

    //创建表的执行
    @Override
    public String executeCreate(String sql){
        String[] keySql =sql.split(" ");//字符串分割成字符串数组
        //判断是不是创建表操作
        String cj=keySql[0].toLowerCase();
        if(cj.equals("cj")&&keySql.length==3){
            String tableName = keySql[1];//获取表名
            //cj student (id,studentID,studentName,sex,age) 获取要创建的表头关键字存在列表中
            String field= keySql[2];//获取后面的关键字
            //第三个是字段的值！！--只能一次插入
            String temp1 =field.substring(1,field.length()-1);//直接去掉了括号
            if(!isTable(tableName)){//判断是否已经有了同款表
                List<String> list = new ArrayList<String>();
                String tablePath = Path + tableName+".txt";
                list.add(temp1);
                fileOper.Write(tablePath,list);//把数据写到数据库中
            }else{
                return "该表格已存在，不能重复创建！";
            }
            return "创建成功！";
        }else{
            return"sql语句不正确！";
        }
    }

    @Override
    public String executeInsert(String sql) {
        String resp;//创建返回语句
        String[] keySql =sql.split(" ");
        String cr=keySql[0].toLowerCase();
        //判断是不是insert插入数据的操作 cr student (190001,张三,男,18)
        if(cr.equals("cr")&&keySql.length==3){//第一个是关键字
            String tableName = keySql[1];//第二个是表名
            String field= keySql[2];//获取后面的关键字
            ArrayList<String> tableValue = new ArrayList<>();//获取到字段的值
            //第三个是字段的值！！--只能一次插入
            String temp1 =field.substring(1,field.length()-1);
            String[] key;
            if (temp1.contains(",")) {
                //有多个字段，用“，”分离的情况
                key = temp1.split(",");
            }else{
                //针对只有一个字段的情况
                key = new String[1];
                key[0] = temp1;
            }
            for (int i = 0; i < key.length; i++)
                tableValue.add(key[i]);
            String tablePath = Path + tableName+".txt";
            if(isTable(tableName)){
                List<String> list = new ArrayList<String>();
                //读取库中的数据
                ArrayList<String> tableHead = fileOper.Read(tablePath);
                if(tableHead.size() == 0){
                    System.out.println();
                    return "没有字段！";
                }else {
                    int index = tableValue.size();//获取字段长度
                    int headLength = tableHead.get(0).split(",").length;//获取表头长度
                    if (headLength != index) {
                        return "字段未匹配！";
                    }else {
                        list.add(temp1);
                        fileOper.Write(tablePath, list);
                    }
                }
            }else{
                return "该表格不存在！";
            }
        }else{
            return "sql语句不正确!";
        }
        return "插入成功！";
    }

    @Override
    public List<String[]> executeSelect(String sql) {//查询表字段cx student all
        String[] keyword = sql.split(" ");
        String cx=keyword[0].toLowerCase();
        String field = keyword[2]; //表示查询的字段名固定
        List<String[]> result = null;//表示查询出来的结果
        if(cx.equals("cx")){//第一个是关键字
            String tableName = keyword[1];//第三个是表名
            if(keyword.length == 3){//查询表字段 cx table all

                result = selectAll(tableName,field);//查询所有数据

            }else if(keyword.length == 4){//没有与/或关系
//表cx mmmaaa userID,userName,sex,age sex=男
                String condition = keyword[3];//sex=男 条件一
                result = selectOne(tableName,condition,field);

            }else {
//表示查询带where 和有与/或 条件的数据 cx mmmaaa sex,age sex=男 or sex=女
                List<String> list = new ArrayList<String>();
                list.add(keyword[3]);//条件1
                list.add(keyword[5]);//条件2
                String oper = keyword[4].toLowerCase();
                //判断是与操作还是或操作
                result = selectWhere(tableName,list,oper,field);
            }
        }else{
            System.out.println("sql语句不正确!");
            return null;
        }
        return result;
    }

    @Override
    public String executeDelete(String sql) {
        String resp = "删除成功！";//创建返回语句
        String[] keyword = sql.split(" ");
        String sc=keyword[0].toLowerCase();
        if(sc.equals("sc")){
            String tableName = keyword[1];//获取表明
            //删除表中所有数据 sc student
            if(keyword.length == 2){
                resp=deleteAll(tableName);//先删整个表文件再新增一个表文件
            }else if(keyword.length == 3){
                //sc table id=1
                String key = keyword[2];
                resp=deleteOne(tableName,key);
                //先把所有的都删除，再把不符合条件的重新写到数据库里面去
            }else if(keyword.length == 5){ //sc table id=1 and age>20
                List<String> list = new ArrayList<String>();
                list.add(keyword[2]);
                list.add(keyword[4]);
                String oper=keyword[3].toLowerCase();//链接操作符
                resp=deleteWhere(tableName,list,oper);
            }
        }else{
            return "sql语句不正确!";
        }
        return resp;
    }

    @Override
    public String executeUpdate(String sql) {
        String resp="修改成功！";//创建返回语句
        String[] keyword = sql.split(" ");
        String gx=keyword[0].toLowerCase();
        String tableName = keyword[1];//获取表名
        String value = keyword[2];  //获取要修改的值
        if(gx.equals("gx")){
            //修改所有字段的值
            if(keyword.length == 3){
                resp=updateAll(tableName, value);//更改表的所有数据（先删除再重写入）
            }else{
                //gx student sex=男,age=20 qz id=1
                if((keyword[3].equals("qz"))){
                    if((keyword.length == 5)){
                        String key = keyword[4];
                        resp=updateOne(tableName,value,key);
                    }else if((keyword.length == 7)){
                        //gx student sex=男,age=20 where id=4 and id=5
                        List<String> list = new ArrayList<String>();
                        list.add(keyword[4]);
                        list.add(keyword[6]);
                        String oper = keyword[5].toLowerCase();
                        resp=updateWhere(tableName, value,list,oper);
                    }
                }else {
                    return "sql语句不正确!";
                }
            }
        }else{
            return "sql语句不正确!";
        }
        return resp;
    }

    @Override
    public String executeDrop(String sql) {
        String resp = "删除表成功！";//创建返回语句
        String[] keyword = sql.split(" ");
        String drop=keyword[0].toLowerCase();
        if(drop.equals("drop")){
            String tableName = keyword[1];//获取表明
            //删除表中所有数据 sc student
            if(keyword.length == 2){
                String tablePath = Path + tableName+".txt";
                if(isTable(tableName)){
                    File file = new File(tablePath);
                    file.delete();  //删除之后再创建
            }
        }else {
                return "sql语句不正确!";
            }
        }
        return resp;
    }
}