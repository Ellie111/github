package Client;

import java.io.*;
import java.net.Socket;
import java.util.Scanner;

public class SqlRun implements Runnable {

    @Override
    public void run() {
        try {

            //建立连接
            Socket client= new Socket("127.0.0.1", 5566);
            
            Scanner sc=new Scanner(System.in);
            System.out.println("客户端：请输入SQL语句");//建立连接
            String sql =sc.nextLine();
            if (sc.hasNextLine()) {
                System.out.println("输入的语句为：" + sql);
            }

            //发送数据
            Writer writer = null;
            if(writer == null) {
                writer = new OutputStreamWriter(client.getOutputStream(), "UTF-8");
            }
            writer.write(sql);
            writer.write("eof\n");
            writer.flush();// 写完后要记得flush

            //读数据
            Reader reader = new InputStreamReader(client.getInputStream(), "UTF-8");
            // 设置接收数据超时间为10秒
            client.setSoTimeout(10*1000);
            char[] chars = new char[64];
            int len;
            StringBuilder sb = new StringBuilder();//书P340
            while ((len = reader.read(chars)) != -1) {
                sb.append(new String(chars, 0, len));
            }
            System.out.println("Cliect[port:" + client.getLocalPort() + "] 消息收到了，内容:" + sb.toString());//从服务器端接收返回的信息

            // 关闭连接
            reader.close();//获取到service的回应！
            writer.close();
            client.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
