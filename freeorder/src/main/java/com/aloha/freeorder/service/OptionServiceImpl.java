package com.aloha.freeorder.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aloha.freeorder.domain.Option;
import com.aloha.freeorder.mapper.OptionMapper;

@Service
public class OptionServiceImpl implements OptionService{

    @Autowired
    private OptionMapper optionMapper;

    @Override
    public List<Option> list() throws Exception {
        List<Option> optionList = optionMapper.list();
        return optionList;
    }

    @Override
    public Option read(String id) throws Exception {
        Option option = optionMapper.read(id);
        return option;
    }

    @Override
    public int insert(Option option) throws Exception {
        option.setId(UUID.randomUUID().toString());
        int result = optionMapper.insert(option);
        return result;
    }

    @Override
    public int update(Option option) throws Exception {
        int result = optionMapper.update(option);
        return result;
    }

    @Override
    public int delete(String id) throws Exception {
        int result = optionMapper.delete(id);
        return result;
    }    
    
}