package global.sesoc.teamProject.controller;

import java.io.Reader;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.teamProject.dao.ReservationDAO;
import global.sesoc.teamProject.vo.MemberVO;
import global.sesoc.teamProject.vo.ReservationVO;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	@Autowired
	private ReservationDAO dao;
	//예약창으로 넘어가기
	@RequestMapping(value = "/reservationPage",method = RequestMethod.GET)
	public String reservationPage(Model model, HttpSession session,RedirectAttributes rttr, String locker_name) {
		
		//중복 예약 방지
		String email = (String) session.getAttribute("email");
		String email2 = (String) session.getAttribute("email2");
		int count=0;
		ArrayList<ReservationVO> list = null;
		if(email==null) {
			count = dao.doubleCheck(email2);
		}else {
			count = dao.doubleCheck(email);
		}
		
		if(count==3) {
			rttr.addFlashAttribute("check", true);
			return "redirect:/";
		}else {
			int num = dao.nonReserved(locker_name);
			model.addAttribute("number", num);
			model.addAttribute("locker_name", locker_name);
			list = dao.lockerList(locker_name);
			model.addAttribute("lockerList", list);
			session.setAttribute("locker_name", locker_name);
		}
		if(list.size()>20) {
			model.addAttribute("length", "length");
		}else if (list.size()==20) {
			model.addAttribute("length2", "length2");
		}else {
			model.addAttribute("length3", "length3");
		}
		return "reservation/reservation";
	}
	

	
	//로그인 여부 확인
	@ResponseBody
	@RequestMapping(value = "/loginCheck",method = RequestMethod.GET)
	public String loginCheck(HttpSession session) {
		String email2 = (String) session.getAttribute("email2");
		String email = (String) session.getAttribute("email");
		if(email2!=null) {
		return email2;
	} else {
		return email;
	}
}
	
	//예약 버튼
	@ResponseBody
	@RequestMapping(value = "/reservation",method = RequestMethod.GET)
	public void reservation(HttpSession session, int num, String locker_name) {
		String email = (String) session.getAttribute("email");
		String email2 = (String) session.getAttribute("email2");
		ReservationVO vo = new ReservationVO();
			vo.setLocker_name(locker_name);
			vo.setLocker_n(num);
			if(email==null) {
				vo.setEmail(email2);
			}else {
				vo.setEmail(email);
			}
			dao.reservation(vo);
	}
	
	//예약 조회
	@RequestMapping(value = "/reservationList",method = RequestMethod.GET)
	public String reservationList(Model model,HttpSession session) {
		String email = (String) session.getAttribute("email");
		String email2 = (String)session.getAttribute("email2");
		ArrayList<ReservationVO> list = null;
		if(email == null) {
			list = dao.getReservation(email2);
			model.addAttribute("email", email2);
		}else {
			list = dao.getReservation(email);
			model.addAttribute("email", email);
		}
		if(list.isEmpty()) {
			model.addAttribute("check", 1);
		}
		model.addAttribute("list", list);
		return "reservation/reservationList";
	}
	//예약 취소
	@ResponseBody
	@RequestMapping(value = "/cancle", method = RequestMethod.GET)
	public void cancle(String locker_name, int locker_n) {
		ReservationVO vo = new ReservationVO();
		vo.setLocker_name(locker_name);
		vo.setLocker_n(locker_n);
		dao.cancle(vo);
	}

}
