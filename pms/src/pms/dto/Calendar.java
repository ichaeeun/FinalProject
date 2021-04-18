package pms.dto;

import java.util.Date;
//	springweb.z03_vo.Calendar
public class Calendar {
	private int id;
	private int groupId;
	private String title;
	private String writer;
	private String content;
	private String start;
	private String end;
	private boolean allDay;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calendar(int id, int groupId, String title, String writer, String content, String start, String end, boolean allDay,
			String textColor, String backgroundColor, String borderColor) {
		super();
		this.id = id;
		this.groupId = groupId;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.start = start;
		this.end = end;
		this.allDay = allDay;
		this.textColor = textColor;
		this.backgroundColor = backgroundColor;
		this.borderColor = borderColor;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	/*
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	*/
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	
}
