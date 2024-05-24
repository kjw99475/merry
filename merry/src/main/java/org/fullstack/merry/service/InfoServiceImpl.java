package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.InfoVO;
import org.fullstack.merry.dto.InfoDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.mapper.InfoMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class InfoServiceImpl implements InfoServiceIf{
    private final InfoMapper infoMapper;
    private final ModelMapper modelMapper;

    @Override
    public PageResponseDTO<InfoDTO> ListByPage(PageRequestDTO requestDTO) {
        List<InfoVO> voList = infoMapper.ListByPage(requestDTO);
        List<InfoDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,InfoDTO.class))
                .collect(Collectors.toList());
        int total_count = infoMapper.TotalCount(requestDTO);

        PageResponseDTO<InfoDTO> responseDTO = PageResponseDTO.<InfoDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int TotalCount(PageRequestDTO requestDTO) {
        int total_count = infoMapper.TotalCount(requestDTO);
        return total_count;
    }

    @Override
    public InfoDTO view(int info_idx) {
        InfoVO infoVO = infoMapper.view(info_idx);
        InfoDTO infoDTO = modelMapper.map(infoVO, InfoDTO.class);
        return infoDTO;
    }

    @Override
    public int regist(InfoDTO infoDTO) {
        InfoVO infoVO = modelMapper.map(infoDTO, InfoVO.class);
        log.info("=============================");
        log.info("bbsVO >>" + infoVO.toString());
        int result = infoMapper.regist(infoVO);
        log.info("result >>" + result);
        log.info("=============================");
        return infoVO.getInfo_idx();
    }

    @Override
    public int modify(InfoDTO infoDTO) {
        InfoVO infoVO = modelMapper.map(infoDTO, InfoVO.class);
        int result = infoMapper.modify(infoVO);
        return result;
    }

    @Override
    public int delete(int info_idx) {
        int result = infoMapper.delete(info_idx);
        return result;
    }
}
