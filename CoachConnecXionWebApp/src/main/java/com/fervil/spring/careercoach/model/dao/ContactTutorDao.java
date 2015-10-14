package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import com.fervil.spring.careercoach.model.domain.CoachingCategory;
import com.fervil.spring.careercoach.model.domain.Contacttutor;

public interface ContactTutorDao {

    public void store(Contacttutor contacttutor) throws Exception;  

    public Contacttutor findById(long id) throws Exception ;

    public List<Contacttutor> findAll() throws Exception ;
}
