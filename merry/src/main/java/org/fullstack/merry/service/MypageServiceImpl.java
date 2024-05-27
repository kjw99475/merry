package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.BoardReplyVO;
import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.mapper.BoardMapper;
import org.fullstack.merry.mapper.BoardReplyMapper;
import org.fullstack.merry.mapper.MypageMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageServiceIf{
    private final BoardMapper boardMapper;
    private final BoardReplyMapper boardReplyMapper;
    private final MypageMapper mypageMapper;
    private final ModelMapper modelMapper;

    @Override
    public void addcart(String member_id, int lecIdx) {
        mypageMapper.addcart(member_id, lecIdx);
    }

    @Override
    public void addzzim(String member_id, int lecIdx) {
        mypageMapper.addzzim(member_id, lecIdx);
    }

    @Override
    public void deleteCart(String member_id, int LecIdx) {
        mypageMapper.deleteCart(member_id, LecIdx);
    }

    @Override
    public void deletezzim(String member_id, int LecIdx) {
        mypageMapper.deletezzim(member_id, LecIdx);
    }

    // 작성게시글
    @Override
    public int writeTotalCount(PageRequestDTO pageRequestDTO) {
        int total_count = boardMapper.TotalCount2(pageRequestDTO);
        return total_count;
    }

    @Override
    public PageResponseDTO<BoardDTO> writeListByPage(PageRequestDTO pageRequestDTO) {
        List<BoardVO> voList = boardMapper.ListByPage2(pageRequestDTO);
        List<BoardDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BoardDTO.class))
                .collect(Collectors.toList());
        int total_count = boardMapper.TotalCount2(pageRequestDTO);

        PageResponseDTO<BoardDTO> responseDTO = PageResponseDTO.<BoardDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int writeReplyTotalCount(PageRequestDTO pageRequestDTO) {
        int total_count = boardReplyMapper.TotalCount(pageRequestDTO);
        return total_count;
    }

    @Override
    public PageResponseDTO<BoardReplyDTO> writeReplyListByPage(PageRequestDTO pageRequestDTO) {
        List<BoardReplyVO> voList = boardReplyMapper.ListByPage2(pageRequestDTO);
        List<BoardReplyDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BoardReplyDTO.class))
                .collect(Collectors.toList());
        int total_count = boardReplyMapper.TotalCount(pageRequestDTO);

        PageResponseDTO<BoardReplyDTO> responseDTO = PageResponseDTO.<BoardReplyDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int qnaTotalCount(int member_idx) {
        int total_count = mypageMapper.qnaTotalCount(member_idx);
        return total_count;
    }

    @Override
    public List<QnaDTO> qnaList(int member_idx) {
        List<QnaDTO> qnaDTOList = mypageMapper.qnaList(member_idx).stream()
                .map(vo->modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());
        return qnaDTOList;
    }

    @Override
    public QnaDTO viewQna(int qna_idx) {
        QnaVO qnaVO = mypageMapper.viewQna(qna_idx);
        QnaDTO qnaDTO = modelMapper.map(qnaVO, QnaDTO.class);
        return qnaDTO;
    }

    @Override
    public int registQna(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = mypageMapper.registQna(qnaVO);
        return result;
    }


//    @Override
//    public int memberTotalCount(PageRequestDTO pageRequestDTO) { return adminMapper.memberTotalCount(pageRequestDTO); }
//
//    @Override
//    public PageResponseDTO<NoticeDTO> noticeListByPage(PageRequestDTO pageRequestDTO) {
//        List<NoticeVO> voList = adminMapper.noticeListByPage(pageRequestDTO);
//        List<NoticeDTO> dtoList = voList.stream()
//                .map(vo -> modelMapper.map(vo, NoticeDTO.class))
//                .collect(Collectors.toList());
//
//        int total_count = adminMapper.noticeTotalCount(pageRequestDTO);
//
//        PageResponseDTO<NoticeDTO> pageResponseDTO = PageResponseDTO.<NoticeDTO>withAll()
//                .requestDTO(pageRequestDTO)
//                .dtoList(dtoList)
//                .total_count(total_count)
//                .build();
//
//        return pageResponseDTO;
//    }
}
