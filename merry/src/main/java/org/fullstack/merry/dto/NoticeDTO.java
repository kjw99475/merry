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
public class NoticeDTO {
    private int notice_idx;
    @NotEmpty(message = "제목을 입력해 주세요.")
    @Size( max=100, message = "제목은 100자 이내로 작성해 주세요.")
    private String notice_title;
    @NotEmpty(message = "내용을 입력해 주세요.")
    @Size( max=2000, message = "내용은 2000자 이내로 작성해 주세요.")
    private String notice_content;
    private String notice_org_file_name;
    private String notice_save_file_name;
    private String notice_type;
    private LocalDate notice_reg_date;
    private LocalDate notice_modify_date;
    private int member_idx;
    private String member_name;
    private int notice_lec_idx;
}
