package com.aloha.freeorder.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.aloha.freeorder.domain.Option;
import com.aloha.freeorder.domain.OptionItem;

@Mapper
public interface OptionMapper {

    public List<Option> list() throws Exception;
    // 옵션 정보
    public Option read(String id) throws Exception;
    // 옵션 아이템 정보
    public OptionItem readItem(String id) throws Exception;

    public int insert(Option option) throws Exception;
    
    public int insertItem(OptionItem optionItem) throws Exception;

    public int update(Option option) throws Exception;

    public int delete(String id) throws Exception;

    public int deleteItem(String optionsId) throws Exception;

    public Option getOptionsByProductId(@Param("productId") String productId) throws Exception;

    // 새로운 메서드 추가
    public List<OptionItem> findItemsByOptionId(@Param("optionId") String optionId) throws Exception;
}
