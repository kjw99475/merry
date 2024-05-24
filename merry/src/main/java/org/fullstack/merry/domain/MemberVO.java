package org.fullstack.merry.domain;

<<<<<<< HEAD
import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
=======
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
>>>>>>> yh
@Builder
public class MemberVO {
    private int member_idx;
    private String member_id;
<<<<<<< HEAD
    private String pwd;
    private String name;
=======
    private String name;
    private String pwd;
>>>>>>> yh
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
<<<<<<< HEAD
=======
    private String teacher_intro;
>>>>>>> yh
}
