package com.twgfs.ui.service.impl;

import com.twgfs.domain.entity.Article;
import com.twgfs.ui.dao.SelectByKeywordDao;
import com.twgfs.ui.service.SelectByKeywordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SelectByKeywordServiceImpl implements SelectByKeywordService{

    @Autowired
    private SelectByKeywordDao selectByKeywordDao;
    @Override
    public List<Article> SearchArticle(String keyword) {
        return selectByKeywordDao.SearchArticle(keyword);
    }
}
