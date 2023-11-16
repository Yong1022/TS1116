package kr.co.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.entity.Find;
import kr.co.ezen.entity.Info;
import kr.co.ezen.entity.Student;
import kr.co.ezen.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<Student> getList(Find find) {
		List<Student> li = boardMapper.getList(find);
		return li;
	}

	@Override
	public void insert(Info info) {
		boardMapper.insert(info);
		
	}

	@Override
	public void insert_St(Student student) {
		boardMapper.insert_St(student);
		
	}

	@Override
	public List<Info> getListInfo(Student student) {
		List<Info> li = boardMapper.getListInfo(student);
		return li;
	}

	

	@Override
	public void deleteInfo(Student student) {
		boardMapper.deleteInfo(student);
		
	}

	@Override
	public void delete(Student student) {
		boardMapper.delete(student);
		
	}

	@Override
	public void update(Info info) {
		boardMapper.update(info);
		
	}



	

}
