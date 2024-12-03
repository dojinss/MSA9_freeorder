package com.aloha.freeorder.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aloha.freeorder.domain.Notice;

@Mapper
public interface NoticeMapper {

    public List<Notice> list() throws Exception;

    public Notice read(Long id) throws Exception;

    public int insert(Notice notice) throws Exception;

    public int update(Notice notice) throws Exception;

    public int delete(Long id) throws Exception;
    
}
