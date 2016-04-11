package com.xkw.mc.web.handler;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.csource.common.MyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xkw.mc.entity.Video;
import com.xkw.mc.service.VideoService;
import com.xkw.utils.Const;
import com.xkw.utils.FastDfsUtils;
import com.xkw.utils.FileUtil;

@Controller
@RequestMapping(value="/upLoad")
public class UpLoadHandler {
	@Autowired
	private VideoService videoService;

	@RequestMapping(value="/toUpList")
	public String toUpList(Map<String, Object> map){
		List<Video> video = videoService.getAll();
		map.put("videos", video);
//		List<Video> video = videoService.getAll();
		return "source/upLoad";
	}
	
	@RequestMapping(value="/toUpLoad", method={RequestMethod.POST})
	public String toUpLoad(@RequestParam MultipartFile fileVideo, String fileName){
		String filename = fileVideo.getOriginalFilename();
		System.out.println("---------------->"+filename);
		String extName = filename.substring(filename.lastIndexOf(".")+1);
		String path = null;
		try {
			path = FastDfsUtils.upload(fileVideo.getInputStream(), extName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("---------------->"+path);
		if(StringUtils.isNotEmpty(path)){
			Video video = new Video();
			video.setVideoName(fileName);
//			video.setVideoPath(path);
			video.setPhotoPath(path);
			
			video.setStatus(0);
			video.setCreateTime(System.currentTimeMillis());
			videoService.save(video);
		}
		
		return "redirect:/source/upLoad";
	}
	
	
	
	
}
