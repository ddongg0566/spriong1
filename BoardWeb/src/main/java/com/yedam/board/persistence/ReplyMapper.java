package com.yedam.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.board.domain.Criteria;
import com.yedam.board.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	public ReplyVO read(Long rno);//댓글번호 조회
	public int delete(Long rno); //댓글삭제
	public int update(ReplyVO vo); // 수정
	public List<ReplyVO> getListWithPaging(@Param("bno") Long bno,@Param("cri") Criteria cri); // 글번호
	public int getCountByBno(Long bno); //전체건수

}


