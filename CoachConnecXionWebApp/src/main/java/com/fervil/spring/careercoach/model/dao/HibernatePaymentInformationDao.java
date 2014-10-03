package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import javax.imageio.spi.ServiceRegistry;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.context.internal.ThreadLocalSessionContext;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.fervil.spring.careercoach.model.domain.CoachingRequest;
import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.web.CoachSelectionFormController;

@Repository
public class HibernatePaymentInformationDao implements PaymentInformationDao {

	@Autowired
	private SessionFactory sessionFactory;
	private ServiceRegistry serviceRegistry;
	
    private static final Logger log = LoggerFactory.getLogger(CoachSelectionFormController.class);
	
	public void store(PaymentInformation paymentInformation) throws Exception {

		
		try {
			/*
			tx.begin();
			session.saveOrUpdate(CoachingRequest);
			
			tx.commit();
			*/

			sessionFactory.getCurrentSession().saveOrUpdate(paymentInformation);
			
		} catch (Exception e) {
			//tx.rollback();			
			throw e;
		} //finally {
			//session.close();
		//}
	}

	@Override
	public void delete(long id) {
	}

	@Override
	public List<PaymentInformation> findAll() {
		return null;
	}

	@Override
	public PaymentInformation findById(long id) {
		return null;
	}
	
	@Override
	public List<PaymentInformation> findByCoachUserId(long coachUserId)  throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					PaymentInformation.class);
			
			//crit.add(Restrictions.eq("user_user_id", coachUserId));
			crit.addOrder(Order.desc("userProfileId"));
			List list = crit.list();
			return ((List<PaymentInformation>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}
	
	public List<PaymentInformation> findPurchasedPackages(long coachUserProfileId)  throws Exception {

		try {
			// session.beginTransaction();
			
			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					PaymentInformation.class);
			
			String sql = " Select pi.email , pi.phone_Number1, pi.phone_Number2 "
			+ ", pi.phone_Number3 , pi.first_Name "
			+ ", pi.last_Name, pi.street1 "
			+ ", pi.street2 "
			+ ",  pi.city "
			+ ", pi.state "
			+ ", pi.zip, pi.order_Description, pi.package_Price "
			+ ", pi.expiration_Month_Value, pi.expiration_Year_Value, pi.state_Value "
			+ ", pi.package_Name , pi.currentdate "
			+ " from packagedetails pd, payment_information pi "
			+ " Where pd.id = pi.package_Id "
			+ " and pd.profileId = " + coachUserProfileId
			+ " order by pi.currentdate desc";

/*			
			String sql = " Select userProfileId , phone, displayName "
			+ ", userProfileType , user_user_id "
			+ ", accountType, email "
			+ ", coachingcategory1 "
			+ ",  coachingcategory2 "
			+ ", coachingcategory3 "
			+ ", industryfocus1, industryfocus2, industryfocus3 "
			+ ", companyexperience1, companyexperience2, companyexperience3 "
			+ ", address , apartment, city "
			+ ", state, zipcode=, overview "
			+ ", overview, serviceDescription "
			+ ", skillsExpertise " 
			+ ", summaryOfHighestPosition "
			+ ", companyOfHighestPosition "
			+ ", hourlyRate, paymentTerms "
			+ ", paymentTerms, keywords "
			+ ", modifiedDate , coaching_category "
			+ ", company_experience "
			+ ", firstname , middleinitial "
			+ ", lastname, language "
			+ ", countryname "
			+ ", profilepicture, profile_picture_type "
			+ ", profile_picture_name, video_url "
			+ " from PackageDetails pd, PaymentInformation pi "
			+ " Where pd.id = pi.packageId "
			+ " and pd.profileId = " + coachUserProfileId;		
*/			
			
			log.info(" HibernatePaymentInformation:findPurchasedPackages " + sql);

			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql); 
			
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List list = query.list();
		    log.info(" Number of Purchases found: " + list.size());
		    
			return ((List<PaymentInformation>) list);

		} catch (Exception e) {
			// tx.rollback();
			throw e;
		}
	}
	
}
