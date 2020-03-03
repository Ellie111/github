package Server;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class Server {

        public static void main(String[] args) throws IOException {
            // 为了简单起见，所有的异常信息都往外抛
            // 定义一个ServiceSocket监听在端口8899上
            ServerSocket server = new ServerSocket(5566);
            System.out.println(5566+"等待与客户端建立连接...");
            while (true) {
                // server尝试接收其他Socket的连接请求，server的accept方法是阻塞式的
                Socket socket = server.accept();
                /**
                 * 我们的服务端处理客户端的连接请求是同步进行的， 每次接收到来自客户端的连接请求后，
                 * 都要先跟当前的客户端通信完之后才能再处理下一个连接请求。 这在并发比较多的情况下会严重影响程序的性能，
                 * 为此，我们可以把它改为如下这种异步处理与客户端通信的方式
                 */
                // 每接收到一个Socket就建立一个新的线程来处理它
                new Thread(new Task(socket)).start();
            }
        }

        /**
         * 处理Socket请求的线程类
         */
        static class Task implements Runnable {//继承Java自运行Runnable接口

            private Socket socket;

            /**
             * 构造函数
             */
            public Task(Socket socket) {
                this.socket = socket;
            }

            @Override
            public void run() {
                try {
                    //缓冲区字符
                    BufferedReader reader = new BufferedReader(
                            new InputStreamReader(socket.getInputStream(), "UTF-8"));//client L91发送
                    StringBuilder sb = new StringBuilder();
                    String temp;
                    int index;
                    while ((temp = reader.readLine()) != null) {
                        if ((index = temp.indexOf("eof")) != -1) { // 遇到eof时就结束接收
                            sb.append(temp.substring(0, index));
                            break;
                        }
                        sb.append(temp);
                    }
                    System.out.println("Form Cliect[port:" + socket.getPort()
                            + "] 消息内容:" + sb.toString());

                    //关于回应的内容
                    String rsp = reply(sb.toString());
                    // 回应一下客户端
                    Writer writer = new OutputStreamWriter(socket.getOutputStream(),
                            "UTF-8");
                    writer.write(rsp);
                    writer.flush();
                    writer.close();
                    System.out.println(
                            "To Cliect[port:" + socket.getPort() + "] 回复客户端的消息发送成功");

                    reader.close();
                    socket.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }


            //对于传过来的字符串进行解析，返回操作后语句
            private static String reply(String str) {
                //回应客户端拿出来单独操作
                if (str.contains("cx")) {//表的查询操作
                    ExecuteService executeService = new ExecuteServiceImpl();//进行建表操作
                    //回应客户端建表成功
                    try {
                        List<String[]> list = executeService.executeSelect(str);
                        List<String> lst = new ArrayList<String>();
                        lst.add("\n");
                        for (String[] str1 : list) {
                            for (int i = 0; i < str1.length; i++) {
                                lst.add(str1[i] + " ");
                            }
                            lst.add("\n");
                        }
                        if (lst.size() == 1) {
                            lst.add("查询数据为空");
                        }
                        String s = lst.toString();//把列表转化为String类型进行传输
                        return s;
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (str.contains("cj")) {//表的创建操作
                    ExecuteService executeService = new ExecuteServiceImpl();//进行建表操作
                    //回应客户端建表成功
                    try {
                        return executeService.executeCreate(str);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (str.contains("cr")) {//表的插入操作
                    ExecuteService executeService = new ExecuteServiceImpl();//表的插入操作
                    try {
                        return executeService.executeInsert(str);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    //回应客户端插入表格是否可以
                }
                if (str.contains("sc")) {//表的删除操作
                    ExecuteService executeService = new ExecuteServiceImpl();//表的删除操作
                    try {
                        return executeService.executeDelete(str);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    //回应客户端插入表格是否可以
                }
                if (str.contains("gx")) {//表的更新操作
                    ExecuteService executeService = new ExecuteServiceImpl();//进行表的删除操作
                    try {
                        return executeService.executeUpdate(str);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (str.contains("drop")) {//删除整个表
                    ExecuteService executeService = new ExecuteServiceImpl();
                    try {
                        return executeService.executeDrop(str);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                return "没有该操作";
            }
        }
}
