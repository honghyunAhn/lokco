package global.sesoc.teamProject.controller;

import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import global.sesoc.teamProject.dao.MemberDAO;
import global.sesoc.teamProject.util.Key;
import global.sesoc.teamProject.vo.MemberVO;

@Controller
@RequestMapping("member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	// DAO 객체
	@Autowired
	private MemberDAO dao;
	// 메일 보내기 위한 객체
	@Autowired
	private JavaMailSender mailSender;
	
	private Key key = new Key();

	// 회원가입 화면으로 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberVO vo, RedirectAttributes rttr) {
		int flag = dao.insertMember(vo);
		if (flag == 1) {
			rttr.addFlashAttribute("result", true);
		}
		return "redirect:/";
	}

	// 이메일 중복확인
	@ResponseBody
	@RequestMapping(value = "/doubleCheck", method = RequestMethod.GET)
	public int doubleCheck(String email, HttpSession session) {
		int count = dao.doubleCheck(email);
		return count;
	}

	// 메일인증 화면으로 이동
	@RequestMapping(value = "/mail")
	public String mailForm() {
		key.removeKey();
		return "member/mailCertification";
	}

	// 메일을 보내기 함수
	@RequestMapping(value = "/mailSending")
	public String mailSending(HttpServletRequest request, HttpSession session) {
		String setfrom = "gimseonho4@gamil.com";
		String tomail = request.getParameter("tomail");
		String title = "코인 락커 로그인 이메일 인증";
		StringBuffer sb = new StringBuffer();
		session.setAttribute("email", tomail);
		sb.append("회원가입 인증번호는");
		sb.append(" ");
		sb.append(key.makeKey() + "입니다.");
		String content = sb.toString();

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/keyCheck";
	}

	// 인증값 확인
	@ResponseBody
	@RequestMapping(value = "/keyCheck")
	public int keyCheck(String checkKey, HttpSession session) {
		String sendedKey = key.getKey(); // 이메일로 보내진 인증번호
		String sendKey = checkKey;
		System.out.println(sendedKey);
		System.out.println(sendKey);
		if (sendedKey.equals(sendKey)) {
			key.removeKey();
			return 0;
		} else {
			return 1;
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String email, String password, HttpSession session, RedirectAttributes rttr) {
		MemberVO vo = dao.getMember(email);
		if (vo != null && password.equals(vo.getPassword())) {
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			
			//혹시 비회원으로 인증받은 적 있으면 없애준단
			session.removeAttribute("email2");
			rttr.addFlashAttribute("flag", true);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("flag", false);
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.removeAttribute("email");
		return "redirect:/";
	}
	
	//세션에 이메일 값이 없을 경우 페이지 이동 예약 시 사용
	@RequestMapping(value = "/loginConfirm", method = RequestMethod.GET)
	public String loginConfirm(String locker_name,HttpSession session) {
		session.setAttribute("locker_name", locker_name);
		return "member/loginConfirm";
	}
	//세션에 이메일 값이 없을 경우 페이지 이동 예약 조회 시 사용
	@RequestMapping(value = "/loginConfirm2", method = RequestMethod.GET)
	public String loginConfirm2() {
		return "member/loginConfirm2";
	}
	
	//예약 할 때 로그인 확인 페이지에서 로그인 할 시 예약 페이지로 넘어가는 메서드
	@ResponseBody
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public int login2(String email, String password, HttpSession session, RedirectAttributes rttr) {
		logger.debug(email);
		logger.debug(password);
		MemberVO vo = dao.getMember(email);
		
		if (vo != null && password.equals(vo.getPassword())) {
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			rttr.addFlashAttribute("flag", true);
			return 0;
		} else {
			rttr.addFlashAttribute("flag", false);
			return 1;
		}
	}	
	
	// 비회원 메일 인증화면 
	@RequestMapping(value = "/non_memberMail")
	public String non_memberMail() {
		key.removeKey();
		return "member/non_memberMail";
	}
	
	// 비회원 인증 메일을 보내기 함수
		@RequestMapping(value = "/mailSending2")
		public String mailSending2(HttpServletRequest request,HttpSession session) {
			String setfrom = "gimseonho4@gamil.com";
			
			String tomail = request.getParameter("tomail");
			
			//비회원 이메일 등록
			session.setAttribute("email2", tomail);
			
			String title = "코인 락커 로그인 이메일 인증";
			StringBuffer sb = new StringBuffer();
			sb.append("회원가입 인증번호는");
			sb.append(" ");
			sb.append(key.makeKey() + "입니다.");
			String content = sb.toString();

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "member/non_keyCheck";
		}
	
		// 비회원 인증값 확인
		@ResponseBody
		@RequestMapping(value = "/keyCheck2")
		public int keyCheck2(HttpSession session, String checkKey) {
			String sendedKey = key.getKey(); // 이메일로 보내진 인증번호
			String sendKey = checkKey;
			System.out.println(sendedKey);
			System.out.println(sendKey);
			String email = (String) session.getAttribute("email2");
			if (sendedKey.equals(sendKey)) {
				key.removeKey();
				dao.non_memberInsert(email);
				return 0;
			} else {
				return 1;
			}
		}
	
	//비회원 조회에 사용
	@ResponseBody
	@RequestMapping(value = "/non_login",method = RequestMethod.GET)
	public int non_login(String email2) {
		int num = dao.non_login(email2);
		if(num==0) {
			return 0;
		}else {
			return 1;
		}
	}
		
		
	
}
