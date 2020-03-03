package Server;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class fileOper {

    //进行写入数据到数据库中
    public static void Write(String fileName, List<String> list) {
        try {
            FileOutputStream stream =new FileOutputStream(fileName,true);//打开文件流
            OutputStreamWriter streamWriter=new OutputStreamWriter(stream,"UTF-8");
            PrintWriter writer = new PrintWriter(streamWriter);
            for(String str : list){
                writer.println(str);
            }
            writer.flush();
            writer.close();
            stream.close();//用完后关闭
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //从文件中把数据读取出来
    public static ArrayList<String> Read(String fileName){
        ArrayList<String> temp = new ArrayList<String>();
        try {
            InputStream stream = new FileInputStream(fileName);//打开文件
            InputStreamReader streamReader = new InputStreamReader(stream,"UTF-8");//将转化为1001形式
            BufferedReader reader = new BufferedReader(streamReader);//进行封装
            //创建数据库容器
            String str;
            while ((str = reader.readLine()) != null) {//一行一行的读数据
                temp.add(str);//开始读数据，将数据放在容器中
            }
            reader.close();
            streamReader.close();
            stream.close();//关闭文件流
        } catch (Exception e) {
            e.printStackTrace();
        }
        return temp;//返回读了的数据
    }
}
