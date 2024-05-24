package org.fullstack.merry.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    private int member_idx;
    private String member_id;
    private String pwd;
    private String name;
    private String email;
    private String birthday;
    private String addr;
    private String addr_detail;
    private int zipcode;
    private String phone;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String member_type;
    private String member_state;
}
