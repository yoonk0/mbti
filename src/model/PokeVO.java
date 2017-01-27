package model;

public class PokeVO {
	private int pokeNo;
	private String seId;
	private String reId;
	private int confirm;
	private MemberVO memberVO;
	public PokeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PokeVO(int pokeNo, String seId, String reId, int confirm) {
		super();
		this.pokeNo = pokeNo;
		this.seId = seId;
		this.reId = reId;
		this.confirm = confirm;
	}
	public PokeVO(int pokeNo, String seId, String reId, int confirm,
			MemberVO memberVO) {
		super();
		this.pokeNo = pokeNo;
		this.seId = seId;
		this.reId = reId;
		this.confirm = confirm;
		this.memberVO = memberVO;
	}
	public PokeVO(int pokeNo, int confirm, MemberVO memberVO) {
		super();
		this.pokeNo = pokeNo;
		this.confirm = confirm;
		this.memberVO = memberVO;
	}
	
	
	public int getPokeNo() {
		return pokeNo;
	}
	public void setPokeNo(int pokeNo) {
		this.pokeNo = pokeNo;
	}
	public String getSeId() {
		return seId;
	}
	public void setSeId(String seId) {
		this.seId = seId;
	}
	public String getReId() {
		return reId;
	}
	public void setReId(String reId) {
		this.reId = reId;
	}
	public int getConfirm() {
		return confirm;
	}
	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "PokeVO [pokeNo=" + pokeNo + ", seId=" + seId + ", reId=" + reId
				+ ", confirm=" + confirm + ", memberVO=" + memberVO + "]";
	}
}
