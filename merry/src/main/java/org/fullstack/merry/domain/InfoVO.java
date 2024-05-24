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
public class InfoVO {
    private int info_idx;
    private String info_title;
    private String info_content;
    private LocalDate info_reg_date;
    private LocalDate info_modify_date;
    private int member_idx;
}
