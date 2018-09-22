package bean;

public class getBean {
	private static String msUrl = "jdbc:sqlserver://ALDRINSAMSON:1433;database=JHLIS;user=sa;password=123";

	private static String myUrl = "jdbc:mysql://localhost/jhlis?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=8888";
	
	private static String msClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	
	private static String myClass = "com.mysql.cj.jdbc.Driver";
	
	private static String abbv1 , abbv2 , abbv3;
	
	private static String abbvF1;
	private static String abbvF2;
	private static String abbvF3;
	private static String iName;
	private static String iForm;
	private static String iDate;
	private static String iUnit;
	private static String iDesc;
	private static String iLab;
	private static String iType;
	private static String iDateType;
	private static String iCondition;
	private static String iKey;
	private static int iQuantity;

	private static  String rMessage;
	private static  int rID;
	
	private static String nName , nDesc , nLab;
	
	private static String abbvN1 , abbvN2 , abbvN3;
	
	public static String getnName() {
		return nName;
	}

	public static void setnName(String nName) {
		getBean.nName = nName;
	}

	public static String getnDesc() {
		return nDesc;
	}

	public static void setnDesc(String nDesc) {
		getBean.nDesc = nDesc;
	}

	public static String getnLab() {
		return nLab;
	}

	public static void setnLab(String nLab) {
		getBean.nLab = nLab;
	}

	public static String getAbbvN1() {
		return abbvN1;
	}

	public static void setAbbvN1(String abbvN1) {
		getBean.abbvN1 = abbvN1;
	}

	public static String getAbbvN2() {
		return abbvN2;
	}

	public static void setAbbvN2(String abbvN2) {
		getBean.abbvN2 = abbvN2;
	}

	public static String getAbbvN3() {
		return abbvN3;
	}

	public static void setAbbvN3(String abbvN3) {
		getBean.abbvN3 = abbvN3;
	}

	
	public static String getAbbv1() {
		return abbv1;
	}

	public static void setAbbv1(String abbv1) {
		getBean.abbv1 = abbv1;
	}

	public static String getAbbv2() {
		return abbv2;
	}

	public static void setAbbv2(String abbv2) {
		getBean.abbv2 = abbv2;
	}

	public static String getAbbv3() {
		return abbv3;
	}

	public static void setAbbv3(String abbv3) {
		getBean.abbv3 = abbv3;
	}

	public static String getMyUrl() {
		return myUrl;
	}

	public static String getMyClass() {
		return myClass;
	}

	public static String getAbbvF1() {
		return abbvF1;
	}

	public static void setAbbvF1(String abbvF1) {
		getBean.abbvF1 = abbvF1;
	}

	public static String getAbbvF2() {
		return abbvF2;
	}

	public static void setAbbvF2(String abbvF2) {
		getBean.abbvF2 = abbvF2;
	}

	public static String getAbbvF3() {
		return abbvF3;
	}

	public static void setAbbvF3(String abbvF3) {
		getBean.abbvF3 = abbvF3;
	}

	public static String getiName() {
		return iName;
	}

	public static void setiName(String iName) {
		getBean.iName = iName;
	}

	public static String getiForm() {
		return iForm;
	}

	public static void setiForm(String iForm) {
		getBean.iForm = iForm;
	}

	public static String getiDate() {
		return iDate;
	}

	public static void setiDate(String iDate) {
		getBean.iDate = iDate;
	}

	public static String getiUnit() {
		return iUnit;
	}

	public static void setiUnit(String iUnit) {
		getBean.iUnit = iUnit;
	}

	public static String getiDesc() {
		return iDesc;
	}

	public static void setiDesc(String iDesc) {
		getBean.iDesc = iDesc;
	}

	public static String getiLab() {
		return iLab;
	}

	public static void setiLab(String iLab) {
		getBean.iLab = iLab;
	}

	public static String getiType() {
		return iType;
	}

	public static void setiType(String iType) {
		getBean.iType = iType;
	}

	public static String getiDateType() {
		return iDateType;
	}

	public static void setiDateType(String iDateType) {
		getBean.iDateType = iDateType;
	}

	public static String getiCondition() {
		return iCondition;
	}

	public static void setiCondition(String iCondition) {
		getBean.iCondition = iCondition;
	}

	public static String getiKey() {
		return iKey;
	}

	public static void setiKey(String iKey) {
		getBean.iKey = iKey;
	}

	public static int getiQuantity() {
		return iQuantity;
	}

	public static void setiQuantity(int iQuantity) {
		getBean.iQuantity = iQuantity;
	}

	public static String getrMessage() {
		return rMessage;
	}

	public static void setrMessage(String rMessage) {
		getBean.rMessage = rMessage;
	}

	public static int getrID() {
		return rID;
	}

	public static void setrID(int rID) {
		getBean.rID = rID;
	}
}
