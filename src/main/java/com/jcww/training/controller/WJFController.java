package com.jcww.training.controller;

import com.alibaba.fastjson.JSON;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.jcww.training.config.Config;
import com.jcww.training.pojo.*;
import com.jcww.training.service.WJFService;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@RestController
@RequestMapping("WJF")
public class WJFController {
    @Autowired
    private WJFService wjfService;

    @Resource(name = "TemplateRaliable")
    private RabbitTemplate templateRaliable;

    //员工考试页面，在线考试
    @GetMapping("/getExam/{user}")
    public List<Map<String,Object>> getExam(@PathVariable String user){
        List<Map<String,Object>> list = wjfService.getExam(user);
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11,16);
            String testendtime = map.get("testendtime").toString().substring(11,16);
            map.put("test",teststarttime+"-"+testendtime);
        }
        System.out.println(list);
        return list;
    }

    //员工进入考试
    @RequestMapping("/reduceNum")
    public Boolean reduceNum(@RequestBody Map<String,Integer> map){
        return wjfService.reduceNum(map.get("testId"),map.get("userId"));
    }


    //试卷中单选试题
    @RequestMapping("/danXuan/{testpaperid}")
    public List<Question> danXuan(@PathVariable Integer testpaperid){
        return wjfService.danXuan(testpaperid);
    }


    //试卷中多选试题
    @RequestMapping("/duoXuan/{testpaperid}")
    public List<Question> duoXuan(@PathVariable Integer testpaperid){
        return wjfService.duoXuan(testpaperid);
    }

    //试卷中判断试题
    @RequestMapping("/panDuan/{testpaperid}")
    public List<Question> panDuan(@PathVariable Integer testpaperid){
        return wjfService.panDuan(testpaperid);
    }

    //试卷中填空试题
    @RequestMapping("/tianKong/{testpaperid}")
    public List<Question> tianKong(@PathVariable Integer testpaperid){
        return wjfService.tianKong(testpaperid);
    }


    //试卷中简答试题
    @RequestMapping("/jianDa/{testpaperid}")
    public List<Question> jianDa(@PathVariable Integer testpaperid){
        return wjfService.jianDa(testpaperid);
    }

    //试卷考试的基本信息（试卷名称，总分，题目数量）
    @RequestMapping("/kaoShi/{testpaperid}")
    public Map<String,Object> kaoShi(@PathVariable Integer testpaperid){
        return wjfService.kaoShi(testpaperid);
    }


    //员工答题完成，交卷
    @RequestMapping("/jiaoJuan")
    public String jiaoJuan(@RequestBody Map<String,Object> map){
        try {
            String uuid = UUID.randomUUID().toString();
            Date date = new Date();
            String msg = JSON.toJSONString(map);
            MsgLog msgLog = new MsgLog();
            msgLog.setMsgId(uuid);

            msgLog.setMsg(msg);
            msgLog.setExchange("direct.no.exchange");
            msgLog.setRoutingKey("direct.routing.key.name");
            msgLog.setStatus(-1);
            msgLog.setTryCount(0);
            msgLog.setNextTryTime(date);
            msgLog.setCreateTime(date);
            msgLog.setUpdateTime(date);

            wjfService.save(msgLog);

            Message message = MessageBuilder.withBody(map.toString().getBytes()).setMessageId(uuid).build();

            templateRaliable.convertAndSend(
                    "direct.no.exchange",
                    "direct.routing.key.name",
                    map,
                    new CorrelationData(uuid));
            return "ok";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

    }


    //判卷人，需要批改的试卷
    @RequestMapping("/markPapers")
    public List<Map<String,Object>> markPapers(){
        List<Map<String,Object>> list = wjfService.markPapers();
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11,16);
            String testendtime = map.get("testendtime").toString().substring(11,16);
            map.put("test",teststarttime+"-"+testendtime);
        }
        System.out.println(list);
        return list;
    }

    //批改试卷，考试详情
    @RequestMapping("/paper")
    public List<Map<String,Object>> paper(@RequestBody Map<String,Integer> param){
        List<Map<String,Object>> list = wjfService.paper(param.get("testpaperid"));
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11,16);
            String testendtime = map.get("testendtime").toString().substring(11,16);
            map.put("test",teststarttime+"-"+testendtime);
        }
        System.out.println(list);
        return list;
    }

    //当前考试参与考人员
    @RequestMapping("/testPeople")
    public List<Map<String,Object>> testPeople(@RequestBody Map<String,Integer> param){
        return wjfService.testPeople(param.get("testpaperid"));
    }

    //员工查询批改完成的成绩
    @RequestMapping("/staffData")
    public List<Map<String,Object>> staffData(@RequestBody Map<String,String> user){
        List<Map<String,Object>> list = wjfService.staffData(user.get("user"));
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11,16);
            String testendtime = map.get("testendtime").toString().substring(11,16);
            map.put("test",teststarttime+"-"+testendtime);
        }
        return list;
    }

    //获取员工的答案
    @RequestMapping("/userAnswer")
    public List<Useranswer> userAnswer(@RequestBody Map<String,Integer> user){
        return wjfService.userAnswer(user);
    }


    //判卷人，判卷完成
    @RequestMapping("/panJuan")
    public Boolean panJuan(@RequestBody Map<String,Object> map){
        return wjfService.panJuan(map);
    }

    //判卷人发布成绩
    @RequestMapping("/faBu")
    public Boolean faBu(@RequestBody Map<String,Integer> map){
        return wjfService.faBu(map.get("testpaperid"),map.get("userId"));
    }



    //视频资料库
    @RequestMapping("/findVideo")
    public List<Video> findVideo(@RequestBody Video video){
        List<Video> list=wjfService.findVideo(video);
        return list;
    }


    private String realPath="D:/ideaWorkspace/training/src/main/webapp";
    @RequestMapping("/addVideo")
    @ResponseBody
    public int addVideo(MultipartFile file, MultipartFile file2, Video video) throws IOException {
        /*上传视频*/
        long currTime = System.currentTimeMillis();//获取当前系统时间
        String uniqueName = file.getOriginalFilename();//得到文件名
        String suffix = uniqueName.substring(uniqueName.lastIndexOf(".")+1);//截取文件名
        String newname = uniqueName.substring(0, uniqueName.lastIndexOf("."))+"_"+currTime+"."+suffix; //得到文件路径
        String fpath = "/video/"+ newname;
        String filePath = realPath  + fpath;
        file.transferTo(new File(filePath));
        video.setVideoFile(fpath);

        /*上传图片*/
        String endpoint = "oss-cn-beijing.aliyuncs.com";
        String accessKeyId = "LTAI4GJrQdNFZGRzFPsabhFM";
        String accessKeySecret = "7lREC81kpWrKg9Ufz34KMNRWXcmJA3";
        String bucketName = "wjf-trainging";

        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        InputStream inputStream = null;
        try {
            //获取文件流
            inputStream = file2.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //获取文件名称
        String filename = file2.getOriginalFilename();
        //1.在文件名称中添加随机唯一的值
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        filename = uuid+filename;

        //2.把文件按日期分类
        /*String datePath = new DateTime().toString("yyyy/MM/dd");*/
        filename = "wjf/"+filename;

        //调用OSS方法实现上传
        ossClient.putObject(bucketName, filename, inputStream);
        ossClient.shutdown();

        String url = "https://"+bucketName+"."+endpoint+"/"+filename;
        video.setVideoCover(url);
        int i=wjfService.addVideo(video);
        return i;
    }


    //查看
    @RequestMapping("findById")
    @ResponseBody
    public Video findById(Integer videoId){
        Video video=wjfService.findById(videoId);
        return video;
    }

    @RequestMapping("/updVideo")
    @ResponseBody
    public int updVideo(MultipartFile file,MultipartFile file2, Video video) throws IOException {
        if (file==null && file2!=null){
            /*上传图片*/
            String endpoint = "oss-cn-beijing.aliyuncs.com";
            String accessKeyId = "LTAI4GJrQdNFZGRzFPsabhFM";
            String accessKeySecret = "7lREC81kpWrKg9Ufz34KMNRWXcmJA3";
            String bucketName = "wjf-trainging";

            OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
            InputStream inputStream = null;
            try {
                //获取文件流
                inputStream = file2.getInputStream();
            } catch (IOException e) {
                e.printStackTrace();
            }
            //获取文件名称
            String filename = file2.getOriginalFilename();
            //1.在文件名称中添加随机唯一的值
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            filename = uuid+filename;

            //2.把文件按日期分类
            /*String datePath = new DateTime().toString("yyyy/MM/dd");*/
            filename = "yhy/"+filename;

            //调用OSS方法实现上传
            ossClient.putObject(bucketName, filename, inputStream);
            ossClient.shutdown();

            String url = "https://"+bucketName+"."+endpoint+"/"+filename;
            video.setVideoCover(url);
        }else if(file!=null && file2==null){
            /*上传视频*/
            long currTime = System.currentTimeMillis();//获取当前系统时间
            String uniqueName = file.getOriginalFilename();//得到文件名
            String suffix = uniqueName.substring(uniqueName.lastIndexOf(".")+1);//截取文件名
            String newname = uniqueName.substring(0, uniqueName.lastIndexOf("."))+"_"+currTime+"."+suffix; //得到文件路径
            String fpath = "/video/"+ newname;
            String filePath = realPath  + fpath;
            file.transferTo(new File(filePath));
            video.setVideoFile(fpath);
        }else {
            /*上传视频*/
            long currTime = System.currentTimeMillis();//获取当前系统时间
            String uniqueName = file.getOriginalFilename();//得到文件名
            String suffix = uniqueName.substring(uniqueName.lastIndexOf(".") + 1);//截取文件名
            String newname = uniqueName.substring(0, uniqueName.lastIndexOf(".")) + "_" + currTime + "." + suffix; //得到文件路径
            String fpath = "/video/" + newname;
            String filePath = realPath + fpath;
            file.transferTo(new File(filePath));
            video.setVideoFile(fpath);

            /*上传图片*/
            String endpoint = "oss-cn-beijing.aliyuncs.com";
            String accessKeyId = "LTAI4GJrQdNFZGRzFPsabhFM";
            String accessKeySecret = "7lREC81kpWrKg9Ufz34KMNRWXcmJA3";
            String bucketName = "wjf-trainging";

            OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
            InputStream inputStream = null;
            try {
                //获取文件流
                inputStream = file2.getInputStream();
            } catch (IOException e) {
                e.printStackTrace();
            }
            //获取文件名称
            String filename = file2.getOriginalFilename();
            //1.在文件名称中添加随机唯一的值
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            filename = uuid + filename;

            //2.把文件按日期分类
            /*String datePath = new DateTime().toString("yyyy/MM/dd");*/
            filename = "yhy/" + filename;

            //调用OSS方法实现上传
            ossClient.putObject(bucketName, filename, inputStream);
            ossClient.shutdown();

            String url = "https://" + bucketName + "." + endpoint + "/" + filename;
            video.setVideoCover(url);
        }
        int i=wjfService.updVideo(video);
        return i;
    }

    @RequestMapping("delVideo")
    @ResponseBody
    public int delVideo(Integer videoId){
        int i=wjfService.delVideo(videoId);
        return i;
    }

}
