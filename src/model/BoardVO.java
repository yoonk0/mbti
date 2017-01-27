package model;

public class BoardVO {
	private int postNo;
	private String title;
	private String content;
	private String timePosted;
	private String id;
	private MemberVO vo;
	private int page;
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVO(int postNo, String title, String content, String timePosted,
			String id) {
		super();
		this.postNo = postNo;
		this.title = title;
		this.content = content;
		this.timePosted = timePosted;
		this.id = id;
	}
	
	public BoardVO(int postNo, String title, String content, String timePosted,
			MemberVO vo) {
		super();
		this.postNo = postNo;
		this.title = title;
		this.content = content;
		this.timePosted = timePosted;
		this.vo = vo;
	}
	public MemberVO getVo() {
		return vo;
	}
	public void setVo(MemberVO vo) {
		this.vo = vo;
	}
	public BoardVO(int postNo, String title, String content, String timePosted,
			String id, MemberVO vo) {
		super();
		this.postNo = postNo;
		this.title = title;
		this.content = content;
		this.timePosted = timePosted;
		this.id = id;
		this.vo = vo;
	}

	public BoardVO(int postNo, MemberVO vo, String title, String timePosted,
			int page) {
		this.postNo = postNo;
		this.vo = vo;
		this.title = title;
		this.timePosted = timePosted;
		this.page = page;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
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
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "BoardVO [postNo=" + postNo + ", title=" + title + ", content="
				+ content + ", timePosted=" + timePosted + ", id=" + id
				+ ", vo=" + vo + ", page=" + page + "]";
	}


	
	
}
