package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
import org.fullstack.merry.dto.InfoDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.service.InfoServiceIf;
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
@RequestMapping(value="/info")
@RequiredArgsConstructor
public class InfoController {
    private final InfoServiceIf infoServiceIf;

    //    ===================== info start ==============================
    @GetMapping("/list")
    public void GETinfoList(@Valid PageRequestDTO pageRequestDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {
        if(bindingResult.hasErrors()){
            log.info("infoController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_block_size(10);
        pageRequestDTO.setType2("0");
        PageResponseDTO<InfoDTO> responseDTO = infoServiceIf.ListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/view")
    public void GETinfoView(@RequestParam(name="info_idx") int info_idx,
                            Model model
    ) {
        InfoDTO infoDTO = infoServiceIf.view(info_idx);
        model.addAttribute("infoDTO", infoDTO);
        log.info("infoDTO >> " + infoDTO);
    }

    @GetMapping("/download")
    public void downloadInfo(int info_idx,
                             HttpServletResponse resp,
                             HttpServletRequest req
    ) {
        InfoDTO infoDTO = infoServiceIf.view(info_idx);

        FileUploadUtil.download(req, resp, infoDTO.getInfo_org_file_name(), infoDTO.getInfo_save_file_name(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
    }

    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String InfodeleteFilePOST(@RequestParam int info_idx) {
        InfoDTO infoDTO = infoServiceIf.view(info_idx);
        log.info("infoDTO >>> " + infoDTO.getInfo_save_file_name());
        FileUploadUtil.deleteFile(infoDTO.getInfo_save_file_name(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
        infoDTO.setInfo_org_file_name("");
        infoDTO.setInfo_save_file_name("");
        infoServiceIf.modify(infoDTO);
        log.info("infoDTO >>> " + infoDTO.getInfo_save_file_name());
        return "ok";
    }


    @GetMapping("/regist")
    public void GETinfoRegist(
    ) {

    }

    @PostMapping("/regist")
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

            return "redirect:/info/regist";
        }
        String saveFileName = "";
        if(multipartFile!= null && !multipartFile.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(multipartFile, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
            infoDTO.setInfo_org_file_name(multipartFile.getOriginalFilename());
            infoDTO.setInfo_save_file_name(saveFileName);
        }

        int result = infoServiceIf.regist(infoDTO);

        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/info/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/info/regist";
        }
    }

    @GetMapping("/modify")
    public void GETinfoModify(@RequestParam(name="info_idx") int info_idx,
                              Model model
    ) {
        InfoDTO infoDTO = infoServiceIf.view(info_idx);
        model.addAttribute("infoDTO", infoDTO);
        log.info("infoDTO >> " + infoDTO);
    }

    @PostMapping("/modify")
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

            return "redirect:/info/modify?info_idx=" + infoDTO.getInfo_idx();
        }
        String saveFileName = "";

        if(file!= null && !file.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(file, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
            infoDTO.setInfo_org_file_name(file.getOriginalFilename());
            infoDTO.setInfo_save_file_name(saveFileName);
            FileUploadUtil.deleteFile(upload2, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\bbs");
        } else {
            infoDTO.setInfo_org_file_name(upload);
            infoDTO.setInfo_save_file_name(upload2);
        }

        int result = infoServiceIf.modify(infoDTO);

        if(result > 0) {
            log.info("수정 성공 ===============");
            return "redirect:/info/view?info_idx=" + infoDTO.getInfo_idx();
        } else {
            log.info("수정 실패 ===============");
            return "redirect:/info/modify?info_idx=" + infoDTO.getInfo_idx();
        }
    }

    @PostMapping("/info/delete")
    public String POSTinfoDelete(int info_idx) {
        int result = infoServiceIf.delete(info_idx);
        if(result > 0) {
            log.info("삭제 성공 ===============");
            return "redirect:/info/list";
        }
        else {
            log.info("삭제 실패 ===============");
            return "redirect:/info/view?info_idx=" + info_idx;
        }
    }
    //    ===================== info end ==============================
}
