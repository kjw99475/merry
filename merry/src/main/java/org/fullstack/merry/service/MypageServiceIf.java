package org.fullstack.merry.service;

import org.fullstack.merry.dto.*;

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
   QnaDTO viewQna(int qna_idx);
   int registQna(QnaDTO qnaDTO);

   // 결제내역
   int orderTotalCount(PageRequestDTO pageRequestDTO);
   PageResponseDTO<OrderDTO> orderListByPage(PageRequestDTO pageRequestDTO);
//   int getLecIdx(PageRequestDTO pageRequestDTO);

}
