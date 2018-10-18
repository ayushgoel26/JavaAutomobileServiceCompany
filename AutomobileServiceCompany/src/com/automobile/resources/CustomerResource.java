package com.automobile.resources;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.automobile.beans.Car;
import com.automobile.beans.Customer;
import com.automobile.daoImpl.CarDAOImpl;
import com.automobile.daoImpl.CustomerDAOImpl;

@Path("/cust")
public class CustomerResource {
	private CustomerDAOImpl custDao;
	private CarDAOImpl carDao;

	public CustomerResource() {
		super();
		this.custDao = new CustomerDAOImpl();
		this.carDao = new CarDAOImpl();
	}

	@POST
	@Path("add")
	public String addCustomer(@Context HttpServletResponse response, @FormParam("custId") long custId,@FormParam("custName") String custName,@FormParam("mobile") long mobile,@FormParam("regNumber") long regNumber, @FormParam("carMake") String carMake,
			@FormParam("carModel") String carModel, @FormParam("policyId") long policyId) {

		String status = "Not Added";
		int result = 0;
		try {
			result = custDao.add(new Customer(custId, custName, mobile));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result > 0) {
			status = result + " Added";
			System.out.println(status);
			addCar(response, regNumber, carMake, carModel, policyId, custId);
			try {
				response.sendRedirect("/AutomobileServiceCompany/home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		else {
			try {
				response.sendRedirect("/AutomobileServiceCompany/customer.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return status;
	}

	@POST
	@Path("addCar")
	public String addCar(@Context HttpServletResponse response, @FormParam("regNumber") long regNumber, @FormParam("carMake") String carMake,
			@FormParam("carModel") String carModel, @FormParam("policyId") long policyId,
			@FormParam("custId") long custId) {

		String status = "Not Added";
		int result = 0;
		try {
			result = carDao.add(new Car(regNumber, carMake, carModel, policyId, custId));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result > 0) {
			status = result + " Added";
			try {
				response.sendRedirect("/AutomobileServiceCompany/home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				response.sendRedirect("/AutomobileServiceCompany/customer.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return status;
	}

	@POST
	@Path("update")
	public Response updateDetails(@Context HttpServletResponse response, @FormParam("custId") long custId, @FormParam("property") String property,
			@FormParam("newValue") String newValue) {
		Response result = null;
		try {
			result = Response.status(200).entity(custDao.update(custId, property, newValue)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result !=  null) {
			try {
				response.sendRedirect("/AutomobileServiceCompany/home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				response.sendRedirect("/AutomobileServiceCompany/customer.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public Response removeCarByCust(@FormParam("custId") long custId) {
		Response result = null;
		try {
			result = Response.status(200).entity(carDao.removeByCustId(custId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@POST
	@Path("removeCarByRegNum")
	public Response removeCarByRegNum(@Context HttpServletResponse response, @FormParam("regNum") long regNum) {
		Response result = null;
		try {
			result = Response.status(200).entity(carDao.remove(regNum)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result !=  null) {
			try {
				response.sendRedirect("/AutomobileServiceCompany/home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				response.sendRedirect("/AutomobileServiceCompany/customer.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	

	@POST
	@Path("removeCust")
	public Response deleteCustomer(@Context HttpServletResponse response, @FormParam("custId") long custId) {
		Response result = null;
		try {
			removeCarByCust(custId);

			result = Response.status(200).entity(custDao.remove(custId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result !=  null) {
			try {
				response.sendRedirect("/AutomobileServiceCompany/home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				response.sendRedirect("/AutomobileServiceCompany/customer.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	
	@GET
	@Path("getCustomer")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCustomer(@QueryParam("custId") long custId) {
		Response result = null;
		try {
			result = Response.status(200).entity(custDao.get(custId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	
	@GET
	@Path("getAllCustomer")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllCustomers() {
		Response result = null;
		try {
			result = Response.status(200).entity(custDao.getAll()).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@GET
	@Path("getCarByReg")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCarByReg(@QueryParam("carRegNum") long carRegNum) {
		Response result = null;
		try {
			result = Response.status(200).entity(carDao.get(carRegNum)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	@GET
	@Path("getCarsByCustId")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCarsByCustId(@QueryParam("custId") long custId) {
		Response result = null;
		try {
			result = Response.status(200).entity(carDao.getAllByCustId(custId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
