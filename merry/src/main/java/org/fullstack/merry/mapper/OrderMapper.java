package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack.merry.domain.lecture.LectureVO;

import java.util.List;

public interface OrderMapper {
    void order(@Param("member_id") String member_id, @Param("order_total") int order_total);
    int order_total(String lec_idx);
    int getorderidx(String member_id);
    void order_detail(@Param("order_idx") int order_idx, @Param("lec_idx") String lec_idx);
    List<LectureVO> orderlist(String lec_idx);
    void cartout(@Param("member_id") String member_id, @Param("lec_idx") String lec_idx);
}
