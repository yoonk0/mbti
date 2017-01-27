package model;

public class MemberVO {
	private String id;
	private String password;
	private String gender;
	private int age;
	private String location;
	private String job;
	private int height;
	private String hobby;
	private int admin;
	private String picture;
	private String mbti;
	private String kakao;
	private int page; 
	
	public MemberVO(String id, String password, String gender, int age,
			String location, String job, int height, String hobby, int admin,
			String picture, String mbti, String kakao, int page) {
		super();
		this.id = id;
		this.password = password;
		this.gender = gender;
		this.age = age;
		this.location = location;
		this.job = job;
		this.height = height;
		this.hobby = hobby;
		this.admin = admin;
		this.picture = picture;
		this.mbti = mbti;
		this.kakao = kakao;
		this.page = page; 
	}
	public MemberVO(int age, String location, String job, int height,
			String hobby, String mbti, int page) {
		super();
		this.age = age;
		this.location = location;
		this.job = job;
		this.height = height;
		this.hobby = hobby;
		this.mbti = mbti;
		this.page = page; 
	}
	
	public MemberVO(String id, int age, String location, String picture,
			String mbti, int page, String gender, String hobby, String job, int height) {
		super();
		this.id = id;
		this.age = age;
		this.location = location;
		this.picture = picture;
		this.mbti = mbti;
		this.page = page; 
		this.gender = gender; 
		this.hobby = hobby;
		this.job = job;
		this.height = height; 
	}
	public MemberVO(String id, String password, String gender, int age,
			String location, String job, int height, String hobby,
			int admin, String picture, String mbti, String kakao) {
		super();
		this.id = id;
		this.password = password;
		this.gender = gender;
		this.age = age;
		this.location = location;
		this.job = job;
		this.height = height;
		this.hobby = hobby;
		this.admin = admin;
		this.picture = picture;
		this.mbti = mbti;
		this.kakao = kakao;
	}
	public MemberVO(String id, String password, String gender, int age,
			String location, String job, int height, String hobby,
			 String picture, String mbti, String kakao) {
		super();
		this.id = id;
		this.password = password;
		this.gender = gender;
		this.age = age;
		this.location = location;
		this.job = job;
		this.height = height;
		this.hobby = hobby;
		this.picture = picture;
		this.mbti = mbti;
		this.kakao = kakao;
	}

	public MemberVO(String kakao) {
		super();
		this.kakao = kakao;
	}


	public MemberVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public MemberVO() {
		super();
	}

	public MemberVO(String id, String password, int admin) {
		super();
		this.id = id;
		this.password = password;
		this.admin = admin;
	}

	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", gender="
				+ gender + ", age=" + age + ", location=" + location + ", job="
				+ job + ", height=" + height + ", hobby=" + hobby + ", admin="
				+ admin + ", picture=" + picture + ", mbti=" + mbti
				+ ", kakao=" + kakao + ", page=" + page + "]";
	}

}
