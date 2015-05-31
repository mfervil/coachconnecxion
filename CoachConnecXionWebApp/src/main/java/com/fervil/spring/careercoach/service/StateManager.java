package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.State;

@Transactional
public interface StateManager  extends Serializable {
	

    public State findById(String id) throws Exception;	
    public List<State> getAllStates() throws Exception;	
}
