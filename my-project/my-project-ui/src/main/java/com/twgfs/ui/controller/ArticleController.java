package com.twgfs.ui.controller;
import com.alibaba.fastjson.JSON;
import com.twgfs.commons.staticconst.StaticConst;
import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Comment;
import com.twgfs.ui.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
@Controller
@RequestMapping("/article")
public class ArticleController {

    private static final String FILE_UPLOAD_PATH = "static" + File.separator + "upload";

    @Autowired
    private ArticleService articleService;
    /*
    * 数据库查询后在文章的首页显示相关数据
    * */
    @GetMapping("/articlshow")
    public String selectAndShowArticle(Model model) {
        /*
        * 查询中间的文章显示效果
        * */
        List<Article> articles = articleService.SelectArticle();
        model.addAttribute("articlinfo", articles);
        /*
        * 查询右侧边栏的文章显示效果
        * */
        List<Article> articles1 = articleService.SelectArticleRight();
        model.addAttribute("articlinfo1", articles1);
        return "maincontext/maincontext_index";
    }
    /*
    * 分页中查询数据的总条数
    * */
    @ResponseBody
    @PostMapping("/getcount")
    public String getCount(){
        int i = articleService.GetCounts();
        return JSON.toJSONString(i);
    }
    /*
    * 分页查询
    * */
    @ResponseBody
    @RequestMapping("/currenpage")
    public void currenPage(String pagesize,String currentpage,HttpServletResponse response){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        List<Article> articles = articleService.SelectCurrenPage(pagesize, currentpage);
        int i= 0;
        for (Article a:articles) {
            i++;
        }
        try {
            response.getWriter().write(JSON.toJSONString(articles));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
    * 跳转到上传作品
    * */
    @GetMapping("/upload")
    public String toUploadPage() {
        return "upload";
    }
    /*
    * 将上传的数据存放到数据库
    * */
    @RequestMapping("/uploadarticle")
    public String upLoaDarticle(Article article,Model model){
        int i = articleService.addEssay(article);
        //这里的ADD_USER_XXX代表添加文章
        if (i== StaticConst.ADD_USER_SUCCESS){
            model.addAttribute("msg","成功发表文章");
        }else if (i== StaticConst.ADD_USER_FAILED){
            model.addAttribute("msg","发表文章失败，请检查你的网络");
        }else {
            model.addAttribute("msg","标题和第一段不能为空点击我重新发表");
        }
        return "upload";
    }
    /**
     * drop文件的上传
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "upload")
    public Map<String, Object> upload(MultipartFile dropFile, MultipartFile[] editorFiles, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        // Dropzone 上传
        if (dropFile != null) {
            result.put("filePath", write(request, dropFile));
        }
        // wangEditor 上传
        else {
            List<String> filePaths = new ArrayList<>();
            for (MultipartFile editorFile : editorFiles) {
                filePaths.add(write(request, editorFile));
            }
            result.put("errno", 0);
            result.put("data", filePaths);
        }
        return result;
    }

    /**
     * 写文件
     * @param request
     * @param multipartFile
     * @return 文件路径
     */
    private String write(HttpServletRequest request, MultipartFile multipartFile) {
        // 获取上传路径
        String realPath = request.getSession().getServletContext().getRealPath("/");
        String filePath = realPath + FILE_UPLOAD_PATH;

        // 先判断上传路径是否存在
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        // 获取文件名后缀
        String name = multipartFile.getOriginalFilename();
        String suffix = name.substring(name.lastIndexOf("."));
        String filename = UUID.randomUUID().toString().replace("-", "") + suffix;
        File uploadFile = new File(filePath + File.separator + filename);
        try {
            multipartFile.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String fpath = String.format("%s://%s:%s/%s/%s", request.getScheme(), request.getServerName(), request.getServerPort(), FILE_UPLOAD_PATH, filename);
        return fpath;
    }

    /*
    * 查询单个文章的内容
    * */
    @RequestMapping("/selectsinglessay")
    public String getSingleArticle(String essayid,Model model){
        Article article = articleService.SelectSingleArticle(essayid);
        List<Comment> comments = articleService.SelectAllEssay(essayid);
        model.addAttribute("commentslist",comments);
        model.addAttribute("essay",article);
        return "maincontext/maincontext_second_page";
    }
    /*
    * 用户的评论
    * */
    @RequestMapping("/commontmsg")
    @ResponseBody
    public void userCommont(Comment comment, HttpServletResponse response){
        Comment comments = articleService.SaveCommontmsg(comment);
        if (comments != null){
            try {
                String s = JSON.toJSONString(comments);
                response.getWriter().write(s);
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                response.getWriter().write("");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
