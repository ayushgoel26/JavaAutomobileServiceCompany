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

import com.automobile.beans.Policy;
import com.automobile.daoImpl.PolicyDAOImpl;


@Path("/policy")
public class PolicyResource {
	private PolicyDAOImpl policyDao;

	public PolicyResource() {
		super();
		this.policyDao = new PolicyDAOImpl();
	}
	
	@POST
	@Path("add")
	public String addPolicy(@Context HttpServletResponse response, @Context HttpServletRequest request, @FormParam("policyId") String policyId, @FormParam("policyType") String policyType, @FormParam("policyPremiumAmount") String policyPremiumAmount) {

		String status = "Not Added";
		int result = 0;
		try {
			result = policyDao.add(new Policy(Long.parseLong(policyId), policyType));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result > 0) {
			status = result + " Added";
			System.out.println(status);
			try {
				response.sendRedirect("/AutomobileServiceCompany/home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		else {
			try {
				response.sendRedirect("/AutomobileServiceCompany/policy.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return status;
	}
	
	@PUT
	@Path("update")
	public Response updateDetails(@QueryParam("policyId") long policyId, @QueryParam("property") String property, @QueryParam("newValue") String newValue){
		Response result = null;
		try {
			result = Response.status(200).entity(policyDao.update(policyId, property, newValue)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	@DELETE
	@Path("remove")
	public Response deleteEmp(@QueryParam("policyId") long policyId){
		Response result = null;
		try {
			result = Response.status(200).entity(policyDao.remove(policyId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GET
	@Path("getPolicy")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getPolicy(@QueryParam("policyId") long policyId){
		Response result = null;
		try {
			result = Response.status(200).entity(policyDao.get(policyId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GET
	@Path("getAllPolicy")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllPolicies(){
		Response result = null;
		try {
			result = Response.status(200).entity(policyDao.getAll()).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
