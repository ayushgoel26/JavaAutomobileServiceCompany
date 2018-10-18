package com.automobile.resources;



import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.automobile.beans.Service;
import com.automobile.daoImpl.ServiceDAOImpl;


@Path("/service")
public class ServiceResource {
	private ServiceDAOImpl serviceDao;

	public ServiceResource() {
		super();
		this.serviceDao = new ServiceDAOImpl();
	}
	
	@POST
	@Path("add")
	public String addEmployee(@Context HttpServletResponse response, @Context HttpServletRequest request, @FormParam("serviceId") String serviceId,@FormParam("serviceName") String serviceName, @FormParam("serviceCost") String serviceCost) {

		String status = "Not Added";
		int result = 0;
		try {
			result = serviceDao.add(new Service(Long.parseLong(serviceId), serviceName, Long.parseLong(serviceCost)));
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
				response.sendRedirect("/AutomobileServiceCompany/service.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return status;
	}
	
	@PUT
	@Path("updateService")
	public Response updateDetails(@QueryParam("serviceId") long serviceId, @QueryParam("property") String property, @QueryParam("newValue") String newValue){
		Response result = null;
		try {
			result = Response.status(200).entity(serviceDao.update(serviceId, property, newValue)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@DELETE
	@Path("remove")
	public Response deleteEmp(@QueryParam("serviceId") long serviceId){
		Response result = null;
		try {
			result = Response.status(200).entity(serviceDao.remove(serviceId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GET
	@Path("getService")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getEmp(@QueryParam("serviceId") long serviceId){
		Response result = null;
		try {
			result = Response.status(200).entity(serviceDao.get(serviceId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GET
	@Path("getAllServices")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllEmps(){
		Response result = null;
		try {
			result = Response.status(200).entity(serviceDao.getAll()).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
