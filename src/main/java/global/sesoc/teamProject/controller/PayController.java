package global.sesoc.teamProject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.teamProject.dao.ReservationDAO;
import global.sesoc.teamProject.vo.PayVO;
import global.sesoc.teamProject.vo.ReservationVO;

@Controller
@RequestMapping("pay")
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	@Autowired
	private ReservationDAO dao;

	
	@RequestMapping(value = "/cfpay", method = RequestMethod.GET)
	public String gocfpay(Model model,String locker_name, int locker_n) {
		ReservationVO vo = new ReservationVO();
		vo.setLocker_name(locker_name);
		vo.setLocker_n(locker_n);
		ReservationVO vo2 = dao.lockerList2(vo);
		model.addAttribute("locker_name", locker_name);
		model.addAttribute("locker_n", locker_n);
		model.addAttribute("locker_price", vo2.getLocker_price());
		model.addAttribute("locker_size", vo2.getLocker_size());
		return "pay/cfpay";
	}
	//결제 완료되면 컬럼 yes로 수정
	@RequestMapping(value = "/paid", method = RequestMethod.GET)
	public String paid (int locker_n, String locker_name) {
		ReservationVO vo = new ReservationVO();
		vo.setLocker_n(locker_n);
		vo.setLocker_name(locker_name);
		dao.paid(vo);
		return "redirect:/";
	}
	
	
}
