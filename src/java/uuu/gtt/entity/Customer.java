
package uuu.gtt.entity;

import java.time.LocalDate;

public class Customer {

	public static final char MALE = 'M';
	public static final char FEMALE = 'F';

	private String id; // 必要欄位, PKey, [A-Z][12]\\d{8}
	private String name = "";
	private String password; // 6~20英數字符號
	private char gender; // 'M':男, 'F':女
	private String email; // ^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$
	private LocalDate birthday;
	private String address;
	private String phone;

	public Customer() {
	}

	public Customer(String id1, String name1, String password1) {
		this.id = id1;
		this.name = name1;
		this.password = password1;
	}

	public Customer(String id2, String name2, String password2, char gender, String email) {
		this(id2, name2, password2);
		this.gender = gender;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) throws VGBException {
		this.password = password;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) throws VGBException {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) throws VGBException {
		this.email = email;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? phone : phone.trim();
	}

	public int getAge() {
		if (this.getBirthday() != null) {
			int thisYear = LocalDate.now().getYear();
			int age = thisYear - this.getBirthday().getYear();

			return age;

		} else {
			return 0;
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + gender;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		Customer other = (Customer) obj;
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}

		if (!(obj instanceof Customer)) {
			return false;
		}
		if (email == null) {
			if (other.email != null) {
				return false;
			}
		} else if (!email.equals(other.email)) {
			return false;
		}
		return true;
	}

}
