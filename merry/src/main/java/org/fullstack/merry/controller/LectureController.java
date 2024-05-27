package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
import org.fullstack.merry.domain.lecture.ChapterVO;
import org.fullstack.merry.domain.lecture.QnaAnswerDTO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.ChapterDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.dto.lecture.LectureReviewDTO;
import org.fullstack.merry.service.TeacherServiceIf;
import org.fullstack.merry.service.lecture.ChapterServiceIf;
import org.fullstack.merry.service.lecture.LectureServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/lecture")
public class LectureController {
    private final LectureServiceIf lectureService;
    private final ChapterServiceIf chapterService;
    private final TeacherServiceIf teacherService;

    @GetMapping("/regist")
    public void regist(HttpSession session, Model model) {

        int member_idx = (int) session.getAttribute("member_idx");
        String subject = lectureService.getSubject(member_idx);
        model.addAttribute("subject", subject);
    }

    @PostMapping("/regist")
    public String regist(@Valid LectureDTO lectureDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes,
                         @RequestParam("lecImg") MultipartFile lecImg,
                         @RequestParam("chapVideos") List<MultipartFile> chapVideos,
                         HttpSession session,
                         Model model) {
        log.info("registPost");

//        if (bindingResult.hasErrors()) {
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("lectureDTO", lectureDTO);
//            log.info("valid 오류");
//            return "redirect:/lecture/regist";
//        }

        String saveLecImg = "";
        if (lecImg != null && !lecImg.isEmpty()) {
            saveLecImg = FileUploadUtil.saveFile(lecImg, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            lectureDTO.setLec_img(saveLecImg);
            lectureDTO.setLec_org_img(lecImg.getOriginalFilename());
        }

        int resultLectureIdx = lectureService.regist(lectureDTO);
        log.info("resultLecture: {}", resultLectureIdx);

        List<ChapterDTO> chapterDTOList = lectureDTO.getChapters();
        String saveChapVideo = "";
        if (chapterDTOList != null && !chapterDTOList.isEmpty()) {
            for (int i=0; i<chapterDTOList.size(); i++) {
                saveChapVideo = "";
                if (chapVideos != null && i < chapVideos.size() && !chapVideos.get(i).isEmpty()) {
                    saveChapVideo = FileUploadUtil.saveFile(chapVideos.get(i), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
                    chapterDTOList.get(i).setChap_video(saveChapVideo);
                    chapterDTOList.get(i).setChap_org_video(chapVideos.get(i).getOriginalFilename());
                    log.info(chapVideos.get(i).getOriginalFilename());
                }
                else {
                    log.info("동영상 이슈");
                    redirectAttributes.addFlashAttribute("errorVideo", "동영상을 넣어주세요.");
                    return "redirect:/lecture/regist";
                }
                chapterDTOList.get(i).setLec_idx(resultLectureIdx);
                chapterService.regist(chapterDTOList.get(i));
            }
        }

        log.info(chapterDTOList);

        return "redirect:/lecture/list";
    }

    @GetMapping("/view")
    public void view(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                     OrderDTO orderDTO,
                     HttpSession session,
                     Model model) {
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        List<ChapterVO> chapterDTOList = chapterService.chapterList(lec_idx);
        List<QnaDTO> qnaList = lectureService.qnaList(lec_idx);
        List<DataDTO> dataList = lectureService.dataList(lec_idx);
        List<NoticeDTO> noticeList = lectureService.noticeList(lec_idx);
        List<LectureReviewDTO> reviewList = lectureService.reviewList(lec_idx);
        String member_id = (String)session.getAttribute("member_id");
        List<Integer> cartlist = teacherService.cartList(member_id);
        List<Integer> zzimlist = teacherService.zzimList(member_id);

        orderDTO.setLec_idx(lectureDTO.getLec_idx());
        orderDTO.setMember_id(member_id);
        orderDTO.setMember_idx((Integer) session.getAttribute("member_idx"));

        int orderCnt = lectureService.viewOrder(orderDTO);
        int reviewCnt = lectureService.countReview(orderDTO);

        model.addAttribute("zzimlist", zzimlist);
        model.addAttribute("cartlist", cartlist);
        model.addAttribute("dataList", dataList);
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("lectureDTO", lectureDTO);
        model.addAttribute("ChapterList", chapterDTOList);
        model.addAttribute("orderCnt", orderCnt);
        model.addAttribute("reviewCnt", reviewCnt);
    }

    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes,
                     HttpSession session, Model model) {
        if (bindingResult.hasErrors()) {
            log.info("LectureController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_size(12);
        pageRequestDTO.setLec_status("Y");

        String member_id = (String)session.getAttribute("member_id");
        List<Integer> cartlist = teacherService.cartList(member_id);
        List<Integer> zzimlist = teacherService.zzimList(member_id);

        model.addAttribute("zzimlist", zzimlist);
        model.addAttribute("cartlist", cartlist);

        PageResponseDTO<LectureDTO> responseDTO = lectureService.lectureList(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/modify")
    public void modify(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx, Model model) {
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        List<ChapterVO> chapterDTOList = chapterService.chapterList(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
        model.addAttribute("ChapterList", chapterDTOList);
    }

    @PostMapping("/modify")
    public String modify(@Valid LectureDTO lectureDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes,
                         @RequestParam(value = "upload", defaultValue = "") String upload,
                         @RequestParam(value = "upload2", defaultValue = "") String upload2,
                         @RequestParam("lecImg") MultipartFile lecImg,
                         @RequestParam("chapVideos") List<MultipartFile> chapVideos,
                         HttpSession session,
                         Model model) {

//        if (bindingResult.hasErrors()) {
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("lectureDTO", lectureDTO);
//            log.info("valid 오류");
//            return "redirect:/lecture/regist";
//        }



        String saveLecImg = "";
        if (lecImg != null && !lecImg.isEmpty()) {
            saveLecImg = FileUploadUtil.saveFile(lecImg, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            FileUploadUtil.deleteFile(upload2, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            lectureDTO.setLec_img(saveLecImg);
            lectureDTO.setLec_org_img(lecImg.getOriginalFilename());
        } else {
            lectureDTO.setLec_img(upload2);
            lectureDTO.setLec_org_img(upload);
        }

        int resultLectureIdx = lectureService.modify(lectureDTO);
        log.info("resultLecture: {}", resultLectureIdx);

        List<ChapterVO> chapList = chapterService.chapterList(lectureDTO.getLec_idx());

        List<ChapterDTO> chapterDTOList = lectureDTO.getChapters();
        String saveChapVideo = "";
        List<String> videoList = new ArrayList<String>();
        List<String> saveVideoList = new ArrayList<>();

        for (int i=0; i<chapList.size(); i++) {
            videoList.add(chapList.get(i).getChap_org_video());
            saveVideoList.add(chapList.get(i).getChap_video());
        }

        if (chapterDTOList != null && !chapterDTOList.isEmpty()) {


            chapterService.modifyAndDelete(lectureDTO.getLec_idx());

            for (int i=0; i<chapterDTOList.size(); i++) {
                saveChapVideo = "";
                if (chapVideos != null && i < chapVideos.size() && !chapVideos.get(i).isEmpty()) {
                    for (int j=0; j<chapList.size(); j++) {
                        if (i == j) {
                            FileUploadUtil.deleteFile(chapList.get(j).getChap_video(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
                        }
                    }

                    saveChapVideo = FileUploadUtil.saveFile(chapVideos.get(i), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
                    chapterDTOList.get(i).setChap_video(saveChapVideo);
                    chapterDTOList.get(i).setChap_org_video(chapVideos.get(i).getOriginalFilename());
                }
                else {
                    for (int j=0; j<chapList.size(); j++) {
                        chapterDTOList.get(j).setChap_video(saveVideoList.get(j));
                        chapterDTOList.get(j).setChap_org_video(videoList.get(j));
                    }

                }
                chapterDTOList.get(i).setLec_idx(lectureDTO.getLec_idx());
                chapterService.regist(chapterDTOList.get(i));
            }
        }

        log.info(chapterDTOList);

        return "redirect:/lecture/view?lec_idx=" + lectureDTO.getLec_idx();
    }

    @PostMapping("/delete")
    public String String (@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx, Model model) {
        lectureService.delete(lec_idx);
        return "redirect:/lecture/view?lec_idx=" + lec_idx;
    }

    @GetMapping("/data/list")
    public void dataListGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                            Model model) {
        List<DataDTO> dataList = lectureService.dataList(lec_idx);
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
        model.addAttribute("lec_idx", lec_idx);
        model.addAttribute("dataList", dataList);
    }

    @GetMapping("/notice/list")
    public void noticeListGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                              Model model) {
        List<NoticeDTO> noticeList = lectureService.noticeList(lec_idx);
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
        model.addAttribute("lec_idx", lec_idx);
        model.addAttribute("noticeList", noticeList);
    }

    @GetMapping("/qna/list")
    public void qnaListGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                           Model model) {
        List<QnaDTO> qnaList = lectureService.qnaList(lec_idx);
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
        model.addAttribute("lec_idx", lec_idx);
        model.addAttribute("qnaList", qnaList);
    }

    //qna
    @GetMapping("/qna/regist")
    public void qnaRegistGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                             Model model) {
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
    }

    @PostMapping("/qna/regist")
    public String qnaRegistPOST(@Valid QnaDTO qnaDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);
            return "redirect:/lecture/qna/regist?lec_idx="+qnaDTO.getQna_lec_idx();
        }

        int result = lectureService.registQna(qnaDTO);

        if (result > 0) {
            return "redirect:/lecture/qna/list?lec_idx="+qnaDTO.getQna_lec_idx();
        }
        else {
            return "redirect:/lecture/qna/regist?lec_idx="+qnaDTO.getQna_lec_idx();
        }

    }
    @GetMapping("/qna/modify")
    public void modifyQna(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                          HttpSession session,
                          Model model) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qna/modify")
    public String modifyQna(@Valid QnaDTO qnaDTO,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes,
                           Model model) {

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/lecture/qna/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

        int result = lectureService.modifyQna(qnaDTO);

        if (result > 0) {
            return "redirect:/lecture/qna/view?qna_idx=" + qnaDTO.getQna_idx();
        }
        else {
            return "redirect:/lecture/qna/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

    }

    @GetMapping("/qna/view")
    public void viewQnaGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                        HttpSession session,
                        Model model) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @GetMapping("/qna/delete")
    public String deleteQnaGET(@RequestParam(name="qna_idx", defaultValue = "0") int qna_idx) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        int lec_idx = qnaDTO.getQna_lec_idx();
        lectureService.deleteQna(qna_idx);
        return "redirect:/lecture/qna/list?lec_idx="+lec_idx;
    }

    @GetMapping("/qna/teacherWrite")
    public void registAdminGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                               HttpSession session,
                               Model model) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qna/teacherWrite")
    public String registAdminPOST(@Valid QnaAnswerDTO qnaAnswerDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes,
                                  @RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                                  Model model) {



        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaAnswerDTO", qnaAnswerDTO);

            return "redirect:/lecture/qna/teacherWrite?qna_idx=" + qna_idx;
        }

        int result = lectureService.registTeacher(qnaAnswerDTO);
        if (result > 0) {
            return "redirect:/lecture/qna/view?qna_idx=" + qna_idx;
        }

        else {
            return "redirect:/lecture/qna/teacherWrite?qna_idx=" + qna_idx;
        }

    }


    @GetMapping("/qna/teacherModify")
    public void modifyAdminGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                               HttpSession session,
                               Model model) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qna/teacherModify")
    public String modifyAdminPOST(@Valid QnaAnswerDTO qnaAnswerDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes,
                                  @RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                                  Model model) {



        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaAnswerDTO", qnaAnswerDTO);

            return "redirect:/lecture/qna/teacherWrite?qna_idx=" + qna_idx;
        }

        int result = lectureService.modifyTeacher(qnaAnswerDTO);
        if (result > 0) {
            return "redirect:/lecture/qna/view?qna_idx=" + qna_idx;
        }

        else {
            return "redirect:/lecture/qna/teacherWrite?qna_idx=" + qna_idx;
        }

    }

    @GetMapping("/qna/teacherDelete")
    public String deleteAdminGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx) {
        lectureService.deleteTeacher(qna_idx);
        return "redirect:/lecture/qna/view?qna_idx=" + qna_idx;
    }

    //notice
    @GetMapping("/notice/regist")
    public void noticeRegistGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                             Model model) {
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
    }

    @PostMapping("/notice/regist")
    public String noticeRegistPOST(@Valid NoticeDTO noticeDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            return "redirect:/lecture/notice/regist?lec_idx="+noticeDTO.getNotice_lec_idx();
        }

        int result = lectureService.registNotice(noticeDTO);

        if (result > 0) {
            return "redirect:/lecture/notice/list?lec_idx="+noticeDTO.getNotice_lec_idx();
        }
        else {
            return "redirect:/lecture/notice/regist?lec_idx="+noticeDTO.getNotice_lec_idx();
        }

    }
    @GetMapping("/notice/modify")
    public void modifyNotice(@RequestParam(name = "notice_idx", defaultValue="0") int notice_idx,
                          HttpSession session,
                          Model model) {
        NoticeDTO noticeDTO = lectureService.viewNotice(notice_idx);
        model.addAttribute("noticeDTO", noticeDTO);
    }

    @PostMapping("/notice/modify")
    public String modifyNotice(@Valid NoticeDTO noticeDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);

            return "redirect:/lecture/notice/modify?notice_idx=" + noticeDTO.getNotice_idx();
        }

        int result = lectureService.modifyNotice(noticeDTO);

        if (result > 0) {
            return "redirect:/lecture/notice/view?notice_idx=" + noticeDTO.getNotice_idx();
        }
        else {
            return "redirect:/lecture/notice/modify?notice_idx=" + noticeDTO.getNotice_idx();
        }

    }

    @GetMapping("/notice/view")
    public void viewnoticeGET(@RequestParam(name = "notice_idx", defaultValue="0") int notice_idx,
                           HttpSession session,
                           Model model) {
        NoticeDTO noticeDTO = lectureService.viewNotice(notice_idx);
        model.addAttribute("noticeDTO", noticeDTO);
    }

    @GetMapping("/notice/delete")
    public String deletenoticeGET(@RequestParam(name = "notice_idx", defaultValue="0") int notice_idx) {
        NoticeDTO noticeDTO = lectureService.viewNotice(notice_idx);
        int lec_idx = noticeDTO.getNotice_lec_idx();
        lectureService.deleteNotice(notice_idx);
        return "redirect:/lecture/notice/list?lec_idx="+lec_idx;
    }


    //data
    @GetMapping("/data/regist")
    public void dataRegistGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                                Model model) {
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
    }

    @PostMapping("/data/regist")
    public String dataRegistPOST(@Valid DataDTO dataDTO,
                                   BindingResult bindingResult,
                                   RedirectAttributes redirectAttributes,
                                 @RequestParam("file") MultipartFile multipartFile,
                                   Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);
            return "redirect:/lecture/data/regist?lec_idx="+dataDTO.getData_lec_idx();
        }

        String saveFileName = "";
        if(multipartFile!= null && !multipartFile.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(multipartFile, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            dataDTO.setData_org_file_name(multipartFile.getOriginalFilename());
            dataDTO.setData_save_file_name(saveFileName);
        }

        int result = lectureService.registData(dataDTO);

        if (result > 0) {
            return "redirect:/lecture/data/list?lec_idx="+dataDTO.getData_lec_idx();
        }
        else {
            return "redirect:/lecture/data/regist?lec_idx="+dataDTO.getData_lec_idx();
        }

    }
    @GetMapping("/data/modify")
    public void modifyData(@RequestParam(name = "data_idx", defaultValue="0") int data_idx,
                             HttpSession session,
                             Model model) {
        DataDTO dataDTO = lectureService.viewData(data_idx);
        model.addAttribute("dataDTO", dataDTO);
    }

    @PostMapping("/data/modify")
    public String modifyData(@Valid DataDTO dataDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                             @RequestParam(value = "upload", defaultValue = "") String upload,
                             @RequestParam(value = "upload2", defaultValue = "") String upload2,
                             @RequestParam("file") MultipartFile multipartFile,
                               Model model) {

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);

            return "redirect:/lecture/data/modify?data_idx=" + dataDTO.getData_idx();
        }


        String saveFileName = "";
        if(multipartFile!= null && !multipartFile.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(multipartFile, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            if (!upload2.equals("")){
                FileUploadUtil.deleteFile(upload2, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            }
            dataDTO.setData_org_file_name(multipartFile.getOriginalFilename());
            dataDTO.setData_save_file_name(saveFileName);

        } else {
            dataDTO.setData_org_file_name(upload);
            dataDTO.setData_save_file_name(upload2);
        }


        int result = lectureService.modifyData(dataDTO);

        if (result > 0) {
            return "redirect:/lecture/data/view?data_idx=" + dataDTO.getData_idx();
        }
        else {
            return "redirect:/lecture/data/modify?data_idx=" + dataDTO.getData_idx();
        }

    }

    @GetMapping("/data/view")
    public void viewdataGET(@RequestParam(name = "data_idx", defaultValue="0") int data_idx,
                              HttpSession session,
                              Model model) {
        DataDTO dataDTO = lectureService.viewData(data_idx);
        model.addAttribute("dataDTO", dataDTO);
    }

    @GetMapping("/data/delete")
    public String deletedataGET(@RequestParam(name = "data_idx", defaultValue="0") int data_idx) {
        DataDTO dataDTO = lectureService.viewData(data_idx);
        int lec_idx = dataDTO.getData_lec_idx();
        if (dataDTO.getData_save_file_name() != null || !dataDTO.getData_save_file_name().isEmpty() || !dataDTO.getData_save_file_name().equals("")) {
            FileUploadUtil.deleteFile(dataDTO.getData_save_file_name(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
        }
        lectureService.deleteData(data_idx);
        return "redirect:/lecture/data/list?lec_idx="+lec_idx;
    }

    @RequestMapping(value = "/data/deleteFile", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String deleteFilePOST(@RequestParam int idx) {
        DataDTO dataDTO = lectureService.viewData(idx);
        log.info(dataDTO.getData_save_file_name());
        FileUploadUtil.deleteFile(dataDTO.getData_save_file_name(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
        dataDTO.setData_save_file_name("");
        dataDTO.setData_org_file_name("");
        lectureService.registData(dataDTO);
        return "ok";
    }

    @GetMapping("/data/download")
    public void downloadNotice(@RequestParam(name="data_idx") int idx,
                               HttpServletResponse resp,
                               HttpServletRequest req
    ) {
        DataDTO dataDTO = lectureService.viewData(idx);

        FileUploadUtil.download(req, resp, dataDTO.getData_org_file_name(), dataDTO.getData_save_file_name(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
    }

    //review
    @PostMapping("/review/regist")
    public String reviewRegist(@Valid LectureReviewDTO lectureReviewDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/lecture/view?lec_idx=" + lectureReviewDTO.getLec_idx();
        }

        int result = lectureService.registReview(lectureReviewDTO);
        return "redirect:/lecture/view?lec_idx=" + lectureReviewDTO.getLec_idx();
    }

    @PostMapping("/review/modify")
    public String reviewModify(@Valid LectureReviewDTO lectureReviewDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/lecture/view?lec_idx=" + lectureReviewDTO.getLec_idx();
        }

        int result = lectureService.modifyReview(lectureReviewDTO);
        return "redirect:/lecture/view?lec_idx=" + lectureReviewDTO.getLec_idx();
    }

    @RequestMapping(value = "/review/delete", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String reviewDelete(@RequestParam("review_idx") int review_idx) {
        lectureService.deleteReview(review_idx);
      return "ok";
  }

}
