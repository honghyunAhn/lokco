package global.sesoc.teamProject.dao;

import java.util.ArrayList;

import global.sesoc.teamProject.vo.locker_info;
import global.sesoc.teamProject.vo.locker_location;

public interface locationMapper {

	public ArrayList<locker_location> listLocation();

	public locker_info infolocker(String locker_name);

}
