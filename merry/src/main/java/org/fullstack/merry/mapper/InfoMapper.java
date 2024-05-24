package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack.merry.domain.InfoVO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface InfoMapper {
    List<InfoVO> ListByPage(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
    InfoVO view(int info_idx);
    int regist(InfoVO info);
    int modify(InfoVO info);
    int delete(int info_idx);
}
