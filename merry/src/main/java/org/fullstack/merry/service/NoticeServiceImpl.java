package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.NoticeVO;
import org.fullstack.merry.dto.NoticeDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.mapper.NoticeMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeServiceIf{
    private final NoticeMapper noticeMapper;
    private final ModelMapper modelMapper;

    @Override
    public PageResponseDTO<NoticeDTO> ListByPage(PageRequestDTO requestDTO) {
        List<NoticeVO> voList = noticeMapper.ListByPage(requestDTO);
        List<NoticeDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,NoticeDTO.class))
                .collect(Collectors.toList());
        int total_count = noticeMapper.TotalCount(requestDTO);

        PageResponseDTO<NoticeDTO> responseDTO = PageResponseDTO.<NoticeDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int TotalCount(PageRequestDTO requestDTO) {
        int total_count = noticeMapper.TotalCount(requestDTO);
        return total_count;
    }

    @Override
    public NoticeDTO view(int notice_idx) {
        NoticeVO noticeVO = noticeMapper.view(notice_idx);
        NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);
        return noticeDTO;
    }

    @Override
    public int regist(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        log.info("=============================");
        log.info("bbsVO >>" + noticeVO.toString());
        int result = noticeMapper.regist(noticeVO);
        log.info("result >>" + result);
        log.info("=============================");
        return noticeVO.getNotice_idx();
    }

    @Override
    public int modify(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        int result = noticeMapper.modify(noticeVO);
        return result;
    }

    @Override
    public int delete(int notice_idx) {
        int result = noticeMapper.delete(notice_idx);
        return result;
    }
}
