package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.DataVO;
import org.fullstack.merry.dto.DataDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.mapper.DataMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class DataServiceImpl implements DataServiceIf{
    private final DataMapper dataMapper;
    private final ModelMapper modelMapper;

    @Override
    public PageResponseDTO<DataDTO> ListByPage(PageRequestDTO requestDTO) {
        List<DataVO> voList = dataMapper.ListByPage(requestDTO);
        List<DataDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,DataDTO.class))
                .collect(Collectors.toList());
        int total_count = dataMapper.TotalCount(requestDTO);

        PageResponseDTO<DataDTO> responseDTO = PageResponseDTO.<DataDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int TotalCount(PageRequestDTO requestDTO) {
        int total_count = dataMapper.TotalCount(requestDTO);
        return total_count;
    }

    @Override
    public DataDTO view(int data_idx) {
        DataVO dataVO = dataMapper.view(data_idx);
        DataDTO dataDTO = modelMapper.map(dataVO, DataDTO.class);
        return dataDTO;
    }

    @Override
    public int regist(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);
        log.info("=============================");
        log.info("bbsVO >>" + dataVO.toString());
        int result = dataMapper.regist(dataVO);
        log.info("result >>" + result);
        log.info("=============================");
        return dataVO.getData_idx();
    }

    @Override
    public int modify(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);
        int result = dataMapper.modify(dataVO);
        return result;
    }

    @Override
    public int delete(int data_idx) {
        int result = dataMapper.delete(data_idx);
        return result;
    }
}
