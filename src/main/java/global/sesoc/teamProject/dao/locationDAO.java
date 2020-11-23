package global.sesoc.teamProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamProject.vo.locker_info;
import global.sesoc.teamProject.vo.locker_location;

@Repository
public class locationDAO {
	
	@Autowired
	private SqlSession session;

	public ArrayList<locker_location> listLocation() {
		locationMapper mapper = session.getMapper(locationMapper.class);
		ArrayList<locker_location>list = null;
		try {
			list = mapper.listLocation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public locker_info infolocker(String locker_name) {
		locationMapper mapper = session.getMapper(locationMapper.class);
		locker_info info = null;
		try {
			info = mapper.infolocker(locker_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	
}
