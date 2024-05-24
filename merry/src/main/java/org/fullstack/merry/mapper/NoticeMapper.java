package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack.merry.domain.NoticeVO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<NoticeVO> ListByPage(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
    NoticeVO view(int notice_idx);
    int regist(NoticeVO notice);
    int modify(NoticeVO notice);
    int delete(int notice_idx);
}
