package com.xkw.mc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="t_video")
public class Video extends SuperEntity{

	private static final long serialVersionUID = -2614767322183671409L;
	/**
	 * 上传文件的影视名称
	 */
	@Column(name="v_name", nullable=false, columnDefinition="varchar(100) COMMENT '影视名称'")
	private String videoName;
	/**
	 * 文件存放的路径地址
	 */
	@Column(name="v_path", nullable=false, columnDefinition="varchar(30) COMMENT '存放的文件路径'")
	private String videoPath;
	/**
	 * 缩略图存放的路径地址
	 */
	@Column(name="p_path", nullable=false, columnDefinition="varchar(300) COMMENT '缩略图文件路径'")
	private String photoPath;
	
//	@Column(name="v_moviesName", nullable=false, columnDefinition="varchar(100) COMMENT '影视名称'")
//	private String moviesName;
	/**
	 * 上传的时间
	 */
	@Column(name="f_createTime", nullable=false, columnDefinition="bigint(20) COMMENT '上传时间'")
	private Long createTime;
	
	/**
	 * 使用状态
	 * 0表示可用
	 * 1表示不可用
	 */
	@Column(name="f_status", columnDefinition="int(3) DEFAULT 0 COMMENT '状态'")
	private Integer status;

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public Long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	
	
}
