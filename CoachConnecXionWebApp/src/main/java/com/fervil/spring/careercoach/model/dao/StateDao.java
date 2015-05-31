package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import com.fervil.spring.careercoach.model.domain.BlogComment;
import com.fervil.spring.careercoach.model.domain.State;

public interface StateDao {

//    public void store(BlogComment blogComment) throws Exception;  

    public State findById(String statecode) throws Exception ;

    public List<State> getAllStates() throws Exception ;

}
