package com.xkw.mc.web.handler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xkw.mc.entity.Video;
import com.xkw.mc.service.VideoService;

@Controller
@RequestMapping(value="/video")
public class VideoHandler {

	@Autowired
	private VideoService videoService;
	
	@RequestMapping(value="/videoList")
	public String toUpList(Map<String, Object> map){
		List<Video> video = videoService.getAll();
		map.put("videos", video);
//		List<Video> video = videoService.getAll();
		return "video/videoList";
	}
	
	@RequestMapping(value="/toBoFang")
	public String toBoFang(@RequestParam("id") Integer id,  Map<String, Object> map){
		Video video = videoService.getById(id);
		map.put("video", video);
//		List<Video> video = videoService.getAll();
		return "video/video";
	}
	
}
