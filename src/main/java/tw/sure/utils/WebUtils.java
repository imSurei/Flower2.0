package tw.sure.utils;

import java.util.Map;
//import org.apache.commons.beanutils.BeanUtils;

/**
 * 一行code，實現將所有請求參數注入到Bean物件中的功能
 * 2.0 將第一個參數HttpServletRequest（本身就是Map類型） --> Map 類型，Dao和Service層都可以用
 * 這樣寫耦合度低，擴展性高 --> 寫api需要注意的細節
 * 
 * @author sure
 *
 */
public class WebUtils {

	/**
	 * 一行code，實現將所有請求參數注入到Bean物件中的功能
	 * @param value
	 * @param bean
	 */
//	public static void copyParamsToBean(Map value, Object bean) {
//		try {
//			BeanUtils.populate(bean, value);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	/**
	 * String轉int方法
	 * @param strInt
	 * @param defaultValue 拋出異常就使用設定好的int數據✨
	 * @return
	 */
	public static int parseInt(String strInt,int defaultValue) {
		try {
			return Integer.parseInt(strInt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return defaultValue;
	}
}
