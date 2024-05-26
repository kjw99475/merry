package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.mapper.MypageMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageServiceIf{
    private final MypageMapper mypageMapper;
    private final ModelMapper modelMapper;

    @Override
    public void addcart(String member_id, int lecIdx) {
        mypageMapper.addcart(member_id, lecIdx);
    }

    @Override
    public void addzzim(String member_id, int lecIdx) {
        mypageMapper.addzzim(member_id, lecIdx);
    }

    @Override
    public void deleteCart(String member_id, int LecIdx) {
        mypageMapper.deleteCart(member_id, LecIdx);
    }

    @Override
    public void deletezzim(String member_id, int LecIdx) {
        mypageMapper.deletezzim(member_id, LecIdx);
    }
}
