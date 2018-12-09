package func.common;

import bean.getBean;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class fileReader {

    public void dburlReader() throws FileNotFoundException {

        Scanner fileIn = new Scanner(new File("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 8.5\\webapps\\JHLIS_MYSQL_DBURL.txt"));
        String dBurl = fileIn.nextLine();
        getBean.setMyUrl(dBurl);


    }
}
