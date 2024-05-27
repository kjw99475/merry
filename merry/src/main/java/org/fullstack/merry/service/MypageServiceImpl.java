package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.dto.BoardDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.mapper.BoardMapper;
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
