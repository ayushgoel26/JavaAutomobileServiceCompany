package com.automobile.beans;

import java.util.*;



public class Record {
	private HashMap< Car, HashMap<Date, List<Service>>> recordMap;

	public Record() {
		super();
		this.recordMap = new HashMap<>(); 
	}

//	
//	public void addRecord(List<Service> servicesTaken, Date date, long regNumber){
//
//		if(this.recordMap.containsKey(regNumber)){
//			HashMap<Date, List<Service>> serviceMap = this.recordMap.get(regNumber);
//			serviceMap.put(date, servicesTaken);
//			this.recordMap.put(regNumber, serviceMap);
//		}
//		else{
//			HashMap<Date, List<Service>> serviceMap = new HashMap<>();
//			serviceMap.put(date, servicesTaken);
//			this.recordMap.put(regNumber, serviceMap);
//		}
//		
//	}


	public HashMap<Car, HashMap<Date, List<Service>>> getRecordMap() {
		return recordMap;
	}


	public void setRecordMap(HashMap<Car, HashMap<Date, List<Service>>> recordMap) {
		this.recordMap = recordMap;
	}


	@Override
	public String toString() {
		return "Record [recordMap=" + recordMap + "]";
	}

	
}

