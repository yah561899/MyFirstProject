package tw.finalproject.ch05.ecpay.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.ch05.ecpay.model.OrderBean;
import tw.finalproject.ch05.ecpay.model.OrderItemBean;
import tw.finalproject.ecpay.payment.integration.AllInOne;
import tw.finalproject.ecpay.payment.integration.domain.AioCheckOutDevide;

@Service
public class PayementService {
	
	private final static Logger log = Logger.getLogger(PayementService.class.getName());
	
	public String prepareECPayData(OrderBean ob, HttpServletResponse response) {
		AllInOne aio = new AllInOne("");
		// 使用信用卡
		AioCheckOutDevide aioCheck = new AioCheckOutDevide();
		/* 特店編號 測試時必須要填: 2000132 */ 
		aioCheck.setMerchantID("2000132");    
		/* 特店交易時間，格式為 yyyy/MM/dd HH:mm:ss，請複製下面四行 */
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		String merchantTradeDate = sdf.format(ob.getOrderDate());
		aioCheck.setMerchantTradeDate(merchantTradeDate);
		
		/* 交易金額：必須為整數組成的字串，不能有小數點，否則當掉 */		
		int totalAmount = (int)ob.getTotalAmount().doubleValue();
		aioCheck.setTotalAmount(String.valueOf(totalAmount));
		
		/* 交易描述：說明性質的資料，自己填 */		
		aioCheck.setTradeDesc(ob.getMemberId() + "-" +ob.getOrderNo() +  "-" + ob.getOrderDate());
		
		String itemName = "";
		
		for(OrderItemBean oib :ob.getItems()) {
			itemName += oib.getTitle() + "#";
		}
		itemName = itemName.substring(0, itemName.length() - 1);
		/* 填入商品名稱，可用#隔開，可以抓你的商品名稱也可自填 */	
		aioCheck.setItemName(itemName);
		
		/* 特店交易編號，不能超過20個符號，也不能重複(一個編號只能用一次)，否則當掉，可自填 */
		aioCheck.setMerchantTradeNo("KCompany" + 651396);
		
		/* 付款完成通知回傳網址：不瞭解此網址的作用 */
		aioCheck.setReturnURL("https://localhost:8080/checkEcPayment.controller");
		
		String htmlContent = "";
		
		// 輸出畫面
		/*
		 * try { PrintWriter out = response.getWriter();
		 * response.setContentType("text/html"); htmlContent = aio.aioCheckOut(aioCheck,
		 * null); log.info(htmlContent);
		 * 
		 * } catch (IOException e) { e.printStackTrace(); }
		 */
		htmlContent = aio.aioCheckOut(aioCheck, null);

		return htmlContent;
	}
	
}
