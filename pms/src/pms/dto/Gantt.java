package pms.dto;

public class Gantt {
	   private int id;
	   private String start_date;
	   private int duration;
	   private String text;
	   private double progress;
	   private int sortorder;
	   private int parent;
	   private boolean open;
	   
	   public Gantt() {
	      super();
	      // TODO Auto-generated constructor stub
	   }
	   
	   public Gantt(int id, String start_date, int duration, String text, double progress, int sortorder, int parent,
	         boolean open) {
	      super();
	      this.id = id;
	      this.start_date = start_date;
	      this.duration = duration;
	      this.text = text;
	      this.progress = progress;
	      this.sortorder = sortorder;
	      this.parent = parent;
	      this.open = open;
	   }

	   public int getId() {
	      return id;
	   }
	   public void setId(int id) {
	      this.id = id;
	   }
	   public String getStart_date() {
	      return start_date;
	   }
	   public void setStart_date(String start_date) {
	      this.start_date = start_date;
	   }
	   public int getDuration() {
	      return duration;
	   }
	   public void setDuration(int duration) {
	      this.duration = duration;
	   }
	   public String getText() {
	      return text;
	   }
	   public void setText(String text) {
	      this.text = text;
	   }
	   public double getProgress() {
	      return progress;
	   }
	   public void setProgress(double progress) {
	      this.progress = progress;
	   }
	   public int getSortorder() {
	      return sortorder;
	   }
	   public void setSortorder(int sortorder) {
	      this.sortorder = sortorder;
	   }
	   public int getParent() {
	      return parent;
	   }
	   public void setParent(int parent) {
	      this.parent = parent;
	   }
	   public boolean isOpen() {
	      return open;
	   }
	   public void setOpen(boolean open) {
	      this.open = open;
	   }
	}