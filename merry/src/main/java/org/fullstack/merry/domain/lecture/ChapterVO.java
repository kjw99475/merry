package org.fullstack.merry.domain.lecture;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChapterVO {
    private int chap_idx;
    private String chap_title;
    private String chap_video;
    private String chap_org_video;
    private String chap_time;
    private int lec_idx;
    private String chap_status;
}
