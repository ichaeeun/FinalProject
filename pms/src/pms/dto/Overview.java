package pms.dto;

public class Overview {
	private String pno;
	private String name;	
	private int task_done;
	private int task_tot;
	private int progress;
	public Overview() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Overview(String pno, String name, int task_done, int task_tot) {
		super();
		this.pno = pno;
		this.name = name;
		this.task_done = task_done;
		this.task_tot = task_tot;
	}

	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTask_done() {
		return task_done;
	}
	public void setTask_done(int progress) {
		this.task_done = progress;
	}
	public int getTask_tot() {
		return task_tot;
	}
	public void setTask_tot(int task_tot) {
		this.task_tot = task_tot;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

}
