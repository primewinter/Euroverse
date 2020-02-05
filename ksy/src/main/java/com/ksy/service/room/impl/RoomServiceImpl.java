package com.ksy.service.room.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ksy.service.domain.Room;
import com.ksy.service.room.RoomDao;
import com.ksy.service.room.RoomService;

@Service("roomServiceImpl")
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	@Qualifier("roomDaoImpl")
	private RoomDao roomDao;
	
	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}
	public RoomServiceImpl() {
		System.out.println(this.getClass());
	}
	public void addRoom(Room room) throws Exception{
		roomDao.addRoom(room);
	}
	
	public Room getRoom (String roomId) throws Exception {
		return roomDao.getRoom(roomId);
	}

}