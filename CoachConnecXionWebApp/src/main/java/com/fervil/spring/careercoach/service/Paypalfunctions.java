package com.fervil.spring.careercoach.service;

/**
 * Created by IntelliJ IDEA.
 * User: lhuynh
 * Date: Dec 6, 2007
 * Time: 5:06:52 PM
 * To change this template use File | Settings | File Templates.
 */

import java.net.URLDecoder.*;
import java.util.*;
import java.util.StringTokenizer.*;
import java.io.*;
import java.net.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fervil.spring.careercoach.model.dao.PaymentInformationDao;
import com.fervil.spring.careercoach.model.domain.PaymentInformation;

/*
import paypal.payflow.BillTo;
import paypal.payflow.CardTender;
import paypal.payflow.ClientInfo;
import paypal.payflow.Context;
import paypal.payflow.CreditCard;
import paypal.payflow.Currency;
import paypal.payflow.FraudResponse;
import paypal.payflow.Invoice;
import paypal.payflow.PayflowConnectionData;
import paypal.payflow.PayflowConstants;
import paypal.payflow.PayflowUtility;
import paypal.payflow.Response;
import paypal.payflow.SDKProperties;
import paypal.payflow.SaleTransaction;
import paypal.payflow.ShipTo;
import paypal.payflow.TransactionResponse;
import paypal.payflow.UserInfo;
*/

import paypal.payflow.*;

import paypal.payflow.Currency;
import ua.com.bitlab.springsecuritydemo.services.MailService;
import ua.com.bitlab.springsecuritydemo.services.SmtpMailService;

@Service
public class Paypalfunctions  {
    private static final Logger logger = LoggerFactory.getLogger(Paypalfunctions.class);
	
//TODO  This file needs to be cleaned up to remove all the System.out statements.
	
	
    private static final Logger log = LoggerFactory.getLogger(Paypalfunctions.class);
    
    @Autowired
    private SmtpMailService mailService;
    
	@Autowired
	private PaymentInformationDao paymentInformationDao;
	
    private String gv_APIUser;
    private String gv_APIPassword;
    private String gv_APIVendor;
    private String gv_APIPartner;

    private String gv_APIEndpoint;
    private String gv_BNCode;
	private String gv_Env;

    private String gv_nvpHeader;
    private String gv_ProxyServer;
    private String gv_ProxyServerPort;
	private String unique_id;
    private int gv_Proxy;
    private boolean gv_UseProxy;
    private String PAYPAL_URL;

    //public Paypalfunctions() {}
    
    public Paypalfunctions() throws Exception {//lhuynh - Actions to be Done on init of this class

    //BN Code is only applicable for partners
    gv_BNCode		= "PF-CCWizard";
    gv_APIUser		= "coachconnexion";
	//Fill in the gv_APIPassword variable yourself, the wizard will not do this automatically 
    gv_APIPassword	= "mncmar14";
    gv_APIVendor	= "coachconnexion";
    gv_APIPartner	= "PayPal";
	//gv_Env			= "pilot";
	gv_Env			= "production";
    unique_id		= "";

    //boolean bSandbox = true;

    /*
    Servers for NVP API
    Sandbox: https://pilot-payflowpro.paypal.com
    Live: https://payflowpro.paypal.com
    */

    /*
    Redirect URLs for PayPal Login Screen
    Sandbox: https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=XXXX
    Live: https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=XXXX
    */
    
    // Set the Request ID
    // Uncomment the line below and run two concurrent transactions to show how duplicate works.  You will notice on
    // the second transaction that the response returned is identical to the first, but the duplicate object will be set.
    // String strRequestID = "123456";
    // Comment out this line if testing duplicate response.
     
    String strRequestID = PayflowUtility.getRequestId();
  
    SDKProperties.setHostPort(443);
    SDKProperties.setTimeOut(45);
   
    // Logging is ON by default. To turn off logging comment out the following lines:
    //SDKProperties.setLogFileName("payflow_java.log");
    //SDKProperties.setLoggingLevel(PayflowConstants.SEVERITY_DEBUG);
    //SDKProperties.setMaxLogFileSize(10000000);
    
    // Log Stack Traces (boolean)
    //SDKProperties.setStackTraceOn(true);
     
    if ("pilot" == gv_Env)
    {
        SDKProperties.setHostAddress("pilot-payflowpro.paypal.com");
    }
    else
    {
        SDKProperties.setHostAddress("payflowpro.paypal.com");
    }
}

/*********************************************************************************
	* DirectPayment: Function to perform credit card transactions
	*
	* Inputs:
	*		paymentType: 		paymentType has to be one of the following values: Sale or Order
	*		paymentAmount:  	Total value of the shopping cart
	*		creditCardType		Credit card type has to one of the following values: Visa or MasterCard or Discover or Amex or Switch or Solo 
	*		creditCardNumber	Credit card number
	*		expDate				Credit expiration date
	*		cvv2				CVV2
	*		firstName			Customer's First Name
	*		lastName			Customer's Last Name
	*		street				Customer's Street Address
	*		city				Customer's City
	*		state				Customer's State				
	*		zip					Customer's Zip					
	*		countryCode			Customer's Country represented as a PayPal CountryCode
	*		currencyCode		Customer's Currency represented as a PayPal CurrencyCode
	*		orderdescription	Short textual description of the order
	*
	* Output: Returns a HashMap object containing the response from the server.
	*********************************************************************************/

public String[] ExecutePayment(String paymentType, PaymentInformation paymentInformation, String coachEmail)  throws Exception 
{
	
	String [] response = {"",""};
	
    String RespMsg = "";
    String strRequestID = PayflowUtility.getRequestId();
    UserInfo user = new UserInfo(gv_APIUser, gv_APIVendor, gv_APIPartner, gv_APIPassword);

    PayflowConnectionData connection = new PayflowConnectionData();

    Invoice inv = new Invoice();

    Currency amt = new Currency(new Double(paymentInformation.getPackagePrice()), "USD");
    
    inv.setAmt(amt);

    // PONum, InvNum and CustRef are sent to the processors and could show up on a customers
    // or your bank statement. These fields are reportable but not searchable in PayPal Manager.
    
/* 2/24/2014      */
    inv.setPoNum("CCXPO12345");
    inv.setInvNum("CCXINV12345");
    //inv.setCustRef("CustRef1");
    inv.setCustRef("CCXCUSTREF1");
    inv.setMerchDescr("CCX Merchant");
    inv.setMerchSvc("CCX Merchant Svc");

//    inv.setPoNum("POCCNXN1");
//    inv.setInvNum("INVCCNXN1");
//    inv.setCustRef("CUSTREFCCNXN1");
//    inv.setMerchDescr("CochConnecXion");
//    inv.setMerchSvc("Coaching Services");
    
    
    
    // Comment1 and Comment2 fields are searchable within PayPal Manager .
    // You may want to populate these fields with any of the above three fields or any other data.
    // However, the search is a case-sensitive and is a non-wildcard search, so plan accordingly.
    inv.setComment1("Comment1");
    inv.setComment2("Comment2");

    // Create the BillTo object.
    BillTo bill = new BillTo();

    // Set the customer name.
    bill.setFirstName("firstName");
    // bill.setMiddleName("M");
    bill.setLastName("lastName");
    //bill.setCompanyName("Joe's Hardware");
    
    // It is highly suggested that you pass at minimum Street and Zip for AVS response.
    // However, AVS is only supported by US banks and some foreign banks.  See the Payflow
    // Developer's Guide for more information.  Sending these fields could help in obtaining
    // a lower discount rate from your Internet merchant Bank.  Consult your bank for more information.

    bill.setStreet(paymentInformation.getStreet1());
    bill.setStreet(paymentInformation.getStreet2());

    // Secondary street address.
    //bill.setBillToStreet2(street2);

    bill.setCity(paymentInformation.getCity());
    bill.setState(paymentInformation.getState());
    bill.setZip(String.valueOf(paymentInformation.getZip()));
    // BillToCountry code is based on numeric ISO country codes. (e.g. 840 = USA)
    // For more information, refer to the Payflow Developer's Guide.
    //bill.setBillToCountry(paymentInformation.getCountryCode());
    bill.setBillToCountry("US");

    //bill.setPhoneNum("555-243-7689");
    // Secondary phone numbers (could be mobile number etc).
    // bill.BillToPhone2 = "222-222-2222";
    // bill.HomePhone = "555-123-9867";
    // bill.Fax = "555-343-5444";

    //bill.setEmail("Joe.Smith@anyemail.com");

    // Set the BillTo object into invoice.
    inv.setBillTo(bill);

    ShipTo ship;
    new ShipTo();
    
    ship = bill.copy();

    inv.setShipTo(ship);

    String expMonth = String.valueOf(paymentInformation.getExpirationMonth());
    if (expMonth.length() == 1 ) expMonth = "0" + expMonth;
    CreditCard cc = new CreditCard(paymentInformation.getCreditCardNumber1() + paymentInformation.getCreditCardNumber2() + paymentInformation.getCreditCardNumber3() + paymentInformation.getCreditCardNumber4(), expMonth + paymentInformation.getExpirationYear() );
    cc.setCvv2(String.valueOf(paymentInformation.getCvv2()));
    CardTender card = new CardTender(cc);  // credit card

    SaleTransaction trans = new SaleTransaction(user, connection, inv, card, strRequestID);

    /*
      Transaction results (especially values for declines and error conditions) returned by each PayPal-supported
      processor vary in detail level and in format. The Payflow Verbosity parameter enables you to control the kind
      and level of information you want returned.

      By default, Verbosity is set to LOW. A LOW setting causes PayPal to normalize the transaction result values.
      Normalizing the values limits them to a standardized set of values and simplifies the process of integrating
      the Payflow SDK.

      By setting Verbosity to MEDIUM, you can view the processor’s raw response values. This setting is more “verbose”
      than the LOW setting in that it returns more detailed, processor-specific information.

      Setting Verbosity to HIGH, returns the maximum data related to your transacion.  Items such as last 4-digits of
      the credit card, expiration date, amount, etc. are returned.

      Review the chapter in the Payflow Pro Developer's Guide regarding VERBOSITY and the INQUIRY function
      for more details.
    */

    // Set the transaction verbosity to HIGH.
    trans.setVerbosity("HIGH");

    // Create a new Client Information data object.
    ClientInfo clinfo = new ClientInfo();
    // Set the ClientInfo object of the transaction object.
    trans.setClientInfo(clinfo);

    // Submit the Transaction
    Response Resp = trans.submitTransaction();

    // Display the transaction response parameters.
    if (Resp != null)

    {
        // Get the Transaction Response parameters.
        TransactionResponse TrxnResponse = Resp.getTransactionResponse();

        // Refer to the Payflow Pro .NET API Reference Guide and the Payflow Pro Developer's Guide
        // for explanation of the items returned and for additional information and parameters available.
        if (TrxnResponse != null) {
        	// log.error("Transaction Failled: Result: " + TrxnResponse.getResult() + " First Name: " + TrxnResponse.getFirstName() + " Transaction Time: " + TrxnResponse.getTransTime() + " PNRef" + TrxnResponse.getPnref() + " Message: " + TrxnResponse.getRespMsg() + " AUTHCODE: " + TrxnResponse.getAuthCode() );

        	log.info("Transaction Response:");
        	log.info("Result Code (RESULT) = " + TrxnResponse.getResult());
        	log.info("Transaction ID (PNREF) = " + TrxnResponse.getPnref());
        	log.info("Response Message (RESPMSG) = " + TrxnResponse.getRespMsg());
        	log.info("Authorization (AUTHCODE) = " + TrxnResponse.getAuthCode());
        	log.info("Card Type = " + TrxnResponse.getCardType());
        	log.info("Billing Name (FIRSTNAME) = " + TrxnResponse.getFirstName());
        	log.info("------------------------------------------------------");
        	log.info("Verbosity Response:");
        	log.info("Processor AVS (PROCAVS) = " + TrxnResponse.getProcAvs());
        	log.info("Processor Result (HOSTCODE) = " + TrxnResponse.getHostCode());
        	log.info("Transaction Date/Time (TRANSTIME) = " + TrxnResponse.getTransTime());
        	log.info("Amount of Transaction (AMT) = " + TrxnResponse.getAmt());

        	
        	/* Feb 24/2014
            System.out.println("Transaction Response:");
            System.out.println("Result Code (RESULT) = " + TrxnResponse.getResult());
            System.out.println("Transaction ID (PNREF) = " + TrxnResponse.getPnref());
            System.out.println("Response Message (RESPMSG) = " + TrxnResponse.getRespMsg());
            System.out.println("Authorization (AUTHCODE) = " + TrxnResponse.getAuthCode());
            System.out.println("Street Address Match (AVSADDR) = " + TrxnResponse.getAvsAddr());
            System.out.println("Streep Zip Match (AVSZIP) = " + TrxnResponse.getAvsZip());
            System.out.println("International Card (IAVS) = " + TrxnResponse.getIavs());
            System.out.println("CVV2 Match (CVV2MATCH) = " + TrxnResponse.getCvv2Match());
            System.out.println("------------------------------------------------------");
            System.out.println("Credit Card Information:");
            System.out.println("Last 4-digits Credit Card Number (ACCT) = " + TrxnResponse.getAcct());
            
            if (TrxnResponse.getCardType() != null) {
                System.out.print("Card Type (CARDTYPE) = ");
                switch (Integer.parseInt(TrxnResponse.getCardType())) {
                    case 0:
                        System.out.println("MasterCard");
                        break;
                    case 1:
                        System.out.println("MasterCard");
                        break;
                    case 2:
                        System.out.println("MasterCard");
                        break;
                    case 3:
                        System.out.println("testing");
                        break;
                    case 4:
                        System.out.println("MasterCard");
                        break;
                    case 5:
                        System.out.println("MasterCard");
                        break;
                    case 6:
                        System.out.println("MasterCard");
                        break;
                }
            }
            
            System.out.println("Expiration Date (EXPDATE) = " + TrxnResponse.getExpDate());
            System.out.println("Billing Name (FIRSTNAME, LASTNAME) = " + TrxnResponse.getFirstName() +
                    " " + TrxnResponse.getLastName());
            System.out.println("------------------------------------------------------");
            System.out.println("Verbosity Response:");
            System.out.println("Processor AVS (PROCAVS) = " + TrxnResponse.getProcAvs());
            System.out.println("Processor CSC (PROCCVV2) = " + TrxnResponse.getProcCVV2());
            System.out.println("Processor Result (HOSTCODE) = " + TrxnResponse.getHostCode());
            System.out.println("Transaction Date/Time (TRANSTIME) = " + TrxnResponse.getTransTime());
            System.out.println("Amount of Transaction (AMT) = " + TrxnResponse.getAmt());
            */
        }

        // Get the Fraud Response parameters.
        // All trial accounts come with basic Fraud Protection Services enabled.
        // Review the PayPal Manager guide to set up your Fraud Filters prior to
        // running this sample code.
        // If Fraud Filters are not set, you will receive a RESULT code 126.
        FraudResponse FraudResp = Resp.getFraudResponse();
        if (FraudResp != null) {
        	log.info("------------------------------------------------------");
        	log.info("Fraud Response:");
        	log.info("Pre-Filters (PREFPSMSG) = " + FraudResp.getPreFpsMsg());
        	log.info("Post-Filters (POSTFPSMSG) = " + FraudResp.getPostFpsMsg());
        }

        // Was this a duplicate transaction?
        // If this value is true, then the orignal response of the orginal transaction will
        // be returned.  The transction type listed in Manager will be "N" and the Original
        // Transaction ID will be the PNREF of the original transaction.  The value would be
        // true if the Request ID of the Transaction Object has not been changed.
        log.info("------------------------------------------------------");
        log.info("Duplicate Response:");
        String DupMsg;
        if (TrxnResponse.getDuplicate() == null) {
            DupMsg = "Not a Duplicate Transaction";
        } else {
            DupMsg = "Duplicate Transaction";
        }
        log.info(("Duplicate Transaction (DUPLICATE) = " + DupMsg));

        /*
         Example of adding in business rules.  This is not an exhaustive list of failures or issues
         that could arise.  Review the list of Result Code's in the Developer's Guide and add logic as
         you deem necessary.

         These responses are just an example of what you can do and how you handle the response received
         from the bank is dependent on your business rules and needs.
        */

        // Evaluate Result Code
        if (TrxnResponse.getResult() < 0) { // Transaction failed.
            RespMsg = "There was an error processing your transaction. Please contact Customer Service." + "\nError: " + TrxnResponse.getResult();
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());
        } else if (TrxnResponse.getResult() == 1 || TrxnResponse.getResult() == 26) {
            // This is just checking for invalid login information.  You would not want to display this to your customers.
            //RespMsg = "Account configuration issue.  Please verify your login credentials.";
            RespMsg = "There was an error processing your transaction. Please contact Customer Service." + "\nError: " + TrxnResponse.getResult();
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());
        } else if (TrxnResponse.getResult() == 0) {
            RespMsg = "Your transaction was approved. Your coach will be contacting you to start your sessions.";
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());

            // Send the confirmation email to the user.
            try {
                mailService.sendMessage(paymentInformation.getEmail(), "CoachConnecXion: Payment Confirmation", 
                		"You purchased coaching package: " + paymentInformation.getPackageName() + " \n Package Price: $" + paymentInformation.getPackagePrice() +
                		" \n Your coach will be in touch with you within a week to start your coaching session(s)");
            } catch (Exception e) {
                String msg = "Failed to send confirmation email to purchaser for: " + paymentInformation.getEmail() + " Error " + e;
                paymentInformation.setEmail("Email Failled -- " + paymentInformation.getEmail() );
                log.error(msg, e);
            }     
           try {     
                mailService.sendMessage(coachEmail, "CoachConnecXion: New coaching request", 
                		"You received a request for coaching services.  Here are the details below: <br> <br>" +
                		"Pakage: " + paymentInformation.getPackageName() + " Package Price: $" + paymentInformation.getPackagePrice() +
                		"<br>Customer First Name: " + paymentInformation.getFirstName() + " Last Name: " + paymentInformation.getLastName() +
                		"<br>Phone: " + paymentInformation.getPhoneNumber1() + "-" + paymentInformation.getPhoneNumber2() + "-" + paymentInformation.getPhoneNumber3() +
                		"<br>Email: " + paymentInformation.getEmail());
                
            } catch (Exception e) {
                String msg = "Failed to send confirmation email to coach for: " + paymentInformation.getEmail() + " Error " + e;
                paymentInformation.setEmail("Email Failled -- " + paymentInformation.getEmail() );
                log.error(msg, e);
            }
            
            //Log the transaction
            log.info(" Details of successfull payment:  " + paymentInformation.toString() + " Email: " + paymentInformation.getEmail() + " PackageName: " + paymentInformation.getPackageName() + " PackagePrice: " + paymentInformation.getPackagePrice());

            try {
	            //Store the data to the database
	        	paymentInformationDao.store(paymentInformation);
            } catch (Exception e) {
                String msg = "Failed saving payment information to the dtatabase: " + paymentInformation.getEmail() + " Error " + e;
                log.error(msg, e);
            }

        } else if (TrxnResponse.getResult() == 12) { // Hard decline from bank.
            RespMsg = "Your transaction was declined.";
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());
        } else if (TrxnResponse.getResult() == 13) {  // Voice authorization required.
            RespMsg = "Your Transaction is pending. Contact Customer Service to complete your order.";
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());
        } else if (TrxnResponse.getResult() == 23 || TrxnResponse.getResult() == 24) { // Issue with credit card number or expiration date.
            RespMsg = "Invalid credit card information. Please re-enter.";
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());
        } else if (TrxnResponse.getResult() == 125) { // 125, 126 and 127 are Fraud Responses.
            // Refer to the Payflow Pro Fraud Protection Services User's Guide or Website Payments Pro Payflow Edition - Fraud Protection Services User's Guide.
            RespMsg = "Your Transactions has been declined. Contact Customer Service.";
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());
        } else if (TrxnResponse.getResult() == 126) { // Decline transaction if AVS fails.
            if ((!TrxnResponse.getAvsAddr().equals("Y") | !TrxnResponse.getAvsZip().equals("Y"))) {
                // Display message that transaction was not accepted.  At this time, you
                // could display message that information is incorrect and redirect user
                // to re-enter STREET and ZIP information.  However, there should be some sort of
                // 3 strikes your out check.
                RespMsg = "Your billing information does not match. Please re-enter.";
                response[1] = RespMsg;
                response[0] = String.valueOf(TrxnResponse.getResult());
            } else {
                RespMsg = "Your Transaction is Under Review. We will notify you via e-mail if accepted.";
                response[1] = RespMsg;
                response[0] = String.valueOf(TrxnResponse.getResult());
            }
        } else if (TrxnResponse.getResult() == 127) {
            RespMsg = "Your Transaction is Under Review. We will notify you via e-mail if accepted.";
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());
        } else { // Error occurred, display normalized message returned.
            RespMsg = TrxnResponse.getRespMsg();
            response[1] = RespMsg;
            response[0] = String.valueOf(TrxnResponse.getResult());
        }

        // Display Message
        log.info("------------------------------------------------------");
        log.info("User/System Response:");
        log.info("User Message (RESPMSG) = " + RespMsg);
        log.info("System Message (TRXNRESPONSE.RESPMSG) = " + TrxnResponse.getRespMsg());

        // Display the status response of the transaction.
        // This is just additional information and normally would not be used in production.
        // Your business logic should be built around the result code returned as shown above.
        log.info("------------------------------------------------------");
        log.info("Overall Transaction Status: " + PayflowUtility.getStatus(Resp));

        // Get the Transaction Context and check for any contained SDK specific errors (optional code).
        // This is not normally used in production.
        Context TransCtx = Resp.getContext();
        if (TransCtx != null && TransCtx.getErrorCount() > 0) {
            log.info("------------------------------------------------------");
            log.info("Transaction Context Errors: " + TransCtx);
        }
    }
    log.info("------------------------------------------------------");
    log.info("Press Enter to Exit ...");
    
	/*
		Make the call to PayPal to set the Express Checkout token
		If the API call succeded, then redirect the buyer to PayPal
		to begin to authorize payment.  If an error occured, show the
		resulting errors
	*/
    
	return response;
}
    
    
    
/*********************************************************************************
  * Not currently being used by CoachConnecXion
  *  
  * CallShortcutExpressCheckout: Function to perform the SetExpressCheckout API call
  *
  * Inputs:
  *		paymentAmount:  	Total value of the shopping cart
  *		currencyCodeType: 	Currency code value the PayPal API
  *		paymentType: 		paymentType has to be one of the following values: Sale or Order
  *		returnURL:			the page where buyers return to after they are done with the payment review on PayPal
  *		cancelURL:			the page where buyers return to when they cancel the payment review on PayPal
  *
  * Output: Returns a HashMap object containing the response from the server.
*********************************************************************************/
public HashMap CallShortcutExpressCheckout( String paymentAmount, String returnURL, String cancelURL)  throws Exception 
{

	/*
	'------------------------------------
	' The currencyCodeType and paymentType 
	' are set to the selections made on the Integration Assistant 
	'------------------------------------
	*/

	String currencyCodeType = "<CURRENCY_CODE>";
	String paymentType = "<PAYMENT_TYPE>";

    /*
    Construct the parameter string that describes the PayPal payment
    the varialbes were set in the web form, and the resulting string
    is stored in $nvpstr
    */
	String nvpstr = "&TENDER=P&ACTION=S";
	if ("Authorization" == paymentType)
	{
		nvpstr = nvpstr + "&TRXTYPE=A";
	}
	else /* sale */
	{
		nvpstr = nvpstr + "&TRXTYPE=S";
	}

    nvpstr = nvpstr + "&AMT=" + paymentAmount + "&RETURNURL=" + returnURL + "&CANCELURL=" + cancelURL + "&CURRENCY=" + currencyCodeType;

    /*
    Make the call to Payflow to get the Express Checkout token
    If the API call succeded, then redirect the buyer to PayPal
    to begin to authorize payment.  If an error occured, show the
    resulting errors
    */

	/* requires at least Java 5 */
	UUID uid = UUID.randomUUID();

    HashMap nvp = httpcall(nvpstr,uid.toString());
    String strAck = nvp.get("RESULT").toString();
    if(strAck !=null && strAck.equalsIgnoreCase("0"))
    {
        return nvp;
    }

    return null;
}

/*********************************************************************************
  * Not currently being used by CoachConnecXion
  *  
  * CallMarkExpressCheckout: Function to perform the SetExpressCheckout API call
  *
  * Inputs:
  *		paymentAmount:  	Total value of the shopping cart
  *		currencyCodeType: 	Currency code value the PayPal API
  *		paymentType: 		paymentType has to be one of the following values: Sale or Order or Authorization
  *		returnURL:			the page where buyers return to after they are done with the payment review on PayPal
  *		cancelURL:			the page where buyers return to when they cancel the payment review on PayPal
  *		shipToName:		the Ship to name entered on the merchant's site
  *		shipToStreet:		the Ship to Street entered on the merchant's site
  *		shipToCity:			the Ship to City entered on the merchant's site
  *		shipToState:		the Ship to State entered on the merchant's site
  *		shipToCountryCode:	the Code for Ship to Country entered on the merchant's site
  *		shipToZip:			the Ship to ZipCode entered on the merchant's site
  *		shipToStreet2:		the Ship to Street2 entered on the merchant's site
  *		phoneNum:			the phoneNum  entered on the merchant's site
  *
  * Output: Returns a HashMap object containing the response from the server.
*********************************************************************************/
public HashMap CallMarkExpressCheckout( String paymentAmount, String returnURL, String cancelURL, String shipToName, String 										shipToStreet, String shipToCity, String shipToState,
                                        String shipToCountryCode, String shipToZip, String shipToStreet2, String phoneNum)  throws Exception 
{
	/*
	'------------------------------------
	' The currencyCodeType and paymentType 
	' are set to the selections made on the Integration Assistant 
	'------------------------------------
	*/
	String currencyCodeType = "<CURRENCY_CODE>";
	String paymentType = "<PAYMENT_TYPE>";

    /*
    Construct the parameter string that describes the PayPal payment
    the variables were set in the web form, and the resulting string
    is stored in $nvpstr
    */
	String nvpstr = "&TENDER=P&ACTION=S";
	if ("Authorization" == paymentType)
	{
		nvpstr = nvpstr + "&TRXTYPE=A";
	}
	else /* sale */
	{
		nvpstr = nvpstr + "&TRXTYPE=S";
	}

    nvpstr = nvpstr + "ADDROVERRIDE=1&AMT=" + paymentAmount;
    nvpstr=nvpstr.concat("&CURRENCYCODE=" + currencyCodeType + "&RETURNURL=" + returnURL  + "&CANCELURL=" + cancelURL);
	
    nvpstr=nvpstr.concat("&SHIPTOSTREET=" + shipToStreet + "&SHIPTOSTREET2=" + shipToStreet2);
    nvpstr=nvpstr.concat("&SHIPTOCITY=" + shipToCity + "&SHIPTOSTATE=" + shipToState + "&SHIPTOCOUNTRY=" + shipToCountryCode);
    nvpstr=nvpstr.concat("&SHIPTOZIP=" + shipToZip);

    /*
    Make the call to PayPal to set the Express Checkout token
    If the API call succeded, then redirect the buyer to PayPal
    to begin to authorize payment.  If an error occured, show the
    resulting errors
    */

	/* requires at least Java 5 */
	UUID uid = UUID.randomUUID();

    HashMap nvp = httpcall(nvpstr,uid.toString());
    String strAck = nvp.get("RESULT").toString();
    if(strAck !=null && strAck.equalsIgnoreCase("0"))
    {
        return nvp;
    }

	return null;
}


/*********************************************************************************
  * Not currently being used by CoachConnecXion
  *  
  * GetShippingDetails: Function to perform the GetExpressCheckoutDetails API call
  *
  * Inputs:  None
  *
  * Output: Returns a HashMap object containing the response from the server.
*********************************************************************************/
public HashMap GetShippingDetails( String token)  throws Exception 
{
    /*
    Build a second API request to PayPal, using the token as the
    ID to get the details on the payment authorization
    */

	String nvpstr = "&TOKEN=" + token + "&TENDER=P&ACTION=G";
	if ("Authorization" == "<PAYMENT_TYPE>")
	{
		nvpstr = nvpstr + "&TRXTYPE=A";
	}
	else /* sale */
	{
		nvpstr = nvpstr + "&TRXTYPE=S";
	}

   /*
    Make the API call and store the results in an array.  If the
    call was a success, show the authorization details, and provide
    an action to complete the payment.  If failed, show the error
    */

	/* requires at least Java 5 */
	UUID uid = UUID.randomUUID();

    HashMap nvp = httpcall(nvpstr,uid.toString());
    String strAck = nvp.get("RESULT").toString();
    if(strAck !=null && strAck.equalsIgnoreCase("0"))
    {
        return nvp;
    }
    return null;
}

/*********************************************************************************
  * Not currently being used by CoachConnecXion
  *  
  * GetShippingDetails: Function to perform the DoExpressCheckoutPayment API call
  *
  * Inputs:  None
  *
  * Output: Returns a HashMap object containing the response from the server.
*********************************************************************************/
public HashMap ConfirmPayment( String token, String payerID, String finalPaymentAmount, String serverName)  throws Exception 
{

	/*
	'------------------------------------
	' The currencyCodeType and paymentType 
	' are set to the selections made on the Integration Assistant 
	'------------------------------------
	*/
	String currencyCodeType = "<CURRENCY_CODE>";
	String paymentType = "<PAYMENT_TYPE>";

  /*
    '----------------------------------------------------------------------------
    '----	Use the values stored in the session from the previous SetEC call
    '----------------------------------------------------------------------------
    */
	String nvpstr = "&TOKEN=" + token + "&TENDER=P&ACTION=D";
	if ("Authorization" == paymentType)
	{
		nvpstr = nvpstr + "&TRXTYPE=A";
	}
	else /* sale */
	{
		nvpstr = nvpstr + "&TRXTYPE=S";
	}

    nvpstr = nvpstr + "&PAYERID=" + payerID + "&AMT=" + finalPaymentAmount;
	
    nvpstr = nvpstr + "&CURRENCY=" + currencyCodeType + "&IPADDRESS=" + serverName;

 /*
    Make the call to PayPal to finalize payment
    If an error occured, show the resulting errors
  */
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////     MARC COMMENTED OUT THE LINE BELOW         //////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
	//String sessionuuid = session.getAttribute("unique_id");
	    
	if ("" == unique_id)
	{
		/* requires at least Java 5 */
		UUID uid = UUID.randomUUID();
		unique_id = uid.toString();
	}

    HashMap nvp = httpcall(nvpstr,unique_id);
    String strAck = nvp.get("RESULT").toString();
    if(strAck !=null && strAck.equalsIgnoreCase("0"))
    {
        return nvp;
    }
    return null;
    
}


/*********************************************************************************
	* DirectPayment: Function to perform credit card transactions
	*
	* Inputs:
	*		paymentType: 		paymentType has to be one of the following values: Sale or Order
	*		paymentAmount:  	Total value of the shopping cart
	*		creditCardType		Credit card type has to one of the following values: Visa or MasterCard or Discover or Amex or Switch or Solo 
	*		creditCardNumber	Credit card number
	*		expDate				Credit expiration date
	*		cvv2				CVV2
	*		firstName			Customer's First Name
	*		lastName			Customer's Last Name
	*		street				Customer's Street Address
	*		city				Customer's City
	*		state				Customer's State				
	*		zip					Customer's Zip					
	*		countryCode			Customer's Country represented as a PayPal CountryCode
	*		currencyCode		Customer's Currency represented as a PayPal CurrencyCode
	*		orderdescription	Short textual description of the order
	*
	* Output: Returns a HashMap object containing the response from the server.
	*********************************************************************************/
public HashMap DirectPayment(String paymentType, String paymentAmount, String creditCardType, String creditCardNumber, String expDate, String cvv2, String firstName, String lastName, String street, String city, String state, String zip, String countryCode, String currencyCode, String orderdescription)  throws Exception 
{
	/*
		'------------------------------------
		' The currencyCodeType and paymentType 
		' are set to the selections made on the Integration Assistant 
		'------------------------------------
		*/

	/*
		Construct the parameter string that describes the PayPal payment
		the variables were set in the web form, and the resulting string
		is stored in $nvpstr
		*/
	String nvpstr = "&TENDER=C";
	if ("Authorization" == paymentType)
	{
		nvpstr = nvpstr + "&TRXTYPE=A";
	}
	else /* sale */
	{
		nvpstr = nvpstr + "&TRXTYPE=S";
	}

	/* requires at least Java 5 */
	UUID uid = UUID.randomUUID();
		
	nvpstr = nvpstr + "&ACCT=" + creditCardNumber + "CVV2=" + cvv2 + "&EXPDATE=" + expDate + "&ACCTTYPE=" + creditCardType;
	nvpstr = nvpstr + "&AMT=" + paymentAmount + "&CURRENCY=" + currencyCode;
	nvpstr = nvpstr + "&FIRSTNAME=" + firstName + "&LASTNAME=" + lastName + "&STREET=" + street + "&CITY=" + city;
	nvpstr = nvpstr + "&STATE=" + state + "&ZIP=" + zip + "&COUNTRY=" + countryCode;
	nvpstr = nvpstr + "&INVNUM=" + uid.toString() + "&ORDERDESC=" + orderdescription;

	/*
		Make the call to PayPal to set the Express Checkout token
		If the API call succeded, then redirect the buyer to PayPal
		to begin to authorize payment.  If an error occured, show the
		resulting errors
		*/

	HashMap nvp = httpcall(nvpstr,uid.toString());

	String strAck = nvp.get("RESULT").toString();
	if(strAck !=null && strAck.equalsIgnoreCase("0"))
	{
		return nvp;
	}

	return null;
}

/*********************************************************************************
  * httpcall: Function to perform the API call to PayPal using API signature
  * 	@ methodName is name of API  method.
  * 	@ nvpStr is nvp string.
  * returns a NVP string containing the response from the server.
*********************************************************************************/
public HashMap httpcall(String nvpStr,String unique_id)  throws Exception 
{
    String agent = "Mozilla/4.0";
    String respText = "";
    HashMap nvp = null;   //lhuynh not used?

    //deformatNVP( nvpStr );
	String encodedData = "&PWD=" + gv_APIPassword + "&USER=" + gv_APIUser + "&VENDOR=" + gv_APIVendor + "&PARTNER=" + gv_APIPartner + nvpStr + "&BUTTONSOURCE=" + gv_BNCode;

    try
    {
        URL postURL = new URL( gv_APIEndpoint );
        HttpURLConnection conn = (HttpURLConnection)postURL.openConnection();

        // Set connection parameters. We need to perform input and output,
        // so set both as true.
        conn.setDoInput (true);
        conn.setDoOutput (true);

        // Set the content type we are POSTing. We impersonate it as
        // encoded form data
        conn.setRequestProperty("Content-Type", "text/namevalue");
        conn.setRequestProperty("User-Agent", agent );

        //conn.setRequestProperty( "Content-Type", type );
        conn.setRequestProperty( "Content-Length", String.valueOf( encodedData.length()) );
        conn.setRequestMethod("POST");

		// set the host header
		if (gv_Env == "pilot") 
		{
			conn.setRequestProperty("Host", "pilot-payflowpro.paypal.com");
		}
		else
		{
			conn.setRequestProperty("Host", "payflowpro.paypal.com");
		}

		conn.setRequestProperty("X-VPS-CLIENT-TIMEOUT", "45");
		conn.setRequestProperty("X-VPS-REQUEST-ID", unique_id);

        // get the output stream to POST to.
        DataOutputStream output = new DataOutputStream( conn.getOutputStream());
        output.writeBytes( encodedData );
        output.flush();
        output.close ();

        // Read input from the input stream.
        DataInputStream  in = new DataInputStream (conn.getInputStream());
        int rc = conn.getResponseCode();
        if ( rc != -1)
        {
            BufferedReader is = new BufferedReader(new InputStreamReader( conn.getInputStream()));
            String _line = null;
            while(((_line = is.readLine()) !=null))
            {
                respText = respText + _line;
            }
            nvp = deformatNVP( respText );
        }
        return nvp;
    }
    catch( IOException e )
    {
    	e.printStackTrace();
        // handle the error here
        return null;
    }
}

/*********************************************************************************
  * deformatNVP: Function to break the NVP string into a HashMap
  * 	pPayLoad is the NVP string.
  * returns a HashMap object containing all the name value pairs of the string.
*********************************************************************************/
public HashMap deformatNVP( String pPayload )
{
    HashMap nvp = new HashMap();
    StringTokenizer stTok = new StringTokenizer( pPayload, "&");
    while (stTok.hasMoreTokens())
    {
        StringTokenizer stInternalTokenizer = new StringTokenizer( stTok.nextToken(), "=");
        if (stInternalTokenizer.countTokens() == 2)
        {
            String key = stInternalTokenizer.nextToken();
            String value = stInternalTokenizer.nextToken();
            nvp.put( key.toUpperCase(), value );
        }
    }
    return nvp;
}

/*********************************************************************************
  * RedirectURL: Function to redirect the user to the PayPal site
  * 	token is the parameter that was returned by PayPal
  * returns a HashMap object containing all the name value pairs of the string.
*********************************************************************************/
public void RedirectURL( HttpServletResponse response, String token )  throws Exception 
{
    String payPalURL = PAYPAL_URL + token;

    //response.sendRedirect( payPalURL );
    response.setStatus(302);
    response.setHeader( "Location", payPalURL );
    response.setHeader( "Connection", "close" );
}



@Override
public String toString() {
	return "Paypalfunctions [gv_APIUser=" + gv_APIUser + ", gv_APIPassword="
			+ gv_APIPassword + ", gv_APIVendor=" + gv_APIVendor
			+ ", gv_APIPartner=" + gv_APIPartner + ", gv_APIEndpoint="
			+ gv_APIEndpoint + ", gv_BNCode=" + gv_BNCode + ", gv_Env="
			+ gv_Env + ", gv_nvpHeader=" + gv_nvpHeader + ", gv_ProxyServer="
			+ gv_ProxyServer + ", gv_ProxyServerPort=" + gv_ProxyServerPort
			+ ", unique_id=" + unique_id + ", gv_Proxy=" + gv_Proxy
			+ ", gv_UseProxy=" + gv_UseProxy + ", PAYPAL_URL=" + PAYPAL_URL
			+ "]";
}



//end class
}

