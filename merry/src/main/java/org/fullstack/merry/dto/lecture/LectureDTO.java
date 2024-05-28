package org.fullstack.merry.dto.lecture;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureDTO {
    private int lec_idx;
    @NotBlank(message = "제목을 입력해 주세요.")
    private String lec_title;
    @NotBlank(message = "내용을 입력해 주세요.")
    private String lec_content;
    private String lec_status;
    private LocalDateTime lec_reg_date;
    private LocalDateTime lec_modify_date;
    private int member_idx;

    private String lec_img;
    private String lec_org_img;
    private String member_name;
    @NotNull(message = "가격을 입력해 주세요.")
    @PositiveOrZero
    private Integer lec_price;
    private String lec_subject;
    private List<ChapterDTO> chapters;
}
