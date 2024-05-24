package org.fullstack.merry.dto;

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
public class NoticeDTO {
    private int notice_idx;
    private String notice_title;
    private String notice_content;
    private String notice_type;
    private LocalDate notice_reg_date;
    private LocalDate notice_modify_date;
    private int member_idx;
    private String member_name;
}
