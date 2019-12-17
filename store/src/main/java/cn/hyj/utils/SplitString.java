package cn.hyj.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 分割字符串
 *
 * @author Administrator
 *
 */
public final class SplitString {

	private static final String regEx = "[\u4e00-\u9fa5]"; // 是否包含中文的正则表达式

	private static final Pattern pattern = Pattern.compile(regEx);// 将给定的正则表达式编译成模式

	private SplitString() {
	}

	/**
	 * 分割字符串为数组
	 *
	 * @param imgString
	 * @return
	 */
	public static String[] splitString(String imgString) {
		String str[] = imgString.trim().split(",");
		return str;
	}

	/**
	 * 分割字符串为集合
	 *
	 * @return
	 */
	public static List<String> splitStringToList(String imgString) {
		String str[] = splitString(imgString.trim());
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < str.length; i++) {
			list.add(str[i]);
		}
		return list;
	}

	/**
	 * 分割字符串为数字类型的集合
	 * @param price 价格区间
	 * @return
	 */
	public static List<Integer> splitString2IntegerList(String price)
	{
		String str[]=price.trim().split("and");

		List<Integer> integers=new ArrayList<Integer>();

		for (int i=0;i<str.length;i++){
			integers.add(Integer.parseInt(str[i].trim()));
		}
		return integers;
	}

	/**
	 * 分割路径//
	 *
	 * @param path
	 * @return 分割好的不带 //的文件名
	 */
	public static String subPath(String path, String type) {
		if (path.contains("/")) {
			int index = path.lastIndexOf("/");// 去除本地路径:D:/....
			path = path.substring(index);
		}
		path = filterChinese(path);// 过滤字符串
		if ("upload".equalsIgnoreCase(type.trim()))// 如果为文件上传
		{
			// -------------------------------------------->
		} else if ("jdbc".equalsIgnoreCase(type.trim()))// 如果为数据库更新
		{
			path = "http://localhost:8080/store/userHeadPortrait" + path;
		}
		return path;
	}

	/**
	 * 校验文件路径是否包含中文
	 *
	 * @param path
	 *            文件路径
	 * @return true ： 包含 false ：不包含
	 */
	public static Boolean isContainsChinese(String path) {
		Matcher matcher = pattern.matcher(path);// 创建匹配给定输入与此模式的匹配器(使正则表达式生效)
		Boolean flag = false;
		if (matcher.find())// 如果包含中文(符合[pattern])则为true
		{
			flag = true;
		}
		return flag;
	}

	/**
	 * 过滤中文
	 *
	 * @return 不包含中文的 路径
	 */
	public static String filterChinese(String path) {
		String result = path;// 返回最终结果（不带中文的那种）

		if (isContainsChinese(path)) {// 如果包含中文
			StringBuffer buffer = new StringBuffer();// 用于拼接过滤后的字符字符
			char charArray[] = path.toCharArray();// 将路径转换为char[]数组
			for (int i = 0; i < charArray.length; i++) {
				if (!isChinese(charArray[i])) {
					buffer.append(charArray[i]);// 不是中文字符则拼接成字符串
				}
			}
			result = buffer.toString();// 将最终结果赋值给result

		}
		return result;// 返回不带中文的字符串
	}

	/**
	 * 校验字符是否是汉字
	 *
	 * @param c
	 *            被校验的字符
	 * @return true ：中文 false ：不是
	 */
	public static boolean isChinese(char c) {
		Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);// 茅陋聦猫炉聛莽聽聛盲赂聤忙聵戮莽陇潞氓掳聫莽聜鹿
		/*******************
		 * 盲潞搂莽聰聼0~30盲鹿聥茅聴麓莽職聞茅職聫忙聹潞氓录搂氓潞娄
		 ********************/
		if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
				|| ub == Character.UnicodeBlock.GENERAL_PUNCTUATION
				|| ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION
				|| ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
			return true;
		}
		return false;
	}
	/**
	 * MD5签名
	 * @param text
	 * @return
	 */
	public static String encode(String text) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] result = md.digest(text.getBytes()); // 对文本进行签名
			// b
			// 000000..0000011111111
			StringBuilder sb = new StringBuilder();
			for (byte b : result) {
				int i = b & 0xff; // 取字节的后八位有效值
				String s = Integer.toHexString(i);
				if (s.length() < 2) {
					s = "0" + s;
				}
				sb.append(s);
			}

			// 加密的结果
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			// 找不到该算法,一般不会进入这里
			throw new RuntimeException(e);
		}
	}

}
