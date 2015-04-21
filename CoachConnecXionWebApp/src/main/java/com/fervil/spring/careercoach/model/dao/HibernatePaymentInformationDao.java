package com.fervil.spring.careercoach.model.dao;

import java.util.HashMap;
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

			//DO NOT SAVE THE CREDIT CARD INFORMATION TO DATABASE
			
			paymentInformation.setCreditCardNumber1("0");
			paymentInformation.setCreditCardNumber2("0");
			paymentInformation.setCreditCardNumber3("0");
			if (paymentInformation.getCreditCardNumber4() != null){
				paymentInformation.setCreditCardNumber4(paymentInformation.getCreditCardNumber4().substring(2) );
			}
			paymentInformation.setExpirationMonth(0);
			paymentInformation.setExpirationMonthValue("0");
			paymentInformation.setExpirationYear(0);
			paymentInformation.setExpirationYearValue("0");
			paymentInformation.setCvv2(0);
			
			sessionFactory.getCurrentSession().saveOrUpdate(paymentInformation);
			
		} catch (Exception e) {
			//tx.rollback();		
			e.printStackTrace();
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
			e.printStackTrace();
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
			
			String sql = " Select pi.id orderid, pi.email toemail, up.user_profile_id toprofileid, up.firstname tofirstname, up.display_name todisplayname "
					+ ", pd.PROFILEID fromprofileid, up1.email fromemail , up1.firstname fromfirstname, up1.display_name fromdisplayname "
					+ ", pi.phone_Number1, pi.phone_Number2  "
					+ ", pi.phone_Number3 , pi.first_Name  "
					+ ", pi.last_Name, pi.street1  "
					+ ", pi.street2  "
					+ ", pi.city  "
					+ ", pi.state  "
					+ ", pi.zip, pi.order_Description, pi.package_Price  "
					+ ", pi.expiration_Month_Value, pi.expiration_Year_Value, pi.state_Value  "
					+ ", pi.package_Name , pi.currentdate, pi.entrytype  "
					+ ", (select count(*) from message where toprofileid=" + coachUserProfileId + " and read_status=1 and orderid = pi.id) unreadmessages "  //find all unread messages coming to me
					+ " from packagedetails pd, payment_information pi, user_profile up, user_profile up1  "
					+ " Where pd.id = pi.package_Id  "
					+ " and up.email = pi.email  "
					+ " and up1.user_profile_id = pd.PROFILEID  "
					+ " and pi.entrytype in (0, 1) "
		 			+ " and pd.profileId = " + coachUserProfileId
					+ " order by pi.currentdate desc  ";
			
			log.info(" HibernatePaymentInformation:findPurchasedPackages " + sql);

			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql); 
			
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List list = query.list();
		    log.info(" Number of Purchases found: " + list.size());
		    
			return ((List<PaymentInformation>) list);

		} catch (Exception e) {
			e.printStackTrace();
			// tx.rollback();
			throw e;
		}
	}
	
	public List<HashMap> getPaymentRecordBypackageForUser(long packageId, String email) throws Exception {
		try {
			// session.beginTransaction();
			
			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					PaymentInformation.class);
			
			String sql = " Select pi.id, pi.email email  "
					+ ", pi.phone_Number1 phoneNumber1, pi.phone_Number2  phoneNumber2"
					+ ", pi.phone_Number3 phoneNumber3, pi.first_Name firstName "
					+ ", pi.last_Name lastName, pi.street1  "
					+ ", pi.street2  "
					+ ", pi.city  "
					+ ", pi.state  "
					+ ", pi.zip, pi.order_Description orderDescription, pi.package_Price packagePrice "
					+ ", pi.expiration_Month_Value expirationMonthValue, pi.expiration_Year_Value expirationYearValue, pi.state_Value stateValue "
					+ ", pi.package_Name packageName, pi.currentdate orderdate"
					+ " from payment_information pi  "
					+ " Where pi.package_id = " + packageId  
					+ " and pi.email = '" + email + "' "
					+ " and pi.entrytype = 1 "
					+ " order by pi.currentdate desc  ";
			
			log.info(" HibernatePaymentInformation:getPaymentRecordBypackageForUser " + sql);

			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql); 
			
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List list = query.list();
		    log.info(" Number of Purchases found: " + list.size());
		    
			return ((List<HashMap>) list);

		} catch (Exception e) {
			e.printStackTrace();
			// tx.rollback();
			throw e;
		}
		
	};
}
