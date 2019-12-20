package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101500695341";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCd7qpDpufldWa6zR1MKZpElwnbplrFQoWQoS5qxC77rIhc/1ej4w9RS0Hjqyti6mbSX0oqPsskc5O6X/TxFkxSOQsYKGGgb/18qudhrQgOi4cmBhYrw3r2ShtLcr3b8Lv44UohupNdNjhcejXG+ptlz2HwcmLm+qkAJQnX+qsL06EfwJN/zlrGc/K+nhVHmWuZwUxmBu1JTUvSdwcPvvWiNIdECWUx43ityE5kawij4x9gerghnU+N9dT9Ku/zfNaogcxpZ6RhOhY0pNsJYeqIJRiy+RBy5T08cEIkktNSnUyi1HRscE7jwy/oYvogaLe8NqiAlypa2Db+o7csFIDNAgMBAAECggEBAI7WUYXYSbndAamHY60Dn3PTiuXuwf/Ql05kiL+labzToY1Cn3gpHyxuPUx0/kt7Jr2z0zb8DeyM35pbuQPnH+Xpk6AovYtGXmPHindr8HJ/PR9lt92i8e4YvjDxuMdYJhoFYG+6+BcAt97j5QlulOdyteiq+8peAEWSOiHto4+QTL9yZmqiXPf0H5MJQfVcJZStvHJdxkuOvrue/LHCdjkilHoT2Z32ilVQc1T2lP2wLdGbH3MMT3htUPHh40rtXwKf/+6CChIIsODwqs09/c7B8/bIsm55oG6d4/MhR0jKejJ3UkH2k9+J75YEBiKXic5L+CT4UNH7ou7Rw8OjOcECgYEA4q6nuCiaY2RdnGIfj6CJPNT1g/mRTBlPjdp00RywNijGwzRGDklEg9FHCyKQbY+rp61JWp5pCty6+61ruipa9w3dhLUkcfr+KBLkxJSanQ63ifKqLXPab9m8SxWA+QZB7eEjNLxKXwdGL8BwUtS1aGxYvYGh59eqLggOW6l4w/0CgYEAslu6+a5zuIXonB3kHRQNfOZxqGb0xPtdL7VBYiR85TuV/G4oXLfx9BJUSCluLFaz3ZGc5SiXtgYiOGgHb5rbDzZgSbtc8J7lZSbuR9BnFFbhnnOvruQgPgCc4cQgIA71hQKeHedVLuWFJ4LO7i9h1aIwHX+Mx6K4MQY3FqaRgRECgYBO46nLFZZlcNCDVELXoW8hlJu9SmWerlBZdeWhwPIyZw6FcPPQlP8bQQIQhf7tokqDGHOm7epwtVD9teT/7S2rPVASl1gPsuIw4CJtp6oHbs/BWoqPNvqWYph9KQaxo9PeDbRK7hyT5dwvUjHFIfHgXZSknzDRluTLEFKu49P7oQKBgQCHIVKe2tpYAjSDG255zXiOmbWhBigKmfs3KxeXeNebgbKYJwmzfbX12nE6nxEWzLXHeAwr3r5arXj9zWtc1jGD7Am1sxuuPmTEZ2N+y1ldopmbyEBhu/rlnuc9ca95OnwvwxTyyRLTzhc9ITEQapuwFQppPvr1QcZVdkUEhzyUUQKBgFw8am65W7igpXwG0NgKBbwxizKQa/48Vjz2L//vIsUWG1WZLbg/2LIG/vycx+Gtdqty3XBeAsC9SD7JHNils42G50kO1hq1GgA9yUUzGHlzTzbZxUIgtmIqqm8u2kSfP+gHv+/nqlyNWhKw/+BSmlZRj3qn4CwGQQRq02U8fSRJ";

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7Yht9KtQDx/Ie0NdOGZWOVj7FAPZGWIodTa8dSXx5kP7LMnhzgVS1HVMPLfDJ16RiZGmmSwA+1lgQRGPOBgxYmKhPZ1gnsvqa+K/gnM3rouxTTAOZVK5ptAZst9fez4XvjB94/dKAkrkcFNSVt7mI0TrvfrTSY0kquqIzUZXMnOs+VWvnAMFUzMts+60ai2wO6LyQrdRE0pPbz2XRqajyWnDoHqfPKnE837v1WN/Eum6xCmLm9GBDZqGmFUXvyTpTBCrGfxeaD99mh2h3IY7jNolEU/Ag3FvMCJLEeD3c0tSKO0Tn/zsiNT7zP9Qxb/YrwsJ1P7qHNmtNVOJ/Zk5pQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://alipay.trade.page.pay-JAVA-UTF-8/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://alipay.trade.page.pay-JAVA-UTF-8/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 支付宝网关
	public static String log_path = "e:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * @param sWord 要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}

