package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack.merry.domain.CartVO;
import org.fullstack.merry.domain.OrderVO;
import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.domain.ZzimVO;
import org.fullstack.merry.domain.lecture.QnaAnswerDTO;
import org.fullstack.merry.dto.OrderDetailDTO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

public interface MypageMapper {
    void addcart(@Param("member_id") String member_id, @Param("lecIdx") int lecIdx);
    void addzzim(@Param("member_id") String member_id, @Param("lecIdx") int lecIdx);
    void deleteCart(@Param("member_id") String member_id, @Param("lecIdx") int lecIdx);
    void deletezzim(@Param("member_id") String member_id, @Param("lecIdx") int lecIdx);

    /* 1:1 문의 */
    List<QnaVO> qnaList(PageRequestDTO requestDTO);
    List<QnaVO> qnaList2(PageRequestDTO requestDTO);
    int qnaTotalCount(PageRequestDTO requestDTO);
    int qnaTotalCount2(PageRequestDTO requestDTO);
    QnaVO viewQna(int qna_idx);
    int registQna(QnaVO qnaVO);
    int registReply(QnaAnswerDTO qnaAnswerDTO);
    int modifyReply(QnaAnswerDTO qnaAnswerDTO);
    int deleteReply(int qna_idx);


    /* 찜 */
    List<ZzimVO> zzimList(PageRequestDTO requestDTO);
    int zzimTotalCount(PageRequestDTO requestDTO);


    /* 장바구니 */
    List<CartVO> cartList(PageRequestDTO requestDTO);
    int cartTotalCount(PageRequestDTO requestDTO);
//    void update_cnt(@Param("cart_idx") String cart_idx, @Param("product_count") int product_count, @Param("or_member_id") String or_member_id);

    /* 결제내역 */
    List<OrderVO> orderList(PageRequestDTO requestDTO);
    int orderTotalCount(PageRequestDTO requestDTO);
    int getLecIdx(PageRequestDTO requestDTO);
    int orderUpdateState(@Param(value = "order_idx") int order_idx);

    List<OrderDetailDTO> order_detail(String order_idx);
    void refund(String detail_idx);

    String find_order_idx(@Param(value = "lec_idx") String lec_idx, @Param(value = "member_id") String member_id);
    void viewCheck(String order_idx);

}
