package crt.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Split {
	/*static String s = "[MakeDrug [mdid=24, pno=4, dno=1, sno=20170001, count=2, makeDrugDate=2017-02-17, useDrugDate=2017-02-18, send=否, pname=病人4, dname=药物1], MakeDrug [mdid=25, pno=4, dno=2, sno=20170001, count=3, makeDrugDate=2017-02-17, useDrugDate=2017-02-18, send=否, pname=病人4, dname=药物2], MakeDrug [mdid=29, pno=4, dno=1, sno=20170001, count=2, makeDrugDate=2017-02-18, useDrugDate=2017-02-18, send=否, pname=病人4, dname=药物1], MakeDrug [mdid=30, pno=4, dno=2, sno=20170001, count=4, makeDrugDate=2017-02-18, useDrugDate=2017-02-18, send=否, pname=病人4, dname=药物2], MakeDrug [mdid=31, pno=4, dno=3, sno=20170001, count=2, makeDrugDate=2017-02-18, useDrugDate=2017-02-18, send=否, pname=病人4, dname=药物3], MakeDrug [mdid=26, pno=5, dno=1, sno=20170001, count=2, makeDrugDate=2017-02-17, useDrugDate=2017-02-18, send=否, pname=病人5, dname=药物1], MakeDrug [mdid=27, pno=5, dno=2, sno=20170001, count=2, makeDrugDate=2017-02-17, useDrugDate=2017-02-18, send=否, pname=病人5, dname=药物2], MakeDrug [mdid=28, pno=5, dno=3, sno=20170001, count=1, makeDrugDate=2017-02-17, useDrugDate=2017-02-18, send=否, pname=病人5, dname=药物3]]";
	public static void main(String[] args) {
		List<Integer> mdids = get(s);
		System.out.println(mdids);
	}
	*/
	public List<Integer> slpitIntArray(String s) {
		List<Integer> mdids = new ArrayList<Integer>();
		String regex="mdid=\\d+";        
        Pattern pattern=Pattern.compile(regex);         
        Matcher matcher=pattern.matcher(s);
        while(matcher.find()){
        	String sh = matcher.group();
        	System.out.println(sh);
        	String num = (String)sh.subSequence(5, sh.length());
        	mdids.add(Integer.parseInt(num));
        }
		return mdids;		
	}
	
}
 