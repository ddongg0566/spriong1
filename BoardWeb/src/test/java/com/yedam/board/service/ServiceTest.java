package com.yedam.board.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.board.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ServiceTest {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Test
	public void registerTest() {
		BoardVO board = new BoardVO();
		board.setTitle("새글등록");
		board.setContent("글본문입니다");
		board.setWriter("user04");
		log.info("등록전: " +board);
		service.register(board);
		log.info("등록후: " +board);
	}
	@Test
	public void testGetList() {
		service.getList().forEach(board ->log.info(board) );
		
	}
	@Test
	public void modifyTest() {
		BoardVO board = new BoardVO();
		board.setTitle("수정1등록");
		board.setContent("수정1글입니다");
		board.setBno(2L);
		service.modify(board);
		log.info(board);
	}
	
	@Test
	public void removeTest() {
		service.remove(9L);
	}
	
	@Test
	public void getTest() {
		BoardVO board = service.get(3L);
		log.info(board);
	}
	
	
}
