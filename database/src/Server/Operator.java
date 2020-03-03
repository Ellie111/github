package Server;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Operator {

    //运算操作符的获取 sex=男
    public static String Oper(ArrayList<String> result, String reg){
        String[] data= result.get(0).split(",");
        String operator = null;
        for(String str : data){
            if(reg.indexOf(str) != -1){
                //截取运算符
                int len=str.length();
                operator = reg.substring(len,len+1);
                if(reg.substring(len+1,len+2).equals("=")){//针对>=和<=的情况
                    operator = reg.substring(len,len+2);
                }
            }
        }
        return operator;
    }

    //针对非数字的比较
    public static Map<String,String[]> dataTable(ArrayList<String> result,Map<String,String[]> map ,List<String> valueList , String filed){
        String[] res = result.get(0).split(",");
        int index = 0;
        //字段匹配,不区分大小写
        for(int i = 0; i<res.length; i++){
            if(filed.toLowerCase().equals(res[i].toLowerCase())){
                index = i;
            }
        }
        //根据下标获取数据
        for(int i=1 ; i<result.size() ; i++){
            String data = result.get(i);
            String[] query = data.split(",");
            if(valueList.contains(query[index])){
                map.put(query[0], query);
            }
        }
        return map;
    }

    //针对数字类比较
    public static Map<String,String[]> numdataTable(ArrayList<String> result,Map<String,String[]> map ,List<String> valueList , String filed){
        String[] res = result.get(0).split(",");
        int index = 0;
        for(int i = 0; i<res.length; i++){
            if(filed.toLowerCase().equals(res[i].toLowerCase()))
            index = i;
        }
        //根据下标获取数据
        for(int i=1 ; i<result.size() ; i++){
            String data = result.get(i);
            String[] query = data.split(",");
            if(valueList.contains(query[index])){
                map.put(query[0], query);
            }
        }
        return map;
    }

    //大于
    public static Map<String, String[]> MoreThan(ArrayList<String> result,String filed,String value){
        Map<String, String[]> map = new HashMap<String,String[]>();
        List<String> list = new ArrayList<String>();
        List<String[]> listAll = new ArrayList<String[]>();
        // 查询所有，并指定返回的字段数据
        if(filed != null){
            // 查询所有，并指定返回的字段数据static
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
                int c = 0;
                String data = result.get(i);
                String[] cxall = data.split(",");
                String[] cxfield = new String[str.length];
                for(int j=0;j<cxall.length;j++){
                    if(index.contains(j)){
                        cxfield[c] = cxall[j];
                        c++;
                    }
                }
                listAll.add(cxfield);
            }
        }
        int a = Integer.parseInt(value);//条件传过来的值
        for(String[] str1 : listAll){
            for(int i=0;i<str1.length;i++){
                    int b = Integer.parseInt(str1[i]);//读出来的数据值
                        if(b > a){
                            list.add(str1[i]);
                }
            }
        }
        numdataTable(result,map,list,value);
        return map;
    }

    //小于
    public static Map<String, String[]> LessThan(ArrayList<String> result,String filed,String value){
        Map<String, String[]> map = new HashMap<String,String[]>();
        List<String> list = new ArrayList<String>();
        List<String[]> listAll = new ArrayList<String[]>();
        // 查询所有，并指定返回的字段数据
        if(filed != null){
            // 查询所有，并指定返回的字段数据static
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
                int c = 0;
                String data = result.get(i);
                String[] cxall = data.split(",");
                String[] cxfield = new String[str.length];
                for(int j=0;j<cxall.length;j++){
                    if(index.contains(j)){
                        cxfield[c] = cxall[j];
                        c++;
                    }
                }
                listAll.add(cxfield);
            }
        }
        int a = Integer.parseInt(value);//条件传过来的值
        for(String[] str1 : listAll){
            for(int i=0;i<str1.length;i++){
                int b = Integer.parseInt(str1[i]);//读出来的数据值
                if(b < a){
                    list.add(str1[i]);
                }
            }
        }
        numdataTable(result,map,list,value);
        return map;
    }


    //等于
    public static Map<String, String[]> BeEqual(ArrayList<String> result,String filed,String value){
        Map<String, String[]> map = new HashMap<String,String[]>();
        List<String> list = new ArrayList<String>();
        List<String[]> listAll = new ArrayList<String[]>();
        // 查询所有，并指定返回的字段数据static
        if(filed != null){
            // 查询所有，并指定返回的字段数据static
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
                int c = 0;
                String data = result.get(i);
                String[] cxall = data.split(",");
                String[] cxfield = new String[str.length];
                for(int j=0;j<cxall.length;j++){
                    if(index.contains(j)){
                        cxfield[c] = cxall[j];
                        c++;
                    }
                }
                listAll.add(cxfield);
            }
        }

        for(String[] str1 : listAll){
            for(int i=0;i<str1.length;i++){
                if(value.equals(str1[i])){
                    list.add(str1[i]);
                }
            }
        }
        dataTable(result,map,list,filed);
        return map;
    }

    //大于等于
    public static Map<String, String[]> EqualMoreThan(ArrayList<String> result,String filed,String value){
        Map<String, String[]> map = MoreThan(result,filed,value);
        Map<String, String[]> mapValue = BeEqual(result,filed,value);
        map.putAll(mapValue);
        return map;
    }

    //小于等于
    public static Map<String, String[]> EqualLessThan(ArrayList<String> result,String filed,String value){
        Map<String, String[]> map = LessThan(result,filed,value);
        Map<String, String[]> mapValue = BeEqual(result,filed, value);
        map.putAll(mapValue);
        return map;
    }

    //不等于
    public static Map<String, String[]> NotBeEqual(ArrayList<String> result,String filed,String value){
        Map<String, String[]> map = new HashMap<String,String[]>();
        List<String> list = new ArrayList<String>();
        List<String[]> listAll = new ArrayList<String[]>();
        // 查询所有，并指定返回的字段数据static
        if(filed != null){
            // 查询所有，并指定返回的字段数据static
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
                int c = 0;
                String data = result.get(i);
                String[] cxall = data.split(",");
                String[] cxfield = new String[str.length];
                for(int j=0;j<cxall.length;j++){
                    if(index.contains(j)){
                        cxfield[c] = cxall[j];
                        c++;
                    }
                }
                listAll.add(cxfield);
            }
        }

        for(String[] str1 : listAll){
            for(int i=0;i<str1.length;i++){
                if(!value.equals(str1[i])){
                    list.add(str1[i]);
                }
            }
        }
        dataTable(result,map, list,value);
        return map;
    }

    //符号与具体操作匹配
    public static Map<String, String[]> DataOper(String oper, ArrayList<String> result , String keyName){
        Map<String, String[]> map = new HashMap<String,String[]>();
        String filed = keyName.substring(0,keyName.indexOf(oper));
        String filedValue = keyName.substring(keyName.indexOf(oper)+oper.length());
        if(oper.equals(">")){
            map = MoreThan(result,filed,filedValue);
        }else if(oper.equals("<")){
            map = LessThan(result,filed,filedValue);
        }else if(oper.equals("=")){
            map = BeEqual(result,filed,filedValue);
        }else if(oper.equals(">=")){
            map = EqualMoreThan(result,filed,filedValue);
        }else if(oper.equals("<=")){
            map = EqualLessThan(result,filed,filedValue);
        }else{
            map = NotBeEqual(result,filed,filedValue);
        }
        return map;
    }


}
