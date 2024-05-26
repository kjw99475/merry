package org.fullstack.merry.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TeacherVO {
    private int teacher_idx;
    private int member_idx;
    private String subject;
    private String teacher_name;
    private String intro;
    private String teacher_image;
}
