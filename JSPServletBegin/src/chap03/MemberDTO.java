package chap03;

import java.util.Calendar;
import java.util.Date;

public class MemberDTO {

	private String name;	// 성명
	private String jubun;	// 주민번호

	public MemberDTO() { }	// 기본 생성자
	
	public MemberDTO(String name, String jubun) {
		this.name = name;
		this.jubun = jubun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getJubun() {
		return jubun;
	}
	public void setJubun(String jubun) {
		this.jubun = jubun;
	}
	
	public String getGender(){
		if(jubun.substring(6,7).equals("1")||jubun.substring(6,7).equals("3")){
			return "남자";
		}
		else{
			return "여자";
		}
	}
	
	public int getAge(){
		int result = 0;

		int year = Calendar.getInstance().get(Calendar.YEAR);
		if(jubun.substring(6,7).equals("3")||jubun.substring(6,7).equals("4")){
			String str = "20"+jubun.substring(0,2);
			result = year - Integer.parseInt(str);
			result = result + 1;
			return result;
		}
		else{
			String str = "19"+jubun.substring(0, 2);
			result = year - Integer.parseInt(str);
			result = result + 1;
			return result;
		}
	}	
}
