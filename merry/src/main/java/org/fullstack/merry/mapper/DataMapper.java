package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack.merry.domain.DataVO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface DataMapper {
    List<DataVO> ListByPage(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
    DataVO view(int data_idx);
    int regist(DataVO data);
    int modify(DataVO data);
    int delete(int data_idx);
}
