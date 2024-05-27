package org.fullstack.merry.service;

import org.fullstack.merry.dto.BoardDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;

import java.util.List;

public interface MypageServiceIf {
   void addcart(String member_id, int LecIdx);
   void addzzim(String member_id, int LecIdx);
   void deleteCart(String member_id, int LecIdx);
   void deletezzim(String member_id, int LecIdx);

   // 페이징
   int writeTotalCount(PageRequestDTO pageRequestDTO);
   PageResponseDTO<BoardDTO> writeListByPage(PageRequestDTO pageRequestDTO);


   // 작성게시글
//   List<NoticeDTO> noticeList();
//   NoticeDTO noticeView(int idx);
//   int noticeRegist(NoticeDTO noticeDTO);
//   int noticeModify(NoticeDTO noticeDTO);
//   int noticeDelete(int idx);
//   //    int noticeListDelete(String[] idxArr);
//   int noticeFix(int idx);

}
