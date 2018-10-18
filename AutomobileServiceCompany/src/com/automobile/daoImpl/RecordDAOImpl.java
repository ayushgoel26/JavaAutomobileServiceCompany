package com.automobile.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.automobile.beans.Car;
import com.automobile.beans.Service;
import com.automobile.ifaces.RecordDAO;

public class RecordDAOImpl implements RecordDAO {

	private Connection con;

	public RecordDAOImpl() {
		super();
		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/ds1");
			this.con = dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(this.con);
	}

	@Override
	public int add(long carRegNum, long serviceId) throws SQLException {

		int result = 0;

		String sql = "Insert into records_ag values(?,?,SYSDATE,SYSDATE+3)";

		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setLong(1, carRegNum);
		pstmt.setLong(2, serviceId);

		result = pstmt.executeUpdate();
		pstmt.close();

		return result;
	}

	@Override
	public int remove(long carRegNum) throws SQLException {
		String sql = "delete from records_ag where carRegNum = ?";

		PreparedStatement pstmt = null;

		int rowsDeleted = 0;

		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, carRegNum);

		rowsDeleted = pstmt.executeUpdate();

		pstmt.close();

		return rowsDeleted;
	}

	@Override
	public HashMap<Car, HashMap<Date, List<Service>>> getAll() throws SQLException {
		String sql = "select * from records_ag natural join car_ag natural join customer_servicing_ag natural join services_ag";
		
		PreparedStatement pstmt = null;
		
		HashMap<Car, HashMap<Date, List<Service>>> recordMap = new HashMap<>();

		pstmt = con.prepareStatement(sql);		
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()){
			
			long regNumber = rs.getLong("carRegNum");
			String carMake = rs.getString("carMake");
			String carModel = rs.getString("carModel");
			long policyId = rs.getLong("policyId");
			long custId = rs.getLong("custId");
			long serviceId= rs.getLong("serviceId");
			String serviceName = rs.getString("serviceName");
			double cost = rs.getDouble("serviceCost");
			Date date = rs.getDate("recordDate");
		
			Car car = new Car(regNumber, carMake, carModel, policyId, custId);
			
			if(recordMap.containsKey(car)){System.out.println("Hello");
				HashMap<Date, List<Service>> serviceMap = recordMap.get(car);
				if(serviceMap.containsKey(date)){
					List<Service> services = serviceMap.get(date);
					services.add(new Service(serviceId, serviceName, cost));
					serviceMap.put(date, services);
				}
				else {
					List<Service> serviceList = new ArrayList<>();
					serviceList.add(new Service(serviceId, serviceName, cost));
					serviceMap.put(date, serviceList);
				}
				recordMap.put(car, serviceMap);
			}
			else{
				HashMap<Date, List<Service>> serviceMap = new HashMap<>();
				List<Service> serviceList = new ArrayList<>();
				serviceList.add(new Service(serviceId, serviceName, cost));
				serviceMap.put(date, serviceList);
				recordMap.put(car, serviceMap);
			}
		}

		pstmt.close();
		
		return recordMap;
	}

	@Override
	public HashMap<Car, HashMap<Date, List<Service>>> getByRegNum(long regNumber) throws SQLException {
		String sql = "select * from records_ag natural join car_ag natural join customer_servicing_ag natural join services_ag where carRegNum = ? ";
		
		PreparedStatement pstmt = null;
		
		HashMap<Car, HashMap<Date, List<Service>>> recordMap = new HashMap<>();

		pstmt = con.prepareStatement(sql);		
		pstmt.setLong(1, regNumber);

		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			String carMake = rs.getString("carMake");
			String carModel = rs.getString("carModel");
			long policyId = rs.getLong("policyId");
			long custId = rs.getLong("custId");
			long serviceId= rs.getLong("serviceId");
			String serviceName = rs.getString("serviceName");
			double cost = rs.getDouble("serviceCost");
			Date date = rs.getDate("recordDate");
		
			Car car = new Car(regNumber, carMake, carModel, policyId, custId);
			
			if(recordMap.containsKey(car)){System.out.println("Hello");
				HashMap<Date, List<Service>> serviceMap = recordMap.get(car);
				if(serviceMap.containsKey(date)){
					List<Service> services = serviceMap.get(date);
					services.add(new Service(serviceId, serviceName, cost));
					serviceMap.put(date, services);
				}
				else {
					List<Service> serviceList = new ArrayList<>();
					serviceList.add(new Service(serviceId, serviceName, cost));
					serviceMap.put(date, serviceList);
				}
				recordMap.put(car, serviceMap);
			}
			else{
				HashMap<Date, List<Service>> serviceMap = new HashMap<>();
				List<Service> serviceList = new ArrayList<>();
				serviceList.add(new Service(serviceId, serviceName, cost));
				serviceMap.put(date, serviceList);
				recordMap.put(car, serviceMap);
			}
		}

		pstmt.close();
		
		return recordMap;
	}

	@Override
	public HashMap<Car, HashMap<Date, List<Service>>> getByCustId(long custId) throws SQLException {
		String sql = "select * from records_ag natural join car_ag natural join customer_servicing_ag natural join services_ag where custId = ?";
		
		PreparedStatement pstmt = null;
		
		HashMap<Car, HashMap<Date, List<Service>>> recordMap = new HashMap<>();

		pstmt = con.prepareStatement(sql);		
		pstmt.setLong(1, custId);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()){
			
			long regNumber = rs.getLong("carRegNum");
			String carMake = rs.getString("carMake");
			String carModel = rs.getString("carModel");
			long policyId = rs.getLong("policyId");
			long serviceId= rs.getLong("serviceId");
			String serviceName = rs.getString("serviceName");
			double cost = rs.getDouble("serviceCost");
			Date date = rs.getDate("recordDate");
		
			Car car = new Car(regNumber, carMake, carModel, policyId, custId);
			
			if(recordMap.containsKey(car)){System.out.println("Hello");
				HashMap<Date, List<Service>> serviceMap = recordMap.get(car);
				if(serviceMap.containsKey(date)){
					List<Service> services = serviceMap.get(date);
					services.add(new Service(serviceId, serviceName, cost));
					serviceMap.put(date, services);
				}
				else {
					List<Service> serviceList = new ArrayList<>();
					serviceList.add(new Service(serviceId, serviceName, cost));
					serviceMap.put(date, serviceList);
				}
				recordMap.put(car, serviceMap);
			}
			else{
				HashMap<Date, List<Service>> serviceMap = new HashMap<>();
				List<Service> serviceList = new ArrayList<>();
				serviceList.add(new Service(serviceId, serviceName, cost));
				serviceMap.put(date, serviceList);
				recordMap.put(car, serviceMap);
			}
		}

		pstmt.close();
		
		return recordMap;
	}

}
