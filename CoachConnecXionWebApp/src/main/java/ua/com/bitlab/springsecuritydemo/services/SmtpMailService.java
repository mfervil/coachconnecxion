/*
 * Copyright 2011-2012 Soramaki Networks Oy
 * All rights reserved.
 */

package ua.com.bitlab.springsecuritydemo.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.MessageFormat;
import java.util.ResourceBundle;

/**
 * Date: Dec 14, 2010
 */
@Service
public class SmtpMailService implements MailService {

    private final static Logger log = LoggerFactory.getLogger(SmtpMailService.class);

    private static final ResourceBundle MAIL_TEMPLATES = ResourceBundle.getBundle("mail_templates");

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendActivationEmail(WebUser user) throws IOException {
        long tt = System.currentTimeMillis();
        log.debug("Sending activation email");
        sendMessage(user.getEmail(), getSubject(user), getMessageBody(user));
        log.info("Activation email sent in " + (System.currentTimeMillis() - tt) + " ms");
    }

    @Override
    public void sendResetEmail(WebUser user) throws IOException {
        long tt = System.currentTimeMillis();
        log.debug("Sending activation email");
        sendResetMessage(user.getEmail(), getResetSubject(user), getResetMessageBody(user));
        log.info("Activation email sent in " + (System.currentTimeMillis() - tt) + " ms");
    }
    
    
    @Override
    public void sendMessage(final String email, final String subject, final String text) {
        log.debug("Sending message to email [" + email + "] ");
        mailSender.send(new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
                helper.setTo(email);
                helper.setSubject(subject);
                helper.setText(text, true);
                helper.setFrom(MAIL_TEMPLATES.getString("mail.activation.from"));
            }
        });
        log.debug("Message to [" + email + "] sent");
    }
    
    @Override
    public void sendResetMessage(final String email, final String subject, final String text) {
        log.debug("Sending message to email [" + email + "] ");
        mailSender.send(new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
                helper.setTo(email);
                helper.setSubject(subject);
                helper.setText(text, true);
                helper.setFrom(MAIL_TEMPLATES.getString("mail.reset.from"));
            }
        });
        log.debug("Message to [" + email + "] sent");
    }
    
    
    private String getMessageBody(WebUser user) throws UnsupportedEncodingException {
        String templatePattern = MAIL_TEMPLATES.getString("mail.activation.text");
        return MessageFormat.format(templatePattern, user.getId(), URLEncoder.encode(URLEncoder.encode(user.getActivationCode(), "utf-8"), "utf-8"), user.getUsername());
    }

    private String getResetMessageBody(WebUser user) throws UnsupportedEncodingException {
        String templatePattern = MAIL_TEMPLATES.getString("mail.reset.text");
        return MessageFormat.format(templatePattern, user.getId(), URLEncoder.encode(URLEncoder.encode(user.getActivationCode(), "utf-8"), "utf-8"), user.getUsername());
    }
    
    
    private String getSubject(WebUser user) {
        String templatePattern = MAIL_TEMPLATES.getString("mail.activation.subject");
        return MessageFormat.format(templatePattern, user.getId());
    }

    private String getResetSubject(WebUser user) {
        String templatePattern = MAIL_TEMPLATES.getString("mail.reset.subject");
        return MessageFormat.format(templatePattern, user.getId());
    }

}
