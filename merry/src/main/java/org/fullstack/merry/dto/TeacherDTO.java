package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TeacherDTO {
    private int teacher_idx;
    private int member_idx;
    private String subject;
    private String teacher_name;
    private String intro;
    private String teacher_image;
}
