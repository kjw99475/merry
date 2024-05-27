package org.fullstack.merry.service;

import org.fullstack.merry.dto.lecture.LectureDTO;

import java.util.List;

public interface OrderServiceIf {
    void order(String member_id, int order_total, String lec_idx);
    int order_total(String lec_idx);
    List<LectureDTO> orderlist(String lec_idx);
}
