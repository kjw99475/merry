package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack.merry.domain.ZzimVO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

public interface MypageMapper {
    void addcart(@Param("member_id") String member_id, @Param("lecIdx") int lecIdx);
    void addzzim(@Param("member_id") String member_id, @Param("lecIdx") int lecIdx);
    void deleteCart(@Param("member_id") String member_id, @Param("lecIdx") int lecIdx);
    void deletezzim(@Param("member_id") String member_id, @Param("lecIdx") int lecIdx);

    /* 작성게시글 */


    /* 찜 */
    List<ZzimVO> zzimList(String member_id);


    /* 장바구니 */
//    List<CartListVO> cart_list(String member_id);
//    int total_cart (String member_id);
//    void update_cnt(@Param("cart_idx") String cart_idx, @Param("product_count") int product_count, @Param("or_member_id") String or_member_id);
//    int deleteCart (int cart_idx);

}
