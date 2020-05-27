package com.spring.crud.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	/* 테이블 구조
	board_num number primary key,
	board_writer varchar2(50) not null,
	board_title varchar2(500) not null,
	board_content varchar2(2000) not null,
	board_regdate date default sysdate);
	*/
	
	private int board_num;
	private String board_writer;
	private String board_title;
	private String board_content;
	private String board_regdate;
	private int board_history;
	private int board_recommendation;
	private String board_file1;
	private String board_file2;
	private String board_image;
	private MultipartFile file1;   //첨부파일1
	private MultipartFile file2;   //첨부파일2
	private MultipartFile file3;   //이미지파일
	
	
	
	public String getBoard_file1() {
		return board_file1;
	}
	public void setBoard_file1(String board_file1) {
		this.board_file1 = board_file1;
	}
	public String getBoard_file2() {
		return board_file2;
	}
	public void setBoard_file2(String board_file2) {
		this.board_file2 = board_file2;
	}
	public String getBoard_image() {
		return board_image;
	}
	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	
	public int getBoard_history() {
		return board_history;
	}
	public void setBoard_history(int board_history) {
		this.board_history = board_history;
	}
	public int getBoard_recommendation() {
		return board_recommendation;
	}
	public void setBoard_recommendation(int board_recommendation) {
		this.board_recommendation = board_recommendation;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}
	
	
}
