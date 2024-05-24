package org.fullstack.merry.service;

import org.fullstack.merry.dto.InfoDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;

public interface InfoServiceIf {
    PageResponseDTO<InfoDTO> ListByPage(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
    InfoDTO view(int info_idx);
    int regist(InfoDTO info);
    int modify(InfoDTO info);
    int delete(int info_idx);
}
