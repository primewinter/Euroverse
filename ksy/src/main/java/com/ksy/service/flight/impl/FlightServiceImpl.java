package com.ksy.service.flight.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.service.domain.Flight;
import com.ksy.service.flight.FlightDao;
import com.ksy.service.flight.FlightService;

@Service("flightServiceImpl")
public class FlightServiceImpl implements FlightService{
	
	@Autowired
	@Qualifier("flightDaoImpl")
	private FlightDao flightDao;
	
	public void setFlightDao(FlightDao flightDao) {
		this.flightDao = flightDao;
	}
	public FlightServiceImpl() {
		System.out.println(this.getClass());
	}
	public void addFlight(Flight flight) throws Exception{
		flightDao.addFlight(flight);
	}
	
	public Flight getFlight (String flightId) throws Exception {
		return flightDao.getFlight(flightId);
	}

}