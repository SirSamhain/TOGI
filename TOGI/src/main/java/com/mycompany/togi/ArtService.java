///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.mycompany.togi;
//
//import java.util.List;
//import javax.ejb.Stateless;
//import javax.persistence.EntityManager;
//import javax.persistence.PersistenceContext;
//import javax.persistence.TypedQuery;
//
//@Stateless
//public class ArtService {
//    @PersistenceContext
//    private EntityManager em;
//
//    public List<Art> selectItems() {
//        TypedQuery<Art> q = em.createQuery("select a from Art a", Art.class);
//        return q.getResultList();
//    }
//
//    public void persist(Art art) {
//        em.persist(art);
//    }
//
//    public Art selectById(Long id) {
//        return em.find(Art.class, id);
//    }
//}
