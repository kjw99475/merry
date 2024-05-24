package org.fullstack.merry.domain.lecture;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberLectureVO {
    private int ml_idx;
    private int member_idx;
    private int lec_idx;
    private String status;
}
