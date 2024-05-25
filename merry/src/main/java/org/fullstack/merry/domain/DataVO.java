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
public class DataVO {
    private int data_idx;
    private String data_title;
    private String data_content;
    private String data_org_file_name;
    private String data_save_file_name;
    private String data_type;
    private LocalDate data_reg_date;
    private LocalDate data_modify_date;
    private int member_idx;
    private int data_lec_idx;
}
