package org.fullstack.merry.dto;

import lombok.Builder;
import lombok.Data;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.CommonUtil;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Log4j2
@Data
public class PageResponseDTO<E> {
    private int total_count;
    private int page;
    private int page_size;
    private int page_skip_count;
    private int total_page;
    private int page_block_size;
    private int page_block_start;
    private int page_block_end;
    private boolean prev_page_flag;
    private boolean next_page_flag;

    List<E> dtoList;

    private String[] search_type;
    private String search_category;
    private String search_type_st;
    private String search_word;
    private String search_data1;
    private String search_data2;
    private String search_date1;
    private String search_date2;
    private String linked_params;
    private String class_code;
    private String subject_code;
    private String sort;
    private String status;
    private String type;
    private String type2;
    private String member_id;
    private String page_flag;

    private String grade_student;
    private String grade_teacher;

    PageResponseDTO() {}

    @Builder(builderMethodName = "withAll")
    public PageResponseDTO(PageRequestDTO requestDTO, List<E> dtoList, int total_count) {
        log.info("-------------------");
        log.info("PageResponseDTO Start");
        this.total_count = total_count; // 전체 게시글 수
        this.page = requestDTO.getPage(); // 현재 페이지 번호
        this.page_size = requestDTO.getPage_size(); // 한 페이지에 표시될 게시글 수
        this.page_skip_count = (this.page-1) * this.page_size; //DB 조회해올 로우 시작 인덱스
        this.total_page = (this.total_count > 0) ? (int) Math.ceil(this.total_count / (double) this.page_size) : 1; // 총 페이지수
        this.page_block_size = requestDTO.getPage_block_size(); // 페이지네이션에서 페이징 최대 한번에 몇 개씩 할지
        this.setPage_block_start();
        this.setPage_block_end();
        this.prev_page_flag = (this.page_block_start > 1); // 이전페이지 있는지 여부(페이지네이션에서 10개씩 이전 가는거)
        this.next_page_flag = (this.total_page > this.page_block_end); // 다음페이지 있는지 여부(페이지네이션에서 10개씩 다음 가는거)
        this.dtoList = dtoList;
        this.search_word = CommonUtil.parseString(requestDTO.getSearch_word());
        this.search_type =  requestDTO.getSearch_type();
        this.search_category = requestDTO.getSearch_category();
        this.type = requestDTO.getType();
        this.type2 = requestDTO.getType2();
        this.search_type_st = (search_type != null) ? Arrays.toString(search_type).replace("[","").replace("]","").replace(" ","") : "";
        this.search_data1 = CommonUtil.parseString(requestDTO.getSearch_data1());
        this.search_data2 = CommonUtil.parseString(requestDTO.getSearch_data2());
        this.search_date1 = requestDTO.getSearch_date1();
        this.search_date2 = requestDTO.getSearch_date2();
        this.member_id = requestDTO.getMember_id();
        this.class_code = requestDTO.getClass_code();
        this.subject_code = requestDTO.getSubject_code();
        this.status = requestDTO.getStatus();
        this.sort = requestDTO.getSort();
        this.page_flag = requestDTO.getPage_flag();
        this.grade_student = requestDTO.getGrade_student();
        this.grade_teacher = requestDTO.getGrade_teacher();

        StringBuilder sb = new StringBuilder("?page_size=" + this.page_size);
        if(search_type != null) sb.append("&search_type=" + search_type_st );
        if(search_word != null) sb.append("&search_word=" + search_word);
        if(search_data1 != null) sb.append("&search_data1=" + search_data1);
        if(search_data2 != null) sb.append("&search_data2=" + search_data2);
        if(status != null && !status.trim().isEmpty()) sb.append("&status=" + status);
        if(type != null) sb.append("&type=" + type);
        if(type2 != null) sb.append("&type2=" + type2);
        if(search_date1 != null) sb.append("&search_date1=" + search_date1);
        if(search_date2 != null) sb.append("&search_date2=" + search_date2);
        if(class_code != null && class_code!="") sb.append("&class_code=" + class_code);
        if(subject_code != null && subject_code != "") sb.append("&subject_code=" + subject_code);
        if(member_id != null) sb.append("&member_id=" + member_id);


        this.linked_params =  sb.toString();  // 쿼리스트링

        log.info("PageResponseDTO End");
        log.info("-------------------");
    }

    public int getTotal_page() {
        return (this.total_count > 0 ? (int)Math.ceil(this.total_count / (double)this.page_size) : 1);
    }
    public int getPage_skip_count() {
        return (this.page-1) * this.page_size;
    }
    public void setPage_block_start() {
        this.page_block_start = (int)(Math.ceil(this.page / (double)this.page_block_size) -1 ) * this.page_block_size + 1;
    }
    public void setPage_block_end() {
        this.page_block_end = (int)Math.ceil(this.page / (double)this.page_block_size) * this.page_block_size;
        this.page_block_end = this.page_block_end > this.total_page ? this.total_page : this.page_block_end;
    }
}
