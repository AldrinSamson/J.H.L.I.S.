package bean;

public class getBean {
	private static String msUrl = "jdbc:sqlserver://ALDRINSAMSON:1433;database=JHLIS;user=sa;password=123";

	private static String myUrl = "jdbc:mysql://localhost/jhlis?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=8888";
	
	private static String msClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	
	private static String myClass = "com.mysql.cj.jdbc.Driver";	
	
	private static String Ename , Edesc , Elab ,  EcalibDate ;
	
	private static int Eq;
	
	private static String cName , cForm , cDesc , cLab , cUnit , cMeasure , cExpireDate;
	
	private static String abbv1 , abbv2 , abbv3;
	
	private static String abbvC1 , abbvC2 , abbvC3;
	
	private static String abbvCF1 , abbvCF2 , abbvCF3;
	
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

	
	
	public static String getAbbvCF1() {
		return abbvCF1;
	}

	public static void setAbbvCF1(String abbvCF1) {
		getBean.abbvCF1 = abbvCF1;
	}

	public static String getAbbvCF2() {
		return abbvCF2;
	}

	public static void setAbbvCF2(String abbvCF2) {
		getBean.abbvCF2 = abbvCF2;
	}

	public static String getAbbvCF3() {
		return abbvCF3;
	}

	public static void setAbbvCF3(String abbvCF3) {
		getBean.abbvCF3 = abbvCF3;
	}

	public static String getAbbvC1() {
		return abbvC1;
	}

	public static void setAbbvC1(String abbvC1) {
		getBean.abbvC1 = abbvC1;
	}

	public static String getAbbvC2() {
		return abbvC2;
	}

	public static void setAbbvC2(String abbvC2) {
		getBean.abbvC2 = abbvC2;
	}

	public static String getAbbvC3() {
		return abbvC3;
	}

	public static void setAbbvC3(String abbvC3) {
		getBean.abbvC3 = abbvC3;
	}

	public static String getcName() {
		return cName;
	}

	public static void setcName(String cName) {
		getBean.cName = cName;
	}

	public static String getcForm() {
		return cForm;
	}

	public static void setcForm(String cForm) {
		getBean.cForm = cForm;
	}

	public static String getcDesc() {
		return cDesc;
	}

	public static void setcDesc(String cDesc) {
		getBean.cDesc = cDesc;
	}

	public static String getcLab() {
		return cLab;
	}

	public static void setcLab(String cLab) {
		getBean.cLab = cLab;
	}

	public static String getcUnit() {
		return cUnit;
	}

	public static void setcUnit(String cUnit) {
		getBean.cUnit = cUnit;
	}

	public static String getcMeasure() {
		return cMeasure;
	}

	public static void setcMeasure(String cMeasure) {
		getBean.cMeasure = cMeasure;
	}

	public static String getcExpireDate() {
		return cExpireDate;
	}

	public static void setcExpireDate(String cExpireDate) {
		getBean.cExpireDate = cExpireDate;
	}

	public static int getEq() {
		return Eq;
	}

	public static void setEq(int eq) {
		Eq = eq;
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

	public static String getEname() {
		return Ename;
	}

	public static void setEname(String ename) {
		Ename = ename;
	}

	public static String getEdesc() {
		return Edesc;
	}

	public static void setEdesc(String edesc) {
		Edesc = edesc;
	}

	public static String getElab() {
		return Elab;
	}

	public static void setElab(String elab) {
		Elab = elab;
	}


	public static String getEcalibDate() {
		return EcalibDate;
	}

	public static void setEcalibDate(String ecalibDate) {
		EcalibDate = ecalibDate;
	}

	public static String getMsUrl() {
		return msUrl;
	}

	public static void setMsUrl(String msUrl) {
		getBean.msUrl = msUrl;
	}

	public static String getMyUrl() {
		return myUrl;
	}

	public static void setMyUrl(String myUrl) {
		getBean.myUrl = myUrl;
	}

	public static String getMsClass() {
		return msClass;
	}

	public static void setMsClass(String msClass) {
		getBean.msClass = msClass;
	}

	public static String getMyClass() {
		return myClass;
	}

	public static void setMyClass(String myClass) {
		getBean.myClass = myClass;
	}
	
	
	
}
