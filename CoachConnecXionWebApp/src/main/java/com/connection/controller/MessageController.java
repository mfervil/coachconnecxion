package com.connection.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;


import com.connection.service.MessageService;

@Controller
@Scope("session")
public class MessageController {
	@Autowired
	private MessageService messageService;
	@Autowired
    private JavaMailSender mailSender;
}
