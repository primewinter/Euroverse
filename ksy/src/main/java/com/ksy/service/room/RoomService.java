package com.ksy.service.room;

import com.ksy.service.domain.Room;


public interface RoomService {
	
	public void addRoom(Room room) throws Exception;
	
	public Room getRoom(String roomId) throws Exception;
	
}