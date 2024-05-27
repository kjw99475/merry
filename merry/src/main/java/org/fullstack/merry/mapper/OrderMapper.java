package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
    void order(@Param("member_id") String member_id, @Param("order_total") int order_total);
    int order_total(int[] lec_idx);
    void order_datail(@Param("order_idx") String member_id, @Param("order_total") int order_total);
}
