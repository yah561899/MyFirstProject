package tw.finalproject.email.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService implements IEmailSenderService {
	
	private static final String FROM = "buyagain134@gmail.com";
	
	private static final Logger log = LoggerFactory.getLogger(EmailSenderService.class); 
	
	private JavaMailSender mailSender;
	
	@Autowired
	public EmailSenderService(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	@Override
	public void sendEmail(String toEmail, String subject, String body) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(FROM);
		message.setTo(toEmail);
		message.setSubject(subject);
		message.setText(body);
		mailSender.send(message);
		
		log.info("郵件已寄出...");
	}
	
}
