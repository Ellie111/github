package testJdbc.bean;

import com.jdbcEntity.anno.filedName;
import com.jdbcEntity.anno.identityKey;
import com.jdbcEntity.anno.tableName;

@tableName(name = "loginInfo")
public class loginInfo {

	@identityKey(name="id")
	private String longinId;
	//@filedName(name = "xxxx")
	private String longinName;
	private String longinPWD;
	private String longinNote;
	public loginInfo() {
		super();
	}
	public loginInfo(String longinName, String longinPWD,String longinNote) {
		super();
		this.longinName = longinName;
		this.longinPWD = longinPWD;
		this.longinNote = longinNote;
	}
	public String getLonginId() {
		return longinId;
	}
	public void setLonginId(String longinId) {
		this.longinId = longinId;
	}
	public String getLonginName() {
		return longinName;
	}
	public void setLonginName(String longinName) {
		this.longinName = longinName;
	}
	public String getLonginPWD() {
		return longinPWD;
	}
	public void setLonginPWD(String longinPWD) {
		this.longinPWD = longinPWD;
	}
	public String getLonginNote() {
		return longinNote;
	}
	public void setLonginNote(String longinNote) {
		this.longinNote = longinNote;
	}
}
