package com.automobile.beans;

public class Car {
	
	private long regNumber;
	private String carMake;
	private String carModel;
	private long policyId;
	private long custId;
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Car(long regNumber, String carMake, String carModel, long policyId, long custId) {
		super();
		this.regNumber = regNumber;
		this.carMake = carMake;
		this.carModel = carModel;
		this.policyId = policyId;
		this.custId = custId;
	}
	public long getRegNumber() {
		return regNumber;
	}
	public void setRegNumber(long regNumber) {
		this.regNumber = regNumber;
	}
	public String getCarMake() {
		return carMake;
	}
	public void setCarMake(String carMake) {
		this.carMake = carMake;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public long getPolicyId() {
		return policyId;
	}
	public void setPolicyId(long policyId) {
		this.policyId = policyId;
	}
	public long getCustId() {
		return custId;
	}
	public void setCustId(long custId) {
		this.custId = custId;
	}
	@Override
	public String toString() {
		return "Car Registration Number: " + regNumber + ", Make=" + carMake + ", Model=" + carModel + ", Car Policy ID="
				+ policyId ;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((carMake == null) ? 0 : carMake.hashCode());
		result = prime * result + ((carModel == null) ? 0 : carModel.hashCode());
		result = prime * result + (int) (custId ^ (custId >>> 32));
		result = prime * result + (int) (policyId ^ (policyId >>> 32));
		result = prime * result + (int) (regNumber ^ (regNumber >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Car other = (Car) obj;
		if (carMake == null) {
			if (other.carMake != null)
				return false;
		} else if (!carMake.equals(other.carMake))
			return false;
		if (carModel == null) {
			if (other.carModel != null)
				return false;
		} else if (!carModel.equals(other.carModel))
			return false;
		if (custId != other.custId)
			return false;
		if (policyId != other.policyId)
			return false;
		if (regNumber != other.regNumber)
			return false;
		return true;
	}
	

}
