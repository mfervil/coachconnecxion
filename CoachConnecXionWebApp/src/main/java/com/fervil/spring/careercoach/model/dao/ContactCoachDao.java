package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import com.fervil.spring.careercoach.model.domain.ContactCoach;

public interface ContactCoachDao {

    public void store(ContactCoach contactcoach) throws Exception;  

    public ContactCoach findById(long id) throws Exception ;

    public List<ContactCoach> findAll() throws Exception ;
}
