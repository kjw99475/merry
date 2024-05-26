package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GradeDTO {
    private int grade_idx;
    private String grade_title;
    private String grade_student;
    private String grade_teacher;
    private int grade_score;
}
