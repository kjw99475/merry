package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
import org.fullstack.merry.dto.NoticeDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.service.NoticeServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value="/notice")
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeServiceIf noticeServiceIf;

    //    ===================== notice start ==============================
    @GetMapping("/list")
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

    @GetMapping("/view")
    public void GETnoticeView(@RequestParam(name="notice_idx") int notice_idx,
                              Model model
    ) {
        NoticeDTO noticeDTO = noticeServiceIf.view(notice_idx);
        model.addAttribute("noticeDTO", noticeDTO);
        log.info("noticeDTO >> " + noticeDTO);
    }

    @GetMapping("/download")
    public void downloadNotice(int notice_idx,
                               HttpServletResponse resp,
                               HttpServletRequest req
    ) {
        NoticeDTO noticeDTO = noticeServiceIf.view(notice_idx);

        FileUploadUtil.download(req, resp, noticeDTO.getNotice_org_file_name(), noticeDTO.getNotice_save_file_name(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
    }

    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String NoticedeleteFilePOST(@RequestParam int notice_idx) {
        NoticeDTO noticeDTO = noticeServiceIf.view(notice_idx);
        log.info("noticeDTO >>> " + noticeDTO.getNotice_save_file_name());
        FileUploadUtil.deleteFile(noticeDTO.getNotice_save_file_name(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
        noticeDTO.setNotice_org_file_name("");
        noticeDTO.setNotice_save_file_name("");
        noticeServiceIf.modify(noticeDTO);
        log.info("noticeDTO >>> " + noticeDTO.getNotice_save_file_name());
        return "ok";
    }


    @GetMapping("/regist")
    public void GETnoticeRegist(
    ) {

    }

    @PostMapping("/regist")
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

            return "redirect:/notice/regist";
        }
        String saveFileName = "";
        if(multipartFile!= null && !multipartFile.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(multipartFile, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
            noticeDTO.setNotice_org_file_name(multipartFile.getOriginalFilename());
            noticeDTO.setNotice_save_file_name(saveFileName);
        }

        int result = noticeServiceIf.regist(noticeDTO);

        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/notice/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/notice/regist";
        }
    }

    @GetMapping("/modify")
    public void GETnoticeModify(@RequestParam(name="notice_idx") int notice_idx,
                                Model model
    ) {
        NoticeDTO noticeDTO = noticeServiceIf.view(notice_idx);
        model.addAttribute("noticeDTO", noticeDTO);
        log.info("noticeDTO >> " + noticeDTO);
    }

    @PostMapping("/modify")
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

            return "redirect:/notice/modify?notice_idx=" + noticeDTO.getNotice_idx();
        }
        String saveFileName = "";

        if(file!= null && !file.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(file, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
            noticeDTO.setNotice_org_file_name(file.getOriginalFilename());
            noticeDTO.setNotice_save_file_name(saveFileName);
            FileUploadUtil.deleteFile(upload2, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
        } else {
            noticeDTO.setNotice_org_file_name(upload);
            noticeDTO.setNotice_save_file_name(upload2);
        }

        int result = noticeServiceIf.modify(noticeDTO);

        if(result > 0) {
            log.info("수정 성공 ===============");
            return "redirect:/notice/view?notice_idx=" + noticeDTO.getNotice_idx();
        } else {
            log.info("수정 실패 ===============");
            return "redirect:/notice/modify?notice_idx=" + noticeDTO.getNotice_idx();
        }
    }

    @PostMapping("/delete")
    public String POSTnoticeDelete(int notice_idx) {
        int result = noticeServiceIf.delete(notice_idx);
        if(result > 0) {
            log.info("삭제 성공 ===============");
            return "redirect:/notice/list";
        }
        else {
            log.info("삭제 실패 ===============");
            return "redirect:/notice/view?notice_idx=" + notice_idx;
        }
    }
    //    ===================== notice end ==============================
}
