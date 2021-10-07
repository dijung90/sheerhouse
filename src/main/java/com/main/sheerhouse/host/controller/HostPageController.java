package com.main.sheerhouse.host.controller;

import java.io.InputStream;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.main.sheerhouse.commons.AwsS3;
import com.main.sheerhouse.commons.CoolSmsAPI;
import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostReservationInfoVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.service.HostPageService;
import com.main.sheerhouse.host.service.HostRegistService;
import com.main.sheerhouse.user.domain.UserVO;

@Controller
public class HostPageController {

	@Autowired
	private HostPageService service;

	@Autowired
	private HostRegistService regService;

	//임시 smsAPI 컨트롤러 추가
	@Autowired
	private CoolSmsAPI api;


	@GetMapping("/hostSms.host")
	public void test() {}

	@PostMapping("/hostSms.host")
	public @ResponseBody String testPost(String tel, Model model){

		String result = "";
		String confirmNumber = "";
		Random rand = new Random();
		for(int i=0; i<6; i++) {
			String random = Integer.toString(rand.nextInt(10));
			confirmNumber+=random;
		}

		api.certifiedSMS(tel, confirmNumber);

		result = confirmNumber;

		return result;
	}





	@GetMapping("/hostPage.host")
	public String hostPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		HostVO host = regService.hostSelect(user.getEmail());
		List<HomeVO> homeList = service.selectHome(host);
		List<HostReservationInfoVO> resInfo = service.selectResInfo(host.getHost_seq());
		List<HostReservationInfoVO> hisInfo = service.selectHisInfo(host.getHost_seq());
		session.setAttribute("host", host);
		model.addAttribute("homeList", homeList);
		model.addAttribute("resInfo", resInfo);
		model.addAttribute("hisInfo", hisInfo);

		return "host/hostPage";
	}

	@PostMapping("/hostUpdate.host")
	public String hostUpdate(HostVO host, HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();

		service.hostUpdate(host);
		List<HomeVO> homeList = service.selectHome(host);
		session.setAttribute("host", host);
		model.addAttribute("homeList", homeList);
		return "redirect:/hostPage.host";
	}

	@GetMapping("/hostSettingPage.host")
	public String hostSettingPage() {
		return "host/hostSettingPage";
	}

	@PostMapping("/uploadHostAccount.host")
	@ResponseBody
	public void uploadHostAccount(MultipartHttpServletRequest filedata, HttpServletRequest request) {
		System.out.println("진입");
		HttpSession session = request.getSession();
		HostVO host = (HostVO)session.getAttribute("host");

		MultipartFile img = filedata.getFile("img");

		System.out.println(img);
		System.out.println(img.toString());
		System.out.println(host.getEmail());

		AwsS3 awsS3 = AwsS3.getInstance();
		String contentType ="";
		long contentLength = 0L;
		String path ="";
		String urlPath = "";
		String account= "";
		try {
			String getKey = "account/" + host.getEmail();
			if(!host.getAccount_url().equals("")) {
				String[] url = host.getAccount_url().split("/");
				String imgName = url[url.length-1];
				String deleteKey = "account/" + host.getEmail() +"/"+ imgName;
				awsS3.delete(deleteKey);
			}

			InputStream is = img.getInputStream();
			String fileName = img.getOriginalFilename();
			path ="account/" + host.getEmail() + "/" + fileName;
			contentType = img.getContentType();
			contentLength = img.getSize();
			awsS3.upload(is, path, contentType, contentLength);

			urlPath = awsS3.getUrl(getKey, account);

		} catch (Exception e) {
			e.printStackTrace();
		}
		service.updateHostAccountUrl(urlPath, host.getHost_seq());
		host.setAccount_url(urlPath);
		session.setAttribute("host", host);
	}

}
