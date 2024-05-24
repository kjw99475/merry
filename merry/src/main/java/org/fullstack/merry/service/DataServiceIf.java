package org.fullstack.merry.service;

import org.fullstack.merry.dto.DataDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;

public interface DataServiceIf {
    PageResponseDTO<DataDTO> ListByPage(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
    DataDTO view(int data_idx);
    int regist(DataDTO data);
    int modify(DataDTO data);
    int delete(int data_idx);
}
