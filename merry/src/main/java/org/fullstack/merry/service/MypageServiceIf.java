package org.fullstack.merry.service;

public interface MypageServiceIf {
   void addcart(String member_id, int LecIdx);
   void addzzim(String member_id, int LecIdx);
   void deleteCart(String member_id, int LecIdx);
   void deletezzim(String member_id, int LecIdx);
}
