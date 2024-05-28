package org.fullstack.merry.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
import org.fullstack.merry.domain.lecture.QnaAnswerDTO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.service.*;
import org.fullstack.merry.service.lecture.LectureServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {
    private final BoardServiceIf boardServiceIf;
    private final BoardReplyServiceIf boardReplyServiceIf;
    private final DataServiceIf dataServiceIf;
    private final InfoServiceIf infoServiceIf;
    private final NoticeServiceIf noticeServiceIf;
    private final LectureServiceIf lectureService;
    private final MemberServiceIf memberService;
    private final MypageServiceIf mypageService;

    @GetMapping("/member/list")
    public void GETmemberList(@Valid PageRequestDTO pageRequestDTO,
                              BindingResult bindingResult,
                              RedirectAttributes redirectAttributes,
                              Model model) {
        pageRequestDTO.setMember_type("B");

        PageResponseDTO<MemberDTO> responseDTO = memberService.memberList(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);

    }

    @RequestMapping(value = "/member/delete", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String memberDelete(@RequestParam("member_id") String member_id) {
        memberService.leave(member_id);
        return "ok";
    }

    @GetMapping("/teacher/list")
    public void GETteacherList(@Valid PageRequestDTO pageRequestDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model) {
        pageRequestDTO.setMember_type("T");

        PageResponseDTO<MemberDTO> responseDTO = memberService.memberList(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);

    }

    @RequestMapping(value = "/member/teacher", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String teacherRegist(@RequestParam("member_idx") int member_idx) {
        memberService.registTeacher(member_idx);
        return "ok";
    }

    // 1:1 문의
    @GetMapping("/qna/list")
    public void qnaListGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            HttpSession session,
            Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("MypageController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        int total_count = mypageService.qnaTotalCount2(pageRequestDTO);
        pageRequestDTO.setTotal_count(total_count);
        log.info("total_count : " + total_count);
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<QnaDTO> responseDTO = mypageService.qnaList2(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        log.info("responseDTO : " + responseDTO);
    }

    @GetMapping("/qna/view")
    public void viewQnaGET(
            @RequestParam(name="qna_idx", defaultValue = "0") int qna_idx,
            Model model
    ) {
        QnaDTO qnaDTO = mypageService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
        log.info("qnaDTO ; " + qnaDTO);
    }

    @GetMapping("/qna/regist")
    public void registQnaGET() {
    }

    @PostMapping("/qna/regist")
    public String registQnaPOST(@Valid QnaDTO qnaDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                HttpSession session,
                                Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);
            return "redirect:/mypage/qna/regist?qna_idx="+qnaDTO.getQna_idx();
        }
        qnaDTO.setQna_member_name((String)session.getAttribute("name"));
        int result = mypageService.registQna(qnaDTO);

        if (result > 0) {
            return "redirect:/mypage/qna/list?qna_idx="+qnaDTO.getQna_idx();
        }
        else {
            return "redirect:/mypage/qna/regist?qna_idx="+qnaDTO.getQna_idx();
        }
    }

    @GetMapping("/qna/replyRegist")
    public void replyRegistGET(
            @RequestParam(name="qna_idx", defaultValue = "0") int qna_idx,
            Model model
    ) {
        QnaDTO qnaDTO = mypageService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
        log.info("qnaDTO ; " + qnaDTO);
    }

    @PostMapping("/qna/replyRegist")
    public String replyRegistPOST(
            QnaAnswerDTO qnaAnswerDTO,
            @RequestParam(name="qna_idx", defaultValue = "0") int qna_idx,
            Model model
    ) {
        int result = mypageService.registReply(qnaAnswerDTO);

        if (result > 0) {
            return "redirect:/admin/qna/list";
        }
        else {
            return "redirect:/mypage/qna/replyRegist?qna_idx="+qna_idx;
        }
    }

    @GetMapping("/qna/modify")
    public void modifyQnaGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                             Model model) {
        QnaDTO qnaDTO = mypageService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qna/modify")
    public String modifyQnaPOST(@Valid QnaDTO qnaDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                Model model) {
        log.info("===========MapageController >> modifyQnaPOST =====");
        log.info("qnaDTO : " + qnaDTO);


        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/mypage/qna/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

        int result = lectureService.modifyQna(qnaDTO);

        if (result > 0) {
            return "redirect:/mypage/qna/view?qna_idx=" + qnaDTO.getQna_idx();
        }
        else {
            return "redirect:/mypage/qna/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

    }
    @GetMapping("/qna/replyModify")
    public void replyModifyGET(
            @RequestParam(name="qna_idx", defaultValue = "0") int qna_idx,
            Model model
    ) {
        QnaDTO qnaDTO = mypageService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
        log.info("qnaDTO ; " + qnaDTO);
    }

    @PostMapping("/qna/replyModify")
    public String replyModifyPOST(
            QnaAnswerDTO qnaAnswerDTO,
            @RequestParam(name="qna_idx", defaultValue = "0") int qna_idx,
            Model model
    ) {
        int result = mypageService.registReply(qnaAnswerDTO);

        if (result > 0) {
            return "redirect:/admin/qna/list";
        }
        else {
            return "redirect:/mypage/qna/replyRegist?qna_idx="+qna_idx;
        }
    }

    @GetMapping("/qna/delete")
    public String deleteQnaGET(@RequestParam(name="qna_idx", defaultValue = "0") int qna_idx) {
        lectureService.deleteQna(qna_idx);
        return "redirect:/admin/qna/list";
    }

    @GetMapping("/qna/replyDelete")
    public String replyDeleteQnaGET(@RequestParam(name="qna_idx", defaultValue = "0") int qna_idx) {
        int result = mypageService.deleteReply(qna_idx);

        if (result > 0) {
            return "redirect:/admin/qna/list";
        }
        else {
            return "redirect:/mypage/qna/view?qna_idx="+qna_idx;
        }
    }

    @GetMapping("/lecture/list")
    public void GETlectureList(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes,
                               HttpSession session, Model model) {
        if (bindingResult.hasErrors()) {
            log.info("LectureController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        String member_id = (String)session.getAttribute("member_id");


        PageResponseDTO<LectureDTO> responseDTO = lectureService.lectureList(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }

    @RequestMapping(value = "/lecture/delete", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String reviewDelete(@RequestParam("lec_idx") int lec_idx) {
        lectureService.delete(lec_idx);
        return "ok";
    }

    //    ===================== notice start ==============================
    @GetMapping("/notice/list")
    public void GETnoticeList(@Valid PageRequestDTO pageRequestDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {
        if(bindingResult.hasErrors()){
            log.info("noticeController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<NoticeDTO> responseDTO = noticeServiceIf.ListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/notice/view")
    public void GETnoticeView(@RequestParam(name="notice_idx") int notice_idx,
                            Model model
    ) {
        NoticeDTO noticeDTO = noticeServiceIf.view(notice_idx);
        model.addAttribute("noticeDTO", noticeDTO);
        log.info("noticeDTO >> " + noticeDTO);
    }

    @GetMapping("/notice/download")
    public void downloadNotice(int notice_idx,
                             HttpServletResponse resp,
                             HttpServletRequest req
    ) {
        NoticeDTO noticeDTO = noticeServiceIf.view(notice_idx);

        FileUploadUtil.download(req, resp, noticeDTO.getNotice_org_file_name(), noticeDTO.getNotice_save_file_name(), "uploads\\notice");
    }

    @RequestMapping(value = "/notice/deleteFile", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String NoticedeleteFilePOST(@RequestParam int notice_idx) {
        NoticeDTO noticeDTO = noticeServiceIf.view(notice_idx);
        log.info("noticeDTO >>> " + noticeDTO.getNotice_save_file_name());
        FileUploadUtil.deleteFile(noticeDTO.getNotice_save_file_name(), "uploads\\notice");
        noticeDTO.setNotice_org_file_name("");
        noticeDTO.setNotice_save_file_name("");
        noticeServiceIf.modify(noticeDTO);
        log.info("noticeDTO >>> " + noticeDTO.getNotice_save_file_name());
        return "ok";
    }


    @GetMapping("/notice/regist")
    public void GETnoticeRegist(
    ) {

    }

    @PostMapping("/notice/regist")
    public String POSTnoticeregist(@Valid NoticeDTO noticeDTO
            , BindingResult bindingResult
            , @RequestParam("file") MultipartFile multipartFile
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        log.info("NoticeController >> regist : " + noticeDTO);

        if(bindingResult.hasErrors()){
            log.info("NoticeController >> list Error");
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/notice/regist";
        }
        String saveFileName = "";
        if(multipartFile!= null && !multipartFile.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(multipartFile, "uploads\\notice");
            noticeDTO.setNotice_org_file_name(multipartFile.getOriginalFilename());
            noticeDTO.setNotice_save_file_name(saveFileName);
        }

        int result = noticeServiceIf.regist(noticeDTO);

        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/admin/notice/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/admin/notice/regist";
        }
    }

    @GetMapping("/notice/modify")
    public void GETnoticeModify(@RequestParam(name="notice_idx") int notice_idx,
                              Model model
    ) {
        NoticeDTO noticeDTO = noticeServiceIf.view(notice_idx);
        model.addAttribute("noticeDTO", noticeDTO);
        log.info("noticeDTO >> " + noticeDTO);
    }

    @PostMapping("/notice/modify")
    public String POSTnoticeModify(@Valid NoticeDTO noticeDTO
            , BindingResult bindingResult
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , @RequestParam(value = "upload", defaultValue = "") String upload
            , @RequestParam(value = "upload2", defaultValue = "") String upload2
            , @RequestParam("file") MultipartFile file
            , Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("NoticeController >> list Error");
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/notice/modify?notice_idx=" + noticeDTO.getNotice_idx();
        }
        String saveFileName = "";

        if(file!= null && !file.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(file, "uploads\\notice");
            noticeDTO.setNotice_org_file_name(file.getOriginalFilename());
            noticeDTO.setNotice_save_file_name(saveFileName);
            FileUploadUtil.deleteFile(upload2, "uploads\\notice");
        } else {
            noticeDTO.setNotice_org_file_name(upload);
            noticeDTO.setNotice_save_file_name(upload2);
        }

        int result = noticeServiceIf.modify(noticeDTO);

        if(result > 0) {
            log.info("수정 성공 ===============");
            return "redirect:/admin/notice/view?notice_idx=" + noticeDTO.getNotice_idx();
        } else {
            log.info("수정 실패 ===============");
            return "redirect:/admin/notice/modify?notice_idx=" + noticeDTO.getNotice_idx();
        }
    }

    @PostMapping("/notice/delete")
    public String POSTnoticeDelete(int notice_idx) {
        int result = noticeServiceIf.delete(notice_idx);
        if(result > 0) {
            log.info("삭제 성공 ===============");
            return "redirect:/admin/notice/list";
        }
        else {
            log.info("삭제 실패 ===============");
            return "redirect:/admin/notice/view?notice_idx=" + notice_idx;
        }
    }
    //    ===================== notice end ==============================

    //    ===================== info start ==============================
    @GetMapping("/info/list")
    public void GETinfoList(@Valid PageRequestDTO pageRequestDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {
        if(bindingResult.hasErrors()){
            log.info("infoController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<InfoDTO> responseDTO = infoServiceIf.ListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/info/view")
    public void GETinfoView(@RequestParam(name="info_idx") int info_idx,
                            Model model
    ) {
        InfoDTO infoDTO = infoServiceIf.view(info_idx);
        model.addAttribute("infoDTO", infoDTO);
        log.info("infoDTO >> " + infoDTO);
    }

    @GetMapping("/info/download")
    public void downloadInfo(int info_idx,
                            HttpServletResponse resp,
                            HttpServletRequest req
    ) {
        InfoDTO infoDTO = infoServiceIf.view(info_idx);

        FileUploadUtil.download(req, resp, infoDTO.getInfo_org_file_name(), infoDTO.getInfo_save_file_name(), "uploads\\info");
    }

    @RequestMapping(value = "/info/deleteFile", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String InfodeleteFilePOST(@RequestParam int info_idx) {
        InfoDTO infoDTO = infoServiceIf.view(info_idx);
        log.info("infoDTO >>> " + infoDTO.getInfo_save_file_name());
        FileUploadUtil.deleteFile(infoDTO.getInfo_save_file_name(), "uploads\\info");
        infoDTO.setInfo_org_file_name("");
        infoDTO.setInfo_save_file_name("");
        infoServiceIf.modify(infoDTO);
        log.info("infoDTO >>> " + infoDTO.getInfo_save_file_name());
        return "ok";
    }


    @GetMapping("/info/regist")
    public void GETinfoRegist(
    ) {

    }

    @PostMapping("/info/regist")
    public String POSTinforegist(@Valid InfoDTO infoDTO
            , BindingResult bindingResult
            , @RequestParam("file") MultipartFile multipartFile
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        log.info("InfoController >> regist : " + infoDTO);

        if(bindingResult.hasErrors()){
            log.info("InfoController >> list Error");
            redirectAttributes.addFlashAttribute("infoDTO", infoDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/info/regist";
        }
        String saveFileName = "";
        if(multipartFile!= null && !multipartFile.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(multipartFile, "uploads\\info");
            infoDTO.setInfo_org_file_name(multipartFile.getOriginalFilename());
            infoDTO.setInfo_save_file_name(saveFileName);
        }

        int result = infoServiceIf.regist(infoDTO);

        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/admin/info/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/admin/info/regist";
        }
    }

    @GetMapping("/info/modify")
    public void GETinfoModify(@RequestParam(name="info_idx") int info_idx,
                              Model model
    ) {
        InfoDTO infoDTO = infoServiceIf.view(info_idx);
        model.addAttribute("infoDTO", infoDTO);
        log.info("infoDTO >> " + infoDTO);
    }

    @PostMapping("/info/modify")
    public String POSTinfoModify(@Valid InfoDTO infoDTO
            , BindingResult bindingResult
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , @RequestParam(value = "upload", defaultValue = "") String upload
            , @RequestParam(value = "upload2", defaultValue = "") String upload2
            , @RequestParam("file") MultipartFile file
            , Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("InfoController >> list Error");
            redirectAttributes.addFlashAttribute("infoDTO", infoDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/info/modify?info_idx=" + infoDTO.getInfo_idx();
        }
        String saveFileName = "";

        if(file!= null && !file.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(file, "uploads\\info");
            infoDTO.setInfo_org_file_name(file.getOriginalFilename());
            infoDTO.setInfo_save_file_name(saveFileName);
            FileUploadUtil.deleteFile(upload2, "uploads\\info");
        } else {
            infoDTO.setInfo_org_file_name(upload);
            infoDTO.setInfo_save_file_name(upload2);
        }

        int result = infoServiceIf.modify(infoDTO);

        if(result > 0) {
            log.info("수정 성공 ===============");
            return "redirect:/admin/info/view?info_idx=" + infoDTO.getInfo_idx();
        } else {
            log.info("수정 실패 ===============");
            return "redirect:/admin/info/modify?info_idx=" + infoDTO.getInfo_idx();
        }
    }

    @PostMapping("/info/delete")
    public String POSTinfoDelete(int info_idx) {
        int result = infoServiceIf.delete(info_idx);
        if(result > 0) {
            log.info("삭제 성공 ===============");
            return "redirect:/admin/info/list";
        }
        else {
            log.info("삭제 실패 ===============");
            return "redirect:/admin/info/view?info_idx=" + info_idx;
        }
    }
    //    ===================== info end ==============================

    //    ===================== data start ==============================
    @GetMapping("/data/list")
    public void GETdataList(@Valid PageRequestDTO pageRequestDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             Model model) {
        if(bindingResult.hasErrors()){
            log.info("dataController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<DataDTO> responseDTO = dataServiceIf.ListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/data/view")
    public void GETdataView(@RequestParam(name="data_idx") int data_idx,
                             Model model
    ) {
        DataDTO dataDTO = dataServiceIf.view(data_idx);
        model.addAttribute("dataDTO", dataDTO);
        log.info("dataDTO >> " + dataDTO);
    }

    @GetMapping("/data/download")
    public void downloadData(int data_idx,
                            HttpServletResponse resp,
                            HttpServletRequest req
    ) {
        DataDTO dataDTO = dataServiceIf.view(data_idx);

        FileUploadUtil.download(req, resp, dataDTO.getData_org_file_name(), dataDTO.getData_save_file_name(), "uploads\\data");
    }

    @RequestMapping(value = "/data/deleteFile", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String DatadeleteFilePOST(@RequestParam int data_idx) {
        DataDTO dataDTO = dataServiceIf.view(data_idx);
        log.info("dataDTO >>> " + dataDTO.getData_save_file_name());
        FileUploadUtil.deleteFile(dataDTO.getData_save_file_name(), "uploads\\data");
        dataDTO.setData_org_file_name("");
        dataDTO.setData_save_file_name("");
        dataServiceIf.modify(dataDTO);
        log.info("dataDTO >>> " + dataDTO.getData_save_file_name());
        return "ok";
    }
    

    @GetMapping("/data/regist")
    public void GETdataRegist(
    ) {

    }

    @PostMapping("/data/regist")
    public String POSTdataregist(@Valid DataDTO dataDTO
            , BindingResult bindingResult
            , @RequestParam("file") MultipartFile multipartFile
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        log.info("DataController >> regist : " + dataDTO);

        if(bindingResult.hasErrors()){
            log.info("DataController >> list Error");
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/data/regist";
        }
        String saveFileName = "";
        if(multipartFile!= null && !multipartFile.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(multipartFile, "uploads\\data");
            dataDTO.setData_org_file_name(multipartFile.getOriginalFilename());
            dataDTO.setData_save_file_name(saveFileName);
        }

        int result = dataServiceIf.regist(dataDTO);

        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/admin/data/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/admin/data/regist";
        }
    }

    @GetMapping("/data/modify")
    public void GETdataModify(@RequestParam(name="data_idx") int data_idx,
                               Model model
    ) {
        DataDTO dataDTO = dataServiceIf.view(data_idx);
        model.addAttribute("dataDTO", dataDTO);
        log.info("dataDTO >> " + dataDTO);
    }

    @PostMapping("/data/modify")
    public String POSTdataModify(@Valid DataDTO dataDTO
            , BindingResult bindingResult
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , @RequestParam(value = "upload", defaultValue = "") String upload
            , @RequestParam(value = "upload2", defaultValue = "") String upload2
            , @RequestParam("file") MultipartFile file
            , Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("DataController >> list Error");
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/data/modify?data_idx=" + dataDTO.getData_idx();
        }
        String saveFileName = "";

        if(file!= null && !file.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(file, "uploads\\data");
            dataDTO.setData_org_file_name(file.getOriginalFilename());
            dataDTO.setData_save_file_name(saveFileName);
            FileUploadUtil.deleteFile(upload2, "uploads\\data");
        } else {
            dataDTO.setData_org_file_name(upload);
            dataDTO.setData_save_file_name(upload2);
        }

        int result = dataServiceIf.modify(dataDTO);

        if(result > 0) {
            log.info("수정 성공 ===============");
            return "redirect:/admin/data/view?data_idx=" + dataDTO.getData_idx();
        } else {
            log.info("수정 실패 ===============");
            return "redirect:/admin/data/modify?data_idx=" + dataDTO.getData_idx();
        }
    }

    @PostMapping("/data/delete")
    public String POSTdataDelete(int data_idx) {
        int result = dataServiceIf.delete(data_idx);
        if(result > 0) {
            log.info("삭제 성공 ===============");
            return "redirect:/admin/data/list";
        }
        else {
            log.info("삭제 실패 ===============");
            return "redirect:/admin/data/view?data_idx=" + data_idx;
        }
    }
    //    ===================== data end ==============================
    
    
//    ===================== board start ==============================
    @GetMapping("/board/list")
    public void GETboardList(@Valid PageRequestDTO pageRequestDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {
        if(bindingResult.hasErrors()){
            log.info("dataController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<BoardDTO> responseDTO = boardServiceIf.ListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/board/view")
    public void GETboardView(@RequestParam(name="board_idx") int board_idx,
                             Model model
    ) {
        BoardDTO boardDTO = boardServiceIf.view(board_idx);
        model.addAttribute("boardDTO", boardDTO);
        log.info("boardDTO >> " + boardDTO);

        List<BoardReplyDTO> replyDTOList = boardReplyServiceIf.reply_list(board_idx);
        model.addAttribute("replyDTOList", replyDTOList);
        log.info("replyDTOList >> " + replyDTOList);
    }

    @GetMapping("/board/regist")
    public void GETboardRegist(
    ) {

    }

    @PostMapping("/board/regist")
    public String POSTboardregist(@Valid BoardDTO boardDTO
            , BindingResult bindingResult
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        log.info("BoardController >> regist : " + boardDTO);

        if(bindingResult.hasErrors()){
            log.info("BoardController >> list Error");
            redirectAttributes.addFlashAttribute("boardDTO", boardDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/board/regist";
        }

        int result = boardServiceIf.regist(boardDTO);

        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/admin/board/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/admin/board/regist";
        }
    }

    @GetMapping("/board/modify")
    public void GETboardModify(@RequestParam(name="board_idx") int board_idx,
            Model model
    ) {
        BoardDTO boardDTO = boardServiceIf.view(board_idx);
        model.addAttribute("boardDTO", boardDTO);
        log.info("boardDTO >> " + boardDTO);
    }

    @PostMapping("/board/modify")
    public String POSTboardModify(@Valid BoardDTO boardDTO
            , BindingResult bindingResult
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("BoardController >> list Error");
            redirectAttributes.addFlashAttribute("boardDTO", boardDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/board/modify?board_idx=" + boardDTO.getBoard_idx();
        }
        int result = boardServiceIf.modify(boardDTO);

        if(result > 0) {
            log.info("수정 성공 ===============");
            return "redirect:/admin/board/view?board_idx=" + boardDTO.getBoard_idx();
        } else {
            log.info("수정 실패 ===============");
            return "redirect:/admin/board/modify?board_idx=" + boardDTO.getBoard_idx();
        }
    }

    @PostMapping("/board/delete")
    public String POSTboardDelete(int board_idx) {
        int result = boardServiceIf.delete(board_idx);
        if(result > 0) {
            log.info("삭제 성공 ===============");
            return "redirect:/admin/board/list";
        }
        else {
            log.info("삭제 실패 ===============");
            return "redirect:/admin/board/view?board_idx=" + board_idx;
        }
    }
    //    ===================== board end ==============================
}
