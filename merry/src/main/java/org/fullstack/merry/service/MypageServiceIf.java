package org.fullstack.merry.service;

import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.domain.lecture.QnaAnswerDTO;
import org.fullstack.merry.dto.*;

import java.util.ArrayList;
import java.util.List;

public interface MypageServiceIf {
   void addcart(String member_id, int LecIdx);
   void addzzim(String member_id, int LecIdx);
   void deleteCart(String member_id, int LecIdx);
   void deletezzim(String member_id, int LecIdx);

   int writeTotalCount(PageRequestDTO pageRequestDTO);
   PageResponseDTO<BoardDTO> writeListByPage(PageRequestDTO pageRequestDTO);
   int writeReplyTotalCount(PageRequestDTO pageRequestDTO);
   PageResponseDTO<BoardReplyDTO> writeReplyListByPage(PageRequestDTO pageRequestDTO);

   // 1:1 문의
   int qnaTotalCount(PageRequestDTO pageRequestDTO);
   PageResponseDTO<QnaDTO> qnaList(PageRequestDTO pageRequestDTO);
   int qnaTotalCount2(PageRequestDTO pageRequestDTO);
   PageResponseDTO<QnaDTO> qnaList2(PageRequestDTO pageRequestDTO);
   QnaDTO viewQna(int qna_idx);
   int registQna(QnaDTO qnaDTO);
   int registReply(QnaAnswerDTO qnaAnswerDTO);
   int modifyReply(QnaAnswerDTO qnaAnswerDTO);
   int deleteReply(int qna_idx);


   // 결제내역
   int orderTotalCount(PageRequestDTO pageRequestDTO);
   PageResponseDTO<OrderDTO> orderListByPage(PageRequestDTO pageRequestDTO);
//   int getLecIdx(PageRequestDTO pageRequestDTO);
   int orderUpdateState(int order_idx);

   // 찜
   int zzimTotalCount(PageRequestDTO pageRequestDTO);
   PageResponseDTO<ZzimDTO> zzimListByPage(PageRequestDTO pageRequestDTO);

   // 카트
   // 찜
   int cartTotalCount(PageRequestDTO pageRequestDTO);
   PageResponseDTO<CartDTO> cartListByPage(PageRequestDTO pageRequestDTO);

}
