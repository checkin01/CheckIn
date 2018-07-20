package utility;

import java.io.UnsupportedEncodingException;

public class Encoding {
	//methoid 한글은 iso-8859-1 code로 네트워크를 통해서 전송됨
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
