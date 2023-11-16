package kr.co.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ezen.entity.Find;
import kr.co.ezen.entity.Info;
import kr.co.ezen.entity.Student;
import kr.co.ezen.service.BoardService;


@Controller
public class HomeController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String start() {
		return "home";
	}
	
	@RequestMapping("/home")
	public String home(Model m, Find find, Info info) {
		
		List<Student> li = boardService.getList(find);
		m.addAttribute("li",li);
		return "home";
	}
	
	@RequestMapping("/read")
	public String read(Student student, Info info, Model m) {
		System.out.println(student.getName());
		List<Info> li2 = boardService.getListInfo(student);
		m.addAttribute("li2", li2);
		return "home";
	}
	
	@PostMapping("/insert")
	public String insert(Student student, Info info) {
		boardService.insert(info);
		boardService.insert_St(student);
		return "redirect:/home";
	}
	
	@RequestMapping("/modify")
	public String modify(Info info) {
		System.out.println(info);
		boardService.update(info);
		return"home";
	}
	
	@RequestMapping("/delete")
	public String delete(Student student) {
		boardService.delete(student);
		boardService.deleteInfo(student);
		return"home";
	}
	//히힣
	
	
}
