package global.sesoc.teamProject.util;

import java.util.ArrayList;
import java.util.Random;

import global.sesoc.teamProject.vo.MemberVO;

public class Key {
	ArrayList<String> list = new ArrayList<>();

	public String makeKey() {
		Random ran = new Random();
		int num = ran.nextInt(3809) + 1000 + ran.nextInt(231);
		String key = Integer.toString(num);
		list.add(key);
		return key;
	}

	public String getKey() {
		return list.get(0);
	}

	public void removeKey() {
		if (list.size() != 0) {
			list.remove(0);
		}
	}
}