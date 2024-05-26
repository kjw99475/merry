package org.fullstack.merry.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeVO {
    private int notice_idx;
    private String notice_title;
    private String notice_content;
    private String notice_org_file_name;
    private String notice_save_file_name;
    private String notice_type;
    private LocalDate notice_reg_date;
    private LocalDate notice_modify_date;
    private int member_idx;
    private int notice_lec_idx;
    private String notice_member_name;
}
