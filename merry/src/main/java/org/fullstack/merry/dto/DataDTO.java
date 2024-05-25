package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.time.LocalDate;
@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DataDTO {
    private int data_idx;
    @NotEmpty(message = "제목을 입력해 주세요.")
    @Size( max=100, message = "제목은 100자 이내로 작성해 주세요.")
    private String data_title;
    @NotEmpty(message = "내용을 입력해 주세요.")
    @Size( max=2000, message = "내용은 2000자 이내로 작성해 주세요.")
    private String data_content;
    private String data_org_file_name;
    private String data_save_file_name;
    private String data_type;
    private LocalDate data_reg_date;
    private LocalDate data_modify_date;
    private int member_idx;
    private int data_lec_idx;
    private String member_name;
}
