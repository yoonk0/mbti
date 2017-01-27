package controller;

import java.util.HashMap;

public class ModelAndView {
	private String viewName;
	private HashMap<String,Object> map=new HashMap<String,Object>();
	public ModelAndView() {
		super();		
	}
	public ModelAndView(String viewName) {
		super();
		this.viewName = viewName;
	}
	public ModelAndView(String viewName, HashMap<String, Object> map) {
		super();
		this.viewName = viewName;
		this.map = map;
	}
	public ModelAndView(String viewName,
			String attributeName,Object attributeValue){
		this.viewName=viewName;
		this.map.put(attributeName, attributeValue);
	}
	public void addObject(String attributeName,Object attributeValue){
		this.map.put(attributeName, attributeValue);
	}
	public String getViewName() {
		return viewName;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public HashMap<String, Object> getMap() {
		return map;
	}
	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}
	
	@Override
	public String toString() {
		return "ModelAndView [viewName=" + viewName + ", map=" + map + "]";
	}
	
}
