package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GradeDTO {
    private int grade_idx;
    @NotBlank(message = "제목을 입력하세요.")
    private String grade_title;
    @NotBlank(message = "학생을 입력하세요.")
    private String grade_student;
    @NotBlank(message = "선생님을 입력하세요.")
    private String grade_teacher;
    @NotNull(message = "점수를 입력하세요.")
    @PositiveOrZero(message = "0 이상의 숫자를 입력하세요.")
    @Max(value = 100, message = "100 이하의 숫자를 입력하세요.")
    private Integer grade_score;
}
