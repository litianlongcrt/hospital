package crt.bean;

import java.util.List;

import crt.dao.BingAnShiDAO;
import crt.dao.FeeDAO;

public class TestFee {

	/**
	 * @param args
	 */
	public static void main(String[] args){
		//System.out.println(Double.parseDouble("-1,000.05".replaceAll(",", "")));
		/*List<Fee> l = new FeeDAO().selectMoneyMenu();
		for (int i = 0; i < l.size(); i++) {
			System.out.println(l.get(i));
		}*/
		/*FeeDAO fa = new FeeDAO();
		System.out.println(fa.SelectMakeDrugMenu(2));*/
		System.out.println(new BingAnShiDAO().selectFeeAllAndDesc(2));
	}

}
