package tw.finalproject.shoppingcartdetail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.ch05.ecpay.service.PayementService2;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberService;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.order.model.OrderService;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.product.model.ProductBean;
import tw.finalproject.product.model.ProductService;
import tw.finalproject.productregister.model.ProductRegisterBean;
import tw.finalproject.productregister.model.ProductRegisterRepository;
import tw.finalproject.productregister.model.ProductRegisterService;
import tw.finalproject.shoppingcartdetail.model.ShoppingcartDetailBean;
import tw.finalproject.shoppingcartdetail.model.ShoppingcartDetailService;

@Controller

public class ShoppingcartDetailController {

	@Autowired
	private ShoppingcartDetailService shopService;
	
	@Autowired
	private  ProductService pdService;
	
	@Autowired
	private  ProductRegisterService pdrgService;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private OrderService odService;
	
	@Autowired
	PayementService2 payementService;
	
	
	@Autowired
	private HttpSession session;

	private String savePathid;

	@Autowired
	private ServletContext context;

//????????????????????????
	@RequestMapping(path = "insertshoppingcartdetail.controller1")
	@ResponseBody
	public String insertShoppingcartDetail1(@RequestParam("productId") Integer productId,
			Model m) {
		MemberBean mb = (MemberBean) session.getAttribute("memlogin");
		
		MemberBean memBean = memService.findById(mb.getMemberId());
		
		System.out.println("============================================="+productId);
		ShoppingcartDetailBean shBean = new ShoppingcartDetailBean();
		String status = "";
		if (shopService.finByProduct(productId, mb.getMemberId())!=null ) {
			System.out.println("============================================??????"+mb.getMemberId()+productId);
			shopService.deleShoppingcartDetail(mb.getMemberId(), productId);
			status="??????";
		} else {
//			shBean.setFk_memberId(mb.getMemberId());
			
			ProductBean pdBean = pdService.findById(productId);
			
			shBean.setMemberBean(memBean);
			
			shBean.setQuantity(1);
			
//			shBean.setFk_productId(productId);
			
			shBean.setProductBean(pdBean);
			
			shBean.setUnitPrice(pdBean.getUnitPrice());
			shopService.insertShoppingcartDetail(shBean);
			status="??????";
		}
		return status;
	}

//????????????????????????
	@RequestMapping(path = "insertshoppingcartdetail.controller")
	@ResponseBody
	public String insertShoppingcartDetail(@RequestParam("product-quantity") Integer quantity,
			@RequestParam("productId") Integer productId) throws IOException {

		MemberBean mb = (MemberBean) session.getAttribute("memlogin");
		
		MemberBean memBean = memService.findById(mb.getMemberId());
//????????????			
		ShoppingcartDetailBean shBean = new ShoppingcartDetailBean();
		String status = "";
//		shBean.setFk_memberId(memBean.getMemberId());
		shBean.setMemberBean(memBean);
		Integer i = 0;
		if(shopService.finByProduct(productId, memBean.getMemberId()) == null) {
			shBean.setQuantity(quantity);
		}else {
			i = shopService.finByProduct(productId, memBean.getMemberId()).getQuantity();
			int quantity1 = 0;
			quantity1 = i + quantity;
			shBean.setQuantity(quantity1);
			shopService.deleShoppingcartDetail(memBean.getMemberId(), productId);
		}
		ProductBean pdBean = pdService.findById(productId);
//		shBean.setFk_productId(productId);
		shBean.setProductBean(pdBean);
		shBean.setUnitPrice(pdService.findById(productId).getUnitPrice());
//		System.out.println(shBean.getFk_memberId());
		shopService.insertShoppingcartDetail(shBean);
//??????????????????		
		status="??????";
		return status;
	}

//???????????????????????????
	@GetMapping("/findallshoppingcartdetail.controller")
	public String findAllShoppingcartDetail(Model m) throws IOException {
		MemberBean mb = (MemberBean) session.getAttribute("memlogin");
		List<ShoppingcartDetailBean> shoppingcart = shopService.findByMemberId(mb.getMemberId());
		System.out.println("shoppingcart:" + shoppingcart);
		m.addAttribute("allProducts", shoppingcart);

		return "shoppingCart1";
	}

//??????????????????
	@GetMapping("/deleteshoppingcartdetail.controller")
	public String deleteProduct(@RequestParam("shoppingcartDetailId") Integer shoppingcartDetailId, Model m) {
		shopService.deleteProduct(shoppingcartDetailId);
		return "redirect:/findallshoppingcartdetail.controller";
	}
//??????????????? ???ajax	
	@RequestMapping(path ="updateshoppingcartdetail.controller")
	@ResponseBody
	public String updateShoppingProduct(@RequestParam("quantity") Integer quantity, @RequestParam("fk_productId") 
	Integer fk_productId ,@RequestParam("status") String status,Model m) {
		MemberBean mb = (MemberBean) session.getAttribute("memlogin");
//		ShoppingcartDetailBean shBean = new ShoppingcartDetailBean();
		if("+".equals(status)) {
			quantity = quantity+1;
		}else {
			quantity = quantity-1;
		}
		System.out.println("quantity:"+quantity);
		shopService.updateShoppingProduct(quantity,fk_productId,mb.getMemberId());

		return "quantity";
	}

//??????name=checkbox ?????????value
	@PostMapping("/payment.controller")
	public String findAllCheckOut(@RequestParam("checkbox") String productId, Model m, Model s, Model a)
			throws IOException {
//		MemberBean mb = (MemberBean) session.getAttribute("memlogin");
		System.out.println("productId:"+productId);
		List<String> listId = new ArrayList<>();
		//?????????????????????value = ?:?,?:?
		
		String[] idandquantitys = productId.split(",");
		//???????????????split???????????????, [?:?][?:?]
		String pid = "" ;
		
		
		for (String idandquantity : idandquantitys) {
			pid = StringUtils.substringBefore(idandquantity, ":");
			System.out.println("idandquantity:"+idandquantity);
			listId.add(pid); 
		}
		//substringBefore????????????????????? pom.xml???????????? ??????listId
		List<ShoppingcartDetailBean> shoppingcart = shopService.findByProductId(listId);
//		ShoppingcartDetailBean shBean = new ShoppingcartDetailBean();
		Integer quantity = 0;
		Integer unitPrice = 0;
		Integer total = 0;

		for (int i = 0; i < shoppingcart.size(); i++) { //??????shoppingcart[list]?????????
			quantity = shoppingcart.get(i).getQuantity();
			unitPrice = shoppingcart.get(i).getProductBean().getUnitPrice();
//			smalltotal=quantity*unitPrice;
			total = total + quantity * unitPrice;
		}
		m.addAttribute("allProducts", shoppingcart);
		s.addAttribute("total", total);
		a.addAttribute("productId", productId);

		return "payment";
	}

//????????????
	@PostMapping("/insertoder.controller")
	@ResponseBody
	public String insertOrderDetail(@RequestParam("productId") String productId,
			@RequestParam("finalPrice") Integer finalPrice,@RequestParam("address") String address,
			@RequestParam("phone") String phone, HttpServletResponse response) throws IOException {
		MemberBean mb = (MemberBean) session.getAttribute("memlogin");
		
		System.out.println(mb.getMemberId());
		
		MemberBean memBean = memService.findById(mb.getMemberId());
		
		System.out.println(memBean.getName());
		
		System.out.println("productId:"+productId);
		String[] idandquantitys = productId.split(",");
		System.out.println(idandquantitys);
		//???????????????split???????????????, [?],[?]
		String orderNo = Randomly(); 
		//??????orderId?????????function
		OrderBean ordBean = new OrderBean();
//		ordBean.setFk_memberId(memBean.getMemberId());
		
		ordBean.setMemberBean(memBean);
		
		ordBean.setFinalPrice(finalPrice);
		
		ordBean.setOrderDate(new Date());
		ordBean.setOrderNo(orderNo);
		ordBean.setAddress(address);
		ordBean.setPhone(phone);
		
//		shopService.saveOrder(ordBean);
		
		OrderBean odBean = shopService.saveOrder(ordBean);
		
		System.out.println(odBean.getOrderDate());
		
		System.out.println("test----------------------------------");
		
		Integer pid =0,quantity=0 ,productQuantity=0 ,totalPrice=0;
		
		
		for (String idandquantity : idandquantitys) {
			pid = Integer.parseUnsignedInt(StringUtils.substringBefore(idandquantity, ":"));
			quantity = Integer.parseUnsignedInt(StringUtils.substringBetween(idandquantity, ":"));	
			totalPrice = Integer.parseUnsignedInt(StringUtils.substringAfterLast(idandquantity, ":"));	
			System.out.println("pid:"+pid);
			System.out.println("quantity:"+quantity);
			System.out.println("totalPrice:"+totalPrice);
			ProductBean pd = new ProductBean();

			pd = pdService.findById(pid);
			productQuantity = pd.getQuantity() - quantity;
			pd.setBuyCount(quantity);
			pd.setQuantity(productQuantity);
//			pdService.updateProduct(pd);
			
			ProductBean pdBean = pdService.updateProduct(pd);
			
			OrderDetailBean ordetBean = new OrderDetailBean();
			ordetBean.setQuantity(quantity);
//			ordetBean.setFk_orderId(ordBean.getOrderId());
			
			ordetBean.setOrderBean(odBean);
			
//			ordetBean.setFk_productId(pid);
			
			ordetBean.setProductBean(pdBean);
			
//			ordetBean.setUnitPrice(pd.getUnitPrice());
			
			ordetBean.setUnitPrice(pdBean.getUnitPrice());
			
			ordetBean.setTotalPrice(totalPrice);
			
			System.out.println("mb.getMemberId():" + memBean.getMemberId() );
			shopService.deleShoppingProduct(memBean.getMemberId(),pid);
			shopService.saveOrderDetial(ordetBean);

			System.out.println("ordBean.getOrderId():" + odBean.getOrderId());
			
			for(int i =0 ;i<quantity; i++) {
				System.out.println("ordBean.getOrderId():" + odBean.getOrderId());
				ProductRegisterBean pdrBean = new ProductRegisterBean();
				
				pdrBean.setLicenseKey(Randomly1());
				System.out.println(pdrBean.getLicenseKey());
//				pdrBean.setFk_productId(pid);
				
				pdrBean.setProductBean(pdBean);
				
//				pdrBean.setFk_memberId(memBean.getMemberId());
				
//				pdrBean.setMemberBean(memBean);
				
				pdrBean.setOrderBean(odBean);
				pdrgService.insertproductregister(pdrBean);
				
			}
			
			
			
		}

		
		return payementService.prepareECPayData(odBean, response);
		
//		return "paymentSuccess";
	}
//	for (String idandquantity : idandquantitys) {
//		System.out.println(idandquantity+"=="+idandquantitys);
//		OrderDetailBean ordetBean = new OrderDetailBean();
//		ordetBean.setQuantity(Integer.valueOf(StringUtils.substringAfter(idandquantity, ":")));
//		System.out.println(Integer.valueOf(StringUtils.substringAfter(idandquantity, ":")));
//		ordetBean.setFk_orderId(orderId);
//		ordetBean.setFk_productId(Integer.valueOf(StringUtils.substringBefore(idandquantity, ":")));
//		System.out.println("mb.getMemberId():" + mb.getMemberId() + StringUtils.substringBefore(idandquantity, ":"));
//		shopService.deleShoppingProduct(mb.getMemberId(),
//				Integer.valueOf(StringUtils.substringBefore(idandquantity, ":")));
//		shopService.saveOrderDetial(ordetBean);
//
//		System.out.println("orderId:" + orderId);
//	}

	//???orderId?????????
	@SuppressWarnings("null")
	public String Randomly() {
		String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String orderId = "";
		for (int i = 1; i <= 9; i++) {
			orderId += (chars.charAt((int) (Math.random() * 62)));
		}

		return orderId;
	}
	
	//???orderId?????????
	@SuppressWarnings("null")
	public String Randomly1() {
		String chars = "0123456789";
		String orderId = "";
		for (int i = 1; i <= 9; i++) {
			orderId += (chars.charAt((int) (Math.random() * 9)));
		}
		return orderId;
	}

// ?????????????????????
//	@GetMapping("/insertshoppingcartdetail1.controller")
//	public String insertShoppingcartDetail1(@RequestParam("quantity") Integer quantity,
//			@RequestParam("productId") Integer productId, Model m) throws IOException {
//		
//		MemberBean mb = (MemberBean) session.getAttribute("memlogin");
//		System.out.println(mb.getMemberId());
//		
//		ShoppingcartDetailBean shBean =new ShoppingcartDetailBean();
//		shBean.setFk_memberId(mb.getMemberId());
//		shBean.setQuantity(quantity);
//		shBean.setFk_productId(productId);
//		
//		System.out.println(shBean.getFk_memberId());
//		shopService.insertShoppingcartDetail(shBean);
//		
//		
//		return "shoppingCart1";
//
//	}

}
