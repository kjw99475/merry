package org.fullstack.merry.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaVO {
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
}
