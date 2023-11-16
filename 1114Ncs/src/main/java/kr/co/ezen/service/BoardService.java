package kr.co.ezen.service;

import java.util.List;

import kr.co.ezen.entity.Find;
import kr.co.ezen.entity.Info;
import kr.co.ezen.entity.Student;

public interface BoardService {
	
	public List<Student> getList(Find find);
	public List<Info> getListInfo(Student student);
	
	public void insert (Info info);
	public void insert_St (Student student);
	
	public void delete(Student student);
	public void deleteInfo(Student student);

	public void update(Info info);
}
