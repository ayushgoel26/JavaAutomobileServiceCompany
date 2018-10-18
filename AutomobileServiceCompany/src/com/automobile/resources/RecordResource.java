package com.automobile.resources;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import org.apache.log4j.Logger;

import com.automobile.beans.Car;
import com.automobile.beans.Service;
import com.automobile.daoImpl.CarDAOImpl;
import com.automobile.daoImpl.RecordDAOImpl;
import com.automobile.daoImpl.ServiceDAOImpl;

@Path("/record")
public class RecordResource {
	private RecordDAOImpl recordDao;
	private ServiceDAOImpl serviceDao;
	private CarDAOImpl carDao;
	
	Logger recordLogger = Logger.getLogger("fileRecord");
	public RecordResource() {
		super();
		this.recordDao = new RecordDAOImpl();
		this.serviceDao = new ServiceDAOImpl();
		this.carDao = new CarDAOImpl();

	}

	@POST
	@Path("add")
	public String addRecord(@Context HttpServletResponse response, @Context HttpServletRequest request,
			@FormParam("carRegNum") long carRegNum, @FormParam("serviceId") List<String> services) {

		String status = "Record Not Added";
		int result = 0;
		double total = 0.0;
		try {
			for (String serviceId : services) {
				result = recordDao.add(carRegNum, Long.parseLong(serviceId));
				String a = (calcFinalEstimate(response, request, carRegNum, serviceId));
				total = total + Double.parseDouble(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result > 0) {
			status = result + " Service Request Added";
			try {
				request.getSession().setAttribute("status", status);
				System.out.println(status);
				recordLogger.info(status + " for car:" + carRegNum + ". Billed Amount : " + total + "Estimated Delivery Time: 3 Days ");
				response.sendRedirect("/AutomobileServiceCompany/home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("status", status);
			System.out.println(status);
			recordLogger.info(status);

			try {
				response.sendRedirect("/AutomobileServiceCompany/record.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return status;
	}

	@GET
	@Path("calcEstimate")
	public String calcFinalEstimate(@Context HttpServletResponse response, @Context HttpServletRequest request,
			@QueryParam("carRegNum") long carRegNum, @QueryParam("serviceId") String services) {

		List<String> serviceList = Arrays.asList(services.split(","));
		double costWithoutPolicy = 0.0;
		double claimRatio = 0.0;
		double costWithPolicy = 0.0;
		try {
			for (String serviceId : serviceList) {
				costWithoutPolicy = calcEstimate(Long.parseLong(serviceId));
				Car car = carDao.get(carRegNum);
				claimRatio = calcPolicyClaim(Long.toString(car.getPolicyId()));
				costWithPolicy = costWithoutPolicy - claimRatio * costWithoutPolicy;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String amount = Double.toString(costWithPolicy);
		System.out.println(amount);
		
		return amount;
	}

	private double calcEstimate(long serviceId) {

		double estimate = 0.0;

		Service service = null;

		try {
			service = serviceDao.get(serviceId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (service != null) {
			estimate = service.getCost();
		}

		return estimate;
	}

	private double calcPolicyClaim(String policyId) {

		double claim = 0.0;

		switch (policyId) {
		case "201":
			claim = 0.20;
			break;
		case "202":
			claim = 0.30;
			break;
		case "203":
			claim = 0.50;
			break;
		}

		return claim;
	}

	@POST
	@Path("remove")
	public Response deleteRecord(@FormParam("carRegNum") long carRegNum) {
		Response result = null;
		try {
			result = Response.status(200).entity(recordDao.remove(carRegNum)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@GET
	@Path("getRecordByCustomerId")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getRecordByCustomerId(@QueryParam("custId") long custId) {
		Response result = null;
		try {
			result = Response.status(200).entity(recordDao.getByCustId(custId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@GET
	@Path("getRecordByRegNum")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getRecordByCarRegNum(@QueryParam("regNumber") long regNumber) {
		Response result = null;
		try {
			result = Response.status(200).entity(recordDao.getByRegNum(regNumber)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@GET
	@Path("getAllRecords")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllRecords() {
		Response result = null;
		try {
			result = Response.status(200).entity(recordDao.getAll()).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
