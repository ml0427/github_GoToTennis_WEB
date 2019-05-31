/**
 * Copyright (c) 2018 ProMeritage Information Co., Ltd.
 * All Rights Reserved.
 *
 * This software is the confidential and proprietary information of 
 * ProMeritage Information Co., Ltd. ("Confidential Information"). 
 * 
 * You shall not disclose such Confidential Information and shall use it 
 * only in accordance with the terms of license agreement you entered
 * into with ProMeritage Information Co., Ltd.
 */

package uuu.gtt.service;

import java.time.DateTimeException;
import java.time.LocalDate;

import uuu.gtt.entity.VGBException;

public class VerifyService {

	public static void verifyAll(String birthday, String password, String email, String id) throws VGBException {
		verifyBirthday(birthday);
		verifyEmail(email);
		verifyId(id);
		verifyPassword(password);
	}

	/**
	 * 驗證生日
	 * 
	 * @param birthday
	 * @return
	 * @throws VGBException
	 */
	public static boolean verifyBirthday(String birthday) throws VGBException {

		try {
			if (birthday == null || birthday.length() == 0) {
				throw new VGBException("必須輸入客戶生日");
			}
			LocalDate birthdayLd = LocalDate.parse(birthday);
			if (birthdayLd.isAfter(LocalDate.now())) {
				throw new VGBException("客戶生日必須有值且小於今天");
			}
			return true;
		} catch (DateTimeException ex) {
			throw new VGBException("客戶生日格式錯誤, 必須符合iso 8601: yyyy-MM-dd");
		}
	}

	/**
	 * 驗證密碼
	 * 
	 * @param password
	 * @return
	 * @throws VGBException
	 */
	public static boolean verifyPassword(String password) throws VGBException {

		if (password == null || password.length() < 6 || password.length() > 20) {
			throw new VGBException("客戶密碼長度必須有6~20個字元");
		}
		return true;
	}

	/**
	 * 驗證Email
	 * 
	 * @param email
	 * @return
	 * @throws VGBException
	 */
	public static boolean verifyEmail(String email) throws VGBException {
		if (email == null || !(email = email.trim()).matches("[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}")) {
			throw new VGBException("客戶Email必須有值並符合格式(xxxxx@xxx.xxx[.xxx])");
		}
		return true;
	}

	/**
	 * 驗證身分證格式
	 * 
	 * @param id
	 * @return
	 * @throws VGBException
	 */
	public static boolean verifyId(String id) throws VGBException {

		if (id == null || id.length() != 10) {
			throw new VGBException("身分證號格式不正確");
		}
		char lastChar = generateIdLastChar(id.substring(0, 9));
		if (!id.matches("^[A-Z][12]\\d{8}$") || lastChar != id.charAt(9)) {
			throw new VGBException("身分證號驗證失敗");
		}
		return true;

	}

	/**
	 * generateIdLastChar 取得身分證第一個字的字碼
	 * 
	 * @param id9
	 * @return
	 */
	public static char generateIdLastChar(String id9) {
		// 判斷第一個字元為A~Z
		char firstChar = id9.charAt(0);
		int firstNumber = 0;

		if (firstChar >= 'A' && firstChar <= 'Z') {
			if (firstChar >= 'A' && firstChar <= 'H') {
				firstNumber = (firstChar - 'A' + 10);
			} else if (firstChar >= 'J' && firstChar <= 'N') {
				firstNumber = (firstChar - 'J' + 18);
			} else if (firstChar >= 'P' && firstChar <= 'V') {
				firstNumber = (firstChar - 'P' + 23);
			} else {
				switch (firstChar) {
				case 'I':
					firstNumber = 34;
					break;
				case 'O':
					firstNumber = 35;
					break;
				case 'W':
					firstNumber = 32;
					break;
				case 'X':
					firstNumber = 30;
					break;
				case 'Y':
					firstNumber = 31;
					break;
				case 'Z':
					firstNumber = 33;
					break;
				default:
					assert false : "身分證號出現不正確的首碼:" + firstChar;
				}
			}
		}
		int sum = (firstNumber / 10) + (firstNumber % 10 * 9);

		for (int i = 1, j = 8; i < 9; i++, j--) {
			sum += (id9.charAt(i) - '0') * (i < 9 ? j : 1);
		}
		char lastChar = (char) ((10 - (sum % 10)) % 10 + '0');
		assert lastChar >= '0' && lastChar <= '9' : "身分證號出現不正確的尾碼 " + lastChar;

		return lastChar;
	}

}
