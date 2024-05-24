package org.fullstack.merry.service;

import org.fullstack.merry.dto.MemberDTO;

public interface LoginServiceIf {
    MemberDTO login_info(String user_id, String pwd);
//    int update_login_data(String user_id, String pwd);
//    int update_try_count(String user_id);
//    int try_count(String user_id);
//    int update_tmp_pwd(String user_id);
//    String get_tmp_pwd(String user_id);
//    int reset_tmp_pwd(String user_id);
//
//    int change_pwd(String user_id, String pwd);
}
