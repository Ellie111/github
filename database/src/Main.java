import Server.ExecuteService;
import Server.ExecuteServiceImpl;

import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        String str="cx bbb userID,userName,sex,age";
        ExecuteService executeService = new ExecuteServiceImpl();
        List<String[]> list = executeService.executeSelect(str);
        List<String> lst = new ArrayList<String>();
        lst.add("\n");
        for(String[] obj : list){
            for(int i=0;i<obj.length;i++){
                lst.add(obj[i]+"     ");
            }
            lst.add("\n");
        }
System.out.println(lst);
    }
}
