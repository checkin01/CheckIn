package utility;

import java.io.UnsupportedEncodingException;

public class Encoding {
	//methoid �ѱ��� iso-8859-1 code�� ��Ʈ��ũ�� ���ؼ� ���۵�
	//iso-8859-1 -> utf-8
	public static String toKor(String str) {
		String encode = "";
		try {
			encode = new String(str.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encode;
	}
}
