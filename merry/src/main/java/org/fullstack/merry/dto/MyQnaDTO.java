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
public class MyQnaDTO {
    private int qna_idx;
    private String qna_title;
    private String qna_content;
    private LocalDateTime qna_reg_date;
    private LocalDateTime qna_modify_date;
    private int member_idx;
    private String qna_member_name;
    private String qna_answer_name;
    private String qna_answer;
    private String qna_answer_yn;
    private LocalDateTime qna_answer_reg_date;
    private LocalDateTime qna_answer_modify_date;
    private String qna_type;
    private int qna_lec_idx;
    private String qna_answer_idx;

    private int lec_idx;
    private String lec_title;
    private String lec_content;
    private String lec_status;
    private LocalDateTime lec_reg_date;
    private LocalDateTime lec_modify_date;
    private String lec_img;
    private String lec_org_img;
    private String member_name;
    private int lec_price;
    private String lec_subject;
    private List<ChapterDTO> chapters;
}
