package model;

import java.util.ArrayList;
/**
 * 리스트 화면에 보여질 게시물 리스트와 <br>
 * 페이징 정보 객체를 저장하는 클래스
 * @author kosta-inst
 *
 */
public class List2VO {
	private ArrayList<MemberVO> list;
	private PagingBean pagingBean;
	public List2VO(ArrayList<MemberVO> list,
		      PagingBean pagingBean){
		this.list=list;
		this.pagingBean=pagingBean;
	}
	public ArrayList<MemberVO> getList() {
		return list;
	}
	public void setList(ArrayList<MemberVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}
