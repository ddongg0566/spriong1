package com.yedam.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.board.domain.Criteria;
import com.yedam.board.domain.ReplyPageDTO;
import com.yedam.board.domain.ReplyVO;
import com.yedam.board.persistence.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;

	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		return replyMapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		return replyMapper.delete(rno);
	}

	
	@Override
	public List<ReplyVO> getList(Long bno, Criteria cri) {
		// TODO Auto-generated method stub
		return replyMapper.getListWithPaging(bno, cri );
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(replyMapper.getCountByBno(bno), replyMapper.getListWithPaging(bno, cri));
	}
}
