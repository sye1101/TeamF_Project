package dto;

public class Reservation {
	private int id;
	private String name;
	private String phone_number;
	private String date;
	private int people;
	private String personal_requirement;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getPersonal_requirement() {
		return personal_requirement;
	}
	public void setPersonal_requirement(String personal_requirement) {
		this.personal_requirement = personal_requirement;
	}
}
