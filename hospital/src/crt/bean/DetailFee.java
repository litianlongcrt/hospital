package crt.bean;

import java.util.List;

public class DetailFee {
	private List<Income> incomes;
	private List<Expense> expenses;	
	public DetailFee() {
		super();
	}
	public DetailFee(List<Income> incomes, List<Expense> expenses) {
		super();
		this.incomes = incomes;
		this.expenses = expenses;
	}
	public List<Income> getIncomes() {
		return incomes;
	}
	public void setIncomes(List<Income> incomes) {
		this.incomes = incomes;
	}
	public List<Expense> getExpenses() {
		return expenses;
	}
	public void setExpenses(List<Expense> expenses) {
		this.expenses = expenses;
	}
	@Override
	public String toString() {
		return "DetailFee [incomes=" + incomes + ", expenses=" + expenses + "]";
	}
	
	
}
