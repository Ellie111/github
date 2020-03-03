package com.jdbcEntity.query;

import java.util.HashMap;
import java.util.Map;

public class Update {
	
	private Map<String, String> updateMap = new HashMap<String, String>();

	public Update() {

	}

	public Update(String key, String value) {
		this.put(key, value);
	}

	public void put(String key, String value) {
		this.updateMap.put(key, value);
	}

	public static void update(String key, String value) {
		new Update(key, value);
	}
	
	public String getUpdateMap(Update update){
		if(update.updateMap.size() != 0){
			String temp = "";
			for(Map.Entry<String, String> entry : update.updateMap.entrySet()){
				temp += entry.getKey() + "=" + entry.getValue() + ",";
			}
			return temp.substring(0,temp.length()-1);
		}
		return null;
	}
}
