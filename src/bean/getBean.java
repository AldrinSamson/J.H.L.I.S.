package bean;
import java.io.BufferedReader;
import java.io.FileReader;


public class getBean {

	private static String myUrl = "jdbc:mysql://localhost/jhlis?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=8888";

	private static String myClass = "com.mysql.cj.jdbc.Driver";

	public static String getMyUrl() {
		return myUrl;
	}

	public static void setMyUrl(String myUrl) {
		getBean.myUrl = myUrl;
	}

	public static String getMyClass() {
		return myClass;
	}



	//Connection Pooling
	/*private static String dburl = "jdbc:mysql://localhost/jhlis";

	private static String dbuser = "root";

	private static String dbpass = "8888";

	public static String getDburl() {
		return dburl;
	}

	public static void setDburl(String dburl) {
		getBean.dburl = dburl;
	}

	public static String getDbuser() {
		return dbuser;
	}

	public static void setDbuser(String dbuser) {
		getBean.dbuser = dbuser;
	}

	public static String getDbpass() {
		return dbpass;
	}

	public static void setDbpass(String dbpass) {
		getBean.dbpass = dbpass;
	}*/


}
