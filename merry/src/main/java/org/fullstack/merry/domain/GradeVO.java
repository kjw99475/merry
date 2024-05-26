package org.fullstack.merry.domain;

import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GradeVO {
    private int grade_idx;
    private String grade_title;
    private String grade_student;
    private String grade_teacher;
    private int grade_score;
}
