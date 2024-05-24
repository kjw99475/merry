package org.fullstack.merry.dto.lecture;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberLectureDTO {
    private int ml_idx;
    private int member_idx;
    private int lec_idx;
    private String status;
}
