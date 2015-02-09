package com.connection.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import com.connection.service.AttachmentService;


@Controller
@Scope("session")
public class AttachmentController {
	@Autowired
	private AttachmentService attachmentService;
	@Autowired
    private JavaMailSender mailSender;
}
