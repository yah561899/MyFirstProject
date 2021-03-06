package tw.finalproject.warranty.controller;

import java.io.File;
import java.io.IOException;
//import java.lang.reflect.Array;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
//import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.manager.model.ManagerService;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberService;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.order.model.OrderService;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.orderdetail.model.OrderDetailService;
import tw.finalproject.product.model.ProductService;
import tw.finalproject.productregister.model.ProductRegisterBean;
import tw.finalproject.productregister.model.ProductRegisterService;
import tw.finalproject.warranty.model.WarrantyBean;
import tw.finalproject.warranty.model.WarrantyService;

@Controller
//@ResponseBody
@SessionAttributes(names = { "memlogin", "mngLogin" })
public class WarrantyController {
	private String from = "buyagain134@gmail.com";
	private String to = "buyagain134@gmail.com";
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private WarrantyService warrantyService;
	@Autowired
	private ManagerService mngService;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductRegisterService pdrgService;
	
	@Autowired
	private ProductService pdService;

	@Autowired
	private HttpSession session;

	// findALL ???????????????
			@GetMapping(path = "/Warrantyfindall2.controller")
			public String Warrantyfindall2(Model m) {
//				List<WarrantyBean> mbb = warrantyService.findall();
//				m.addAttribute("allmbb", mbb);
				List<WarrantyBean> warranty = warrantyService.findMemberBuyInfoBeanName();
				System.out.println("???????????????FINDALL"+warranty);
				m.addAttribute("warranty", warranty); //???????????????
				
				
//				if (session.getAttribute("mngLogin") != null) {
//					return "forward:/W"; // redirect: ????????????????????? server
//				}
				
				return "warrantyInfofindall";
			};
	

	// findALL ???????????????
		@GetMapping(path = "/Warrantyfindall.controller")
//		@RequestMapping(path = "/Warrantyfindall.controller", method = RequestMethod.POST)
		public String Warrantyfindall(Model m) {
			List<WarrantyBean> mbb = warrantyService.findall();
			m.addAttribute("allmbb", mbb);
			
			
			if (session.getAttribute("mngLogin") != null) {
				return "forward:/Warrantyfindall2.controller"; // redirect: ????????????????????? server
			}
			
			return "managerLogin";
		};



	// ??????????????? ???????????????
	@GetMapping(path = "/updatewarranty.controller1")
//	@RequestMapping(path = "/updatewarranty.controller1", method = RequestMethod.POST)
	public String updatewarranty(@RequestParam("warrantyInfoId") Integer id, Model m){
		List<WarrantyBean> warranty = warrantyService.findBywarrantyId(id);
		System.out.println(warranty);
		m.addAttribute("mbbb", warranty);//??????????????????????????? update
		System.out.println(warranty);
		
		return "warrantyupdate";

	}

		
		@PostMapping(path = "/updatewarranty.controller2")
//		@RequestMapping(value = "/updatewarranty.controller2" , method = RequestMethod.POST )
		public String updatewarranty2(@RequestParam("warrantyInfoId")Integer warrantyInfoId,
				@RequestParam("registerStart") Date registerStart,
				@RequestParam("registerFinish") Date registerFinish,
				@RequestParam("registerStatus") Integer registerStatus ,
				@RequestParam("fk_productId") Integer fk_productId, 
				@RequestParam("fk_memberid") Integer fk_memberid,
				@RequestParam("pekoinvoice") String img,
				@RequestParam("pekoid") String registerid,
				Model m){
		
			 int resultdate = registerFinish.compareTo(registerStart);
		     System.out.println("resultdate============="+resultdate);
		    if(resultdate == 1) {
		    	System.out.println("??????===============1");
		    	WarrantyBean warranty = new WarrantyBean() ;
				warranty.setWarrantyInfoId(warrantyInfoId);
				warranty.setRegisterStatus(registerStatus);
				warranty.setProductBean(pdService.findById(fk_productId)); //???????????????????????????
				warranty.setMemberBean(memService.findById(fk_memberid));//???????????????????????????
				warranty.setRegisterStart(registerStart);
				warranty.setRegisterFinish(registerFinish);
				warranty.setInvoice(img);
				warranty.setRegisterid(registerid);
				warrantyService.updatewarranty(warranty);
				System.out.println(warranty);
				return "redirect:/Warrantyfindall2.controller";
		    }
		    else {
		    	return "warrantyupdateFail";
		    }
//			System.out.println("pekoimgpekoimg=" + img);
			
//		    return "forward:/Warrantyfindall2.controller";
		}


	//??????????????? ????????????(?????????????????????0)
				@PostMapping("/deletewarranty.controller")
				public String daletewarranty2(
						@RequestParam("id") Integer id,
						@RequestParam("registerid") String registerid,
						@RequestParam("registerStatus")  Integer registerStatus,
						Model m) throws MessagingException{
					System.out.println("registerStatus()==="+registerStatus);
//				if(registerStatus.equals(1)) {
					
//					ArrayList<WarrantyBean> waa= new ArrayList<>();
//					waa.add(registerid);
//					
//					for( WarrantyBean dddaa  : waa) {
//						System.out.println("dddaa ===="+ dddaa);
//						System.out.println("waa ===="+ waa);
//					}
//					WarrantyBean wa = new WarrantyBean();
//					wa.setRegisterid(registerid);
//					Optional<WarrantyBean> warr = warrantyService.findregisterid(wa);
			
//					System.out.println("registerid1 ===="+ registerid1);
//					System.out.println("registerid1 ===="+ waa);
					
					MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
					mimeMessageHelper.setTo(to);
					mimeMessageHelper.setFrom(from);
					mimeMessageHelper.setSubject("Bag ??????????????????");
					StringBuilder sb = new StringBuilder();
					sb.append("<html><head></head>");
					sb.append("<body><h1>Bag ??????????????????</h1><p>??????????????????????????????????????????????????????????????????<br>??????BAG????????????   "
							+"BAG??????????????????????????????????????????BAG?????????????????? "
							+ "<a href=\"https://https://localhost:8080/homepage.controller>????????????</a><br>???????????????????????????</p>");
					sb.append("<img src=\"cid:imageId\"/></body>");
					sb.append("</html>");
					mimeMessageHelper.setText(sb.toString(), true);
					
					FileSystemResource img = new FileSystemResource(new File("src/main/resources/static/images/Baglogo.jpg"));
					mimeMessageHelper.addInline("imageId",img);
					
					mailSender.send(mimeMessage);
					
					System.out.println(id);
					warrantyService.update(id);
					return "redirect:/Warrantyfindall2.controller";
//				}
//				else {
//					return "redirect:/Warrantyfindall2.controller";
//					}
				}

				
			//////////////////??????
				
				// findALL ????????????
				@GetMapping(path = "/WarrantyfindMember.controller2")
				public String WarrantyfindMember2(Model m) {
				
					MemberBean userid = (MemberBean)session.getAttribute("memlogin"); 
					String memLogin = userid.getUserId();
					System.out.println(memLogin +"=TEST");
					List<WarrantyBean> warranty = warrantyService.findmemberall(memLogin);
					System.out.println(warranty);
					m.addAttribute("warranty", warranty);
					
					
//					if (session.getAttribute("mngLogin") != null) {
//						return "forward:/W"; // redirect: ????????????????????? server
//					}
					
					return "warrantyInfoMEMBER";
				};
		

		// findALL ????????????
			@GetMapping(path = "/WarrantyfindMember.controller1")
			public String WarrantyfindMember1(Model m) {
		
				
				
				if (session.getAttribute("memlogin") != null) {
					return "forward:/WarrantyfindMember.controller2"; // redirect: ????????????????????? server
				}
//				
				return "memberLogin";
			};
			
			
			// findALL ??????????????????
						@GetMapping(path = "/Warrantyinsert1.controller")
						public String WarrantyInsert1(Model m) {

							
							if (session.getAttribute("memlogin") != null) {
								return "warrantyMmeberInsertcheck"; // redirect: ????????????????????? server
							}			
							return "memberLogin";
						};
						
						
						// findALL ????????????????????????
//						@GetMapping(path = "/Warrantyinsertcheck.controller")
						@RequestMapping(path = "/Warrantyinsertcheck.controller", method = RequestMethod.POST)
						public String WarrantyInsertcheck(
								@RequestParam("productid") String productid,  //??????JSP??????  ????????????
								@RequestParam("registerid") String registerid, //????????????
							
								Model m) {
							
							
//							OrderBean orderBean = new OrderBean();//test ??????SET???BEAN ??????order???????????? ????????????
//							orderBean.setProductserialnumber(registerid); // ??????
//							orderBean.setOrderDate(buytime); // ????????????
//							System.out.println("orderBean======"+orderBean); //BEAN?????????
							
							ProductRegisterBean productRegisterBean = pdrgService.findByLicenseKey(registerid);
							
//							List<OrderBean> neworder = orderService.findserial(registerid);
//							System.out.println("neworder============================"+neworder);
//							List<OrderBean> orderinfo = orderService.findserial(registerid); // ?????????????????????   ??????
//							System.out.println("orderinfo??????============="+orderinfo); // ????????????????????? 
//							System.out.println("orderinfo.get(2).equals(orderinfo)");
							
							m.addAttribute("productRegisterBean", productRegisterBean);//order??????	$
							if(productRegisterBean == null) { //????????????    ???????????????????????????SESSION  ?????????????????????NULL
						
//								List<OrderBean> mbb = orderService.findAll(); //TEST ?????? ??????ORDER??????							
//								List<OrderBean> ordermbb = orderService.findByregisterId(registerid); //????????? ????????????fk_productId
//								System.out.println("mbb????????????===="+mbb);
//								System.out.println("order????????????="+ordermbb);

//								m.addAttribute("ordermbb", ordermbb); //??????????????? ????????????  fk_product?????? ???????????????????
								return "warrantyFail";					
							}	
//							else {
//								return "warrantyFail";
//							}
						
							return "warrantymemberInsert";  
						};
//						};
						
						// ????????????????????????   //*??????warranty???????????????
						@PostMapping(path = "/Warrantyinsert2.controller")
						public String WarrantyInsert2(
								@RequestParam("fk_member") Integer fk_memberid,  ///FK??????
								@RequestParam("fk_productorder")  Integer fk_productId ,
								@RequestParam("registerid") String registerid,
								@RequestParam("setTimestart") Date setTimestart, //??????????????? 
								@RequestParam("setTimeEnd")Date setTimeEnd, //???????????????
								@RequestParam("imgtest")String imgtest,
								Model m) throws MessagingException {
							
							ProductRegisterBean productRegisterBean = pdrgService.findByLicenseKey(registerid);
							
							MemberBean memBean = (MemberBean) session.getAttribute("memlogin");
							Integer memId = memBean.getMemberId();
							String username = memBean.getName();
							MemberBean memberBean = memService.findByMemberId(memId);
							productRegisterBean.setMemberBean(memberBean);
							productRegisterBean.setRegisterDate(setTimestart);
							
							WarrantyBean warranty = new WarrantyBean(); //set??????
							warranty.setRegisterid(registerid);
							
							Optional<WarrantyBean> warranty1 = warrantyService.findregisterid(warranty); //????????????????????????  ???????????????null
							System.out.println("warrantyService.findregisterid======" +warranty1);

							System.out.println("fk_memberid??????LIST==="+fk_memberid); //????????????
							if(warranty1==null) {		
//								warranty.setWarrantyInfoId(warrantyInfoId);  //set?????? @Param
								warranty.setRegisterStatus(1);//SET????????????
								warranty.setProductBean(pdService.findById(fk_productId)); //??????????????????????????? ?????? ??????
								warranty.setMemberBean(memService.findById(fk_memberid));//??????????????????????????? ?????? ?????????
								warranty.setInvoice("defaultpicture.jpg");
								warranty.setRegisterStart(setTimestart); //SET??????????????? 
								warranty.setRegisterFinish(setTimeEnd);  //??????????????? NEW DATE
								warrantyService.updatewarranty(warranty);	//save
								//mail
								MimeMessage mimeMessage = mailSender.createMimeMessage();
								MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
								mimeMessageHelper.setTo(to);
								mimeMessageHelper.setFrom(from);
								mimeMessageHelper.setSubject("Bag ??????????????????");
								StringBuilder sb = new StringBuilder();
								sb.append("<html><head></head>");
								sb.append("<body><h1>Bag ??????????????????</h1><p>??????????????? " + username +"<br> ???????????????????????????????????? "
										+"BAG?????????"+ registerid + " <br> ???????????????????????????????????????/?????????????????????????????????BAG?????????<br>"
										+ "?????????????????????????????????Rma???????????????????????????????????????<br>???????????????????????? ??????"+ setTimestart +"????????????????????????" + setTimeEnd +"????????????</p>");
								sb.append("<img src=\"cid:imageId\"/></body>");
								sb.append("</html>");
								mimeMessageHelper.setText(sb.toString(), true);
								
								FileSystemResource img = new FileSystemResource(new File("src/main/resources/static/images/Baglogo.jpg"));
								mimeMessageHelper.addInline("imageId",img);
							
								mailSender.send(mimeMessage);
								
								    System.out.println("?????????????????????");
								return "warrantySuccess";	//?????? ?????? ????????????		
							}
								return "warrantyError";
							};

							//????????????
							@GetMapping("/warrantyimg.controller")
							public String invoicelink(Model m , @RequestParam("warrantyInfoId") Integer id) {
								List<WarrantyBean> invoice = warrantyService.findBywarrantyId(id);
								Integer id1 = id ;
								m.addAttribute("invoice",id1);
								System.out.println("warranty="+invoice);
								List<WarrantyBean> warranty = warrantyService.findBywarrantyId(id);
								System.out.println("LIST====================="+warranty);
								m.addAttribute("mbbb", warranty); 
								return "warrantyMemberImg";
							}
							//??????????????????
							@PostMapping(path ="/warrantyimg2.controller")
//							@RequestMapping(path = "/warrantyimg2.controller", method = RequestMethod.POST)
//						    @RequestMapping(path = "/warrantyimg2.controller",headers = "content-type=multipart/*", method = RequestMethod.POST) 
							public String invoiceUpdater(@RequestParam("warrantyInfoId") Integer id, @RequestParam("picture") MultipartFile picture , Model m) throws IllegalStateException, IOException {
							List<WarrantyBean> warranty = warrantyService.findBywarrantyId(id);
							String fileName = picture.getOriginalFilename();
							
							WarrantyBean mbBean = warrantyService.findByWarrantyInfoId(id);
							
							if (fileName.trim().length() != 0) { // ?????????????????????
								String fileString = fileName.substring(fileName.lastIndexOf(".")); // ???????????????

								ClassPathResource resource = new ClassPathResource(
										"/src/main/webapp/WEB-INF/Buy_again/images/warrantyimages/");
								String saveDirPath = resource.getPath();

								File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); ???????????????(??????)
								saveDirPathFile.mkdirs(); // mkdirs()?????????????????????????????????????????????

								String savePath = saveDirPath + UUID.randomUUID() + fileString; // ??????????????????
								File savePathFile = new File(savePath); // ????????????
								String savePathid = savePathFile.getName();
								picture.transferTo(savePathFile); // ????????????
								
								mbBean.setInvoice(savePathid); //???????????????
								WarrantyBean waBean  = warrantyService.updatewarranty(mbBean);//update
								m.addAttribute("waBean", waBean);
								System.out.println("waBean(===)" + waBean);
							} else { // ???????????????
								String savePathid = mbBean.getInvoice();
							}
							
								return "redirect:/WarrantyfindMember.controller2";
							}
						
							
							@GetMapping(path ="/FINDALLproductid.controller")
							public String findallproducid(Model m) {
								List<ProductRegisterBean> pdrg = pdrgService.findwarrantyregisterId();
			
								System.out.println("??????????????????FINDALL"+pdrg);
								m.addAttribute("pdrg", pdrg); //
														
//								if (session.getAttribute("mngLogin") != null) {
//									return "forward:/W"; // redirect: ????????????????????? server
//								}
								
								return "warrantyfindmemberbuyproductid";
							};
};