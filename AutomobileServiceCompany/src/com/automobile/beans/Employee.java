package com.automobile.beans;

public class Employee {

	private String empName;
	private long empId;
	private String empPassword;
	
	public Employee() {
		super();
		
	}
	
	public Employee(String empName, long empId, String empPassword) {
		super();
		this.empName = empName;
		this.empId = empId;
		this.empPassword = empPassword;
	}
	
	public String getEmpName() {
		return empName;
	}
	
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	public long getEmpId() {
		return empId;
	}
	
	public void setEmpId(long empId) {
		this.empId = empId;
	}
	
	public String getEmpPassword() {
		return empPassword;
	}
	
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	
	@Override
	public String toString() {
		return "Employee [empName=" + empName + ", empId=" + empId + ", empPassword=" + empPassword + "]";
	}
	
	
}

