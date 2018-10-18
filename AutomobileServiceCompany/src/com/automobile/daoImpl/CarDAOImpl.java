package com.automobile.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.automobile.beans.Car;
import com.automobile.ifaces.DAO;

public class CarDAOImpl implements DAO<Car> {

	private Connection con;
	
	public CarDAOImpl() {
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
	public int add(Car car) throws SQLException {
		int result = 0; 
		
		String sql = "Insert into car_ag values(?,?,?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setLong(1, car.getCustId());
		pstmt.setLong(2, car.getRegNumber());
		pstmt.setString(3,car.getCarMake());
		pstmt.setString(4,car.getCarModel());
		pstmt.setLong(5,car.getPolicyId());
		
		
		result=pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}

	@Override
	public int remove(long id) throws SQLException {
		
		String sql = "delete from car_ag where carregnum = ?";
		
		PreparedStatement pstmt = null;
				
		int rowsDeleted = 0;
	
		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, id);

		rowsDeleted = pstmt.executeUpdate();
		
		pstmt.close();
		
		
		return rowsDeleted;
		
	}

	public int removeByCustId(long id) throws SQLException {
		
		String sql = "delete from car_ag where custId = ?";
		
		PreparedStatement pstmt = null;
				
		int rowsDeleted = 0;
	
		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, id);

		rowsDeleted = pstmt.executeUpdate();
		
		pstmt.close();
		
		
		return rowsDeleted;
		
	}
	@Override
	public int update(long id, String property, String newValue) throws SQLException {
		
	//This method is not needed since no updatable fields are available

		return -1;	
		
	}

	@Override
	public List<Car> getAll() throws SQLException {
		
		List<Car> carList =new ArrayList<>();
		
		String sql = "select * from car_ag ";
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()){
				Car car = convertToObject(rs);
				carList.add(car);
			}
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return carList;	
	}

	@Override
	public Car get(long id) throws SQLException {

		Car car= null;
		String sql = "select * from car_ag where carRegnum = ?";
		
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setLong(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				car = convertToObject(rs);
			}
		
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return car;	
	}
	
	public List<Car> getAllByCustId(long custId) throws SQLException {
		
		List<Car> carList =new ArrayList<>();
		
		String sql = "select * from car_ag where custId = ? ";
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setLong(1, custId);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()){
				Car car = convertToObject(rs);
				carList.add(car);
			}
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return carList;	
	}
	
	private Car convertToObject(ResultSet rs) throws SQLException{
		
		Car car = null;
		 
		long custId = rs.getLong("custId");
		long carRegNum = rs.getLong("carRegNum");
		String carMake = rs.getString("carmake");
		String carModel = rs.getString("carmodel");
		long  policyId= rs.getLong("policyId");
		
		
		
		car= new Car(carRegNum, carMake, carModel, policyId, custId);
		return car;
	}
}
