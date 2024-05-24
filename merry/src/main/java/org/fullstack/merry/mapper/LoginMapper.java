package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack.merry.domain.MemberVO;

public interface LoginMapper {
    MemberVO login_info(@Param("member_id") String id, @Param("pwd") String pwd);

//    int update_login_data(@Param("user_id") String id, @Param("pwd") String pwd);
//    int update_try_count(@Param("user_id") String id);
//    int try_count(@Param("user_id") String id);
//
//    int update_tmp_pwd(@Param("user_id") String id, @Param("tmp_pwd") String tmp_pwd);
//    String get_tmp_pwd(@Param("user_id") String id);
//    int reset_tmp_pwd(@Param("user_id") String id);
//
//    int change_pwd(@Param("user_id") String user_id, @Param("pwd") String pwd);


//    String search_id(@Param("name") String name, @Param("email") String email);
//    int search_pwd(@Param("name") String name, @Param("email") String email, @Param("member_id") String member_id);
//    int change_pwd(@Param("member_id") String member_id, @Param("pwd") String pwd);
}
