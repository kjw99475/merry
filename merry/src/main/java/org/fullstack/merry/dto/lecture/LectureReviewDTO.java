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
public class LectureReviewDTO {
    private int review_idx;
    private int member_idx;
    private String comment;
    private LocalDateTime review_reg_date;
    private LocalDateTime review_modify_date;
    private String review_writer;
}
