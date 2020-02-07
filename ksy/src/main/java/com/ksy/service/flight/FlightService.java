package com.ksy.service.flight;

import com.ksy.service.domain.Flight;


public interface FlightService {
	
	public Flight addFlight(Flight flight) throws Exception;
	
	public Flight getFlight(String flightId) throws Exception;
	
}