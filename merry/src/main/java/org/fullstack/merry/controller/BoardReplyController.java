package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.BoardReplyDTO;
import org.fullstack.merry.service.BoardReplyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
@Log4j2
@Controller
@RequestMapping(value="/board/reply")
@RequiredArgsConstructor
public class BoardReplyController {

    private final BoardReplyServiceIf boardReplyService;

    @ResponseBody
    @PostMapping("/registReply")
    public void replyRegistPOST(@RequestParam(name = "board_idx", defaultValue="0") int board_idx,
                                @RequestParam(name = "reply_comment", defaultValue="") String reply_comment,
                                HttpSession session
                                ) {

        log.info("============================");
        log.info("BbsReplyController >> replyRegistPOST()");

        int member_idx = (int) session.getAttribute("member_idx");
        String reply_writer = (String) session.getAttribute("name");


        BoardReplyDTO boardReplyDTO = BoardReplyDTO.builder()
                .board_idx(board_idx)
                .reply_comment(reply_comment)
                .reply_writer(reply_writer)
                .member_idx(member_idx)
                .build();

        log.info("boardReplyDTO : " + boardReplyDTO.toString());

        int result = boardReplyService.reply_regist(boardReplyDTO);

        log.info("replyResult : " + result);
        log.info("============================");

//        return "redirect:/board/view?board_idx=" + boardReplyDTO.getBoard_idx();
    }


    @ResponseBody
    @PostMapping("/deleteReply")
    public void deleteReply(@RequestParam(name = "reply_idx", defaultValue="0") int reply_idx,
                              @RequestParam(name = "board_idx", defaultValue="0") int board_idx) {

        int result = boardReplyService.deleteReply(reply_idx, reply_idx);
        log.info("deleteform : " + reply_idx +":::" +  reply_idx);
        log.info("deleteReplyResult : " + result);

//        return "redirect:/board/view?board_idx=" + board_idx;
    }


}
