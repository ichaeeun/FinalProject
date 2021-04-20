package pms.dto;

import java.util.Date;
//	springweb.z03_vo.Calendar
public class Calendar {
	private int id;
	private int groupId;
	private String title;
	private String holder;
	private String content;
	private String start;
	private String end;
	private int priority;
	private boolean allDay;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	private String parent;
	
	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calendar(int id, int groupId, String parent, String title, String holder, String content, String start, String end,
			int priority, boolean allDay, String textColor, String backgroundColor, String borderColor) {
		super();
		this.id = id;
		this.groupId = groupId;
		this.parent = parent;
		this.title = title;
		this.holder = holder;
		this.content = content;
		this.start = start;
		this.end = end;
		this.priority = priority;
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

	public String getHolder() {
		return holder;
	}

	public void setHolder(String holder) {
		this.holder = holder;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

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
}
