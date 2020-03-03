package Client;


public class Client {

    public static void main(String[] args) throws InterruptedException {
        // 开启三个客户端，一个线程代表一个客户端

        //客户端1
        Thread thread1 = new Thread(new SqlRun());
        thread1.start();
        thread1.join();

        //客户端5
        Thread thread5 = new Thread(new SqlRun());
        thread5.start();
        thread5.join();

        //客户端3
        Thread thread3 = new Thread(new SqlRun());
        thread3.start();
        thread3.join();

        //客户端4
        Thread thread4 = new Thread(new SqlRun());
        thread4.start();
        thread4.join();

        //客户端2
        Thread thread2 = new Thread(new SqlRun());
        thread2.start();
        thread2.join();

        //客户端6
        Thread thread6 = new Thread(new SqlRun());
        thread6.start();
        thread6.join();

    }
    /*
     *创建表格：
     * cj student1 (id.pk,studentID,studentName,sex,age)
     *
     * 插入数据
     * cr student (190001,张三,男,18)
     *
     * cr student (2,190002,李四,女,18)
     * 查询数据
     * cx * from student
     *
     * cx * from student where sex=女
     *
     * 删除数据
     * sc from student where id=2
     *
     *
     * 更新数据
     * gx student set age=20 where id=6
     *gx student set studentName=王五,studentID=190003,id=3 where age=18
     *
     * cr mmmaaa (userID100000,userName,男,20)
     * ""+i+""+i+","+(Math.random()<0.5?"女":"")+","+(int)(18+Math.random()*47)+")";
     *
     *
     *
     *
     *
    * cx userID,userName,sex,age from aaa where sex=女
    * cx userID,userName,sex,age from aaa where age>20
    *
    * drop student
    *
    *
    * */
}