package tw.sure.model.news;

public class News {
	
	private Integer id;
	private String date;
	private String title;
	private String content;
	
	public News() {
		
	}
	
	public News(Integer id, String date, String title, String content) {
		super();
		this.id = id;
		this.date = date;
		this.title = title;
		this.content = content;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", date=" + date + ", title=" + title + ", content=" + content + "]";
	}
	
	
}
