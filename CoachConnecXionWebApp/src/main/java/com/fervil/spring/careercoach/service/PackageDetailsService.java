package com.fervil.spring.careercoach.service;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.AccountSummaryPackage;
import com.fervil.spring.careercoach.model.domain.PackageDetails;
import com.fervil.spring.careercoach.vo.CustomerPackagesVO;

/**
 * Service for processing Persons
 * 
 */
@Service("packageDetailsService")
@Transactional
public class PackageDetailsService {
    private static final Logger logger = LoggerFactory.getLogger(PackageDetailsService.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	public List<AccountSummaryPackage> getPackageSummaryById(long userProfileId)  throws Exception {
		logger.debug("Retrieving all Packages");
		
		String package_Select = "select a.id AS id, a.packageName AS packageName, a.price AS price, a.optOutDays AS optOutDays, "
				+ " a.PROFILEID AS profileid, (select count(b.id) from packages_sold b where a.id = b.package_details_id) AS totalsold "
				+ " from packagedetails a  where profileid = " + userProfileId + " order by a.packageName Desc";
		
		Session session = sessionFactory.getCurrentSession();
		List<AccountSummaryPackage> package1=new ArrayList<AccountSummaryPackage>();
			//SQLQuery query = session.createSQLQuery("select id,packageName,price,optOutDays,totalsold from package_info where profileid = " + userProfileId + " order by id Desc");
			SQLQuery query = session.createSQLQuery(package_Select);
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List data = query.list();
			for (Object object : data) {
				Map row = (Map) object;				
				package1.add(new AccountSummaryPackage(row.get("id"),row.get("packageName").toString(),row.get("price"),0,row.get("totalsold")));

			}
			return package1;
	}

	public PackageDetails get(Integer id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		PackageDetails packageDetails = (PackageDetails) session.get(
				PackageDetails.class, id);
		return packageDetails;
	}
	
	public List<PackageDetails> getPackagesByProfileId(long profileId)  throws Exception {
		logger.debug("Retrieving all Packages by profileId");
		Session session = sessionFactory.getCurrentSession();
		List<PackageDetails> packages=new ArrayList<PackageDetails>();
			SQLQuery query = session.createSQLQuery("select id, profileid, packageName,category, subCategory, price,overView, packageDetail, optOutDays from packagedetails where profileId = " + profileId + " order by id Desc");
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List data = query.list();
			for (Object object : data) {
				Map row = (Map) object;		
				try{
				packages.add(new PackageDetails((Integer)row.get("id"), ((BigInteger)row.get("profileid")).longValue() , row.get("packageName").toString(), 0,
						0,(Float)row.get("price"), row.get("overView").toString(), row.get("packageDetail").toString() , "0" ));
				} catch(Exception e){} //If a package cannot be added for some reason because of bad data, ignore it and continue.
			}
			return packages;
	}
	
	public void add(PackageDetails packageDetails)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		session.save(packageDetails);
	}

	public void delete(Integer id)  throws Exception {
		logger.debug("Deleting existing person");
		Session session = sessionFactory.getCurrentSession();
		PackageDetails packageDetails = (PackageDetails) session.get(
				PackageDetails.class, id);
		session.delete(packageDetails);
	}

	public void edit(PackageDetails packageDetails)  throws Exception {
		logger.debug("Editing existing Package");
		Session session = sessionFactory.getCurrentSession();
		PackageDetails existingPackage = (PackageDetails) session.get(
				PackageDetails.class, packageDetails.getId());

		existingPackage.setPackageName(packageDetails.getPackageName());
		existingPackage.setCategoryIndex(packageDetails.getCategoryIndex());
		existingPackage.setSubcategoryIndex(packageDetails
				.getSubcategoryIndex());
		existingPackage.setPriceValue(packageDetails.getPriceValue());
		existingPackage.setOverView(packageDetails.getOverView());
		existingPackage.setPackageDetails(packageDetails.getPackageDetails());
		existingPackage.setOptOutDays(packageDetails.getOptOutDays());

		session.save(existingPackage);
	}
	public Integer totalClientCount(long profileId)  throws Exception {
		Session session = sessionFactory.getCurrentSession();		
		int count = 0;
			Query query = session.createQuery("SELECT DISTINCT clientId FROM  PackagesSold where profileId = " + profileId );
			List results = query.list();				
			return results.size();
	}
	
	public ArrayList<CustomerPackagesVO> getUserPackages(long userId)  throws Exception {
		Session session = sessionFactory.getCurrentSession();		
		ArrayList<CustomerPackagesVO> packageList = new ArrayList<CustomerPackagesVO>();
		
		CustomerPackagesVO cust = null;
		
			Query query = session.createQuery("SELECT pd.id, " +  // 0
					" pd.packageName, " + // 1
					" pd.priceValue, " + // 2
					" pi.orderdate, " + // 3
					" up.displayName, " + // 4
					" up.user_user_id, " + // 5
					" up.userProfileId, " + // 6
					" up.email, " + // 7
					" up.phone, " + // 8
					" pi.packageId, " + // 9
					" pi.id " + // 10
					" from PackageDetails pd, PaymentInformation pi, UserProfile up, UserEntity u " +
					" where pd.profileId = up.userProfileId " +  //What user the package belongs to
				    " and pi.packageId = pd.id " + 	//what specific package was payment made for
					" and u.email = pi.email " +
					" and u.id  = " + userId +
					" order by pi.orderdate desc ");
			
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);

			List data = query.list();
			String dateText = "";
			
			for (Object object : data) {
				Map row = (Map) object;		 
				try{ 
					
					Date myDate = (Date)row.get("3");
					SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
					dateText = format.format(myDate);	
					
					//Sequence in VO:: String packagename, float price, String orderdate,
					// String displayname, long clientId, long userProfileId, String email, String phone, long packageId
					
					cust = 	new CustomerPackagesVO(row.get("1")==null?"":row.get("1").toString(), // package name
							row.get("2")==null?0:((Float)row.get("2")).floatValue(), // price value
							row.get("3")==null?"":dateText, // order date
							row.get("4")==null?"":row.get("4").toString(), // display name 
							row.get("5")==null?0:((Long)row.get("5")).longValue(), // user id associated with the profile
							row.get("6")==null?0:((Long)row.get("6")).longValue(), // package detail id
							row.get("7")==null?"":row.get("7").toString(),  // email id
							row.get("8")==null?"":row.get("8").toString(), // phone
							row.get("9")==null?0:((Integer)row.get("9")).intValue(), // Package id							
							row.get("10")==null?0:((Long)row.get("10")).longValue() // paymentId
							); 

					packageList.add(cust);
					
				} catch(Exception e){
					logger.error(" An Exception occured: " + e.toString());
				} //If a customer package cannot be added for some reason because of bad data, ignore it and continue.
			}
			return packageList;
			
	}
	
	
}