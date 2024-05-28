package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.logging.log4j.core.config.plugins.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TeacherDTO {
    private int teacher_idx;
    private int member_idx;
    @NotBlank(message = "과목을 선택해 주세요.")
    private String subject;
    private String teacher_name;
    @NotBlank(message = "소개글을 입력해 주세요.")
    private String intro;
    private String teacher_image;
}
