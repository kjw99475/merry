package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.fullstack.merry.dto.lecture.ChapterDTO;

import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyReviewDTO {
    private int lec_idx;
    private String lec_title;
    private String lec_content;
    private String lec_status;
    private LocalDateTime lec_reg_date;
    private LocalDateTime lec_modify_date;
    private int member_idx;
    private String lec_img;
    private String lec_org_img;
    private String member_name;
    private int lec_price;
    private String lec_subject;
    private List<ChapterDTO> chapters;

    private int review_idx;
    private String comment;
    private LocalDateTime review_reg_date;
    private LocalDateTime review_modify_date;
    private String review_writer;
}
