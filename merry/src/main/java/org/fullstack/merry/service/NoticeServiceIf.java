package org.fullstack.merry.service;

import org.fullstack.merry.dto.NoticeDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;

public interface NoticeServiceIf {
    PageResponseDTO<NoticeDTO> ListByPage(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
    NoticeDTO view(int notice_idx);
    int regist(NoticeDTO notice);
    int modify(NoticeDTO notice);
    int delete(int notice_idx);
}
