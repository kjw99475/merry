package org.fullstack.merry.dto.lecture;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureDTO {
    private int lec_idx;
    private String lec_title;
    private String lec_content;
    private String lec_status;
    private LocalDateTime lec_reg_date;
    private LocalDateTime lec_modify_date;
    private int member_idx;
    private String lec_img;
    private String member_name;
}
