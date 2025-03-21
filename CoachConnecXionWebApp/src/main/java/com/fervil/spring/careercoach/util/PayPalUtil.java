package com.fervil.spring.careercoach.util;

import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Address;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.CreditCard;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.FundingInstrument;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.core.rest.OAuthTokenCredential;

public class PayPalUtil  {

	public static String[] getToken() throws Exception {
		String accessToken = "";
		String [] tokens = null;
		
			OAuthTokenCredential tokenCredential =
				  new OAuthTokenCredential("AdkLnhDXJ8BVd0AnUKarR2Q3uLXCVxaWgl9UP1hFKgYV4c7QGWnfWoJCobmO", "EBcw5hCLB6XLmkNIVO-Swk97sduHy6D9pVQ76v2dW6TGbIcoKqZVwTf3uArp");
		
			
			
			accessToken = tokenCredential.getAccessToken();
			
			tokens = accessToken.split(" ");
			
			createPayment(accessToken);
			return tokens;
	}
	
	public static void createPayment(String accessToken) throws Exception {
//TODO remove the dummy card information		
//		try{
			Address billingAddress = new Address();
			billingAddress.setLine1("");
			billingAddress.setCity("");
			billingAddress.setCountryCode("");
			billingAddress.setPostalCode("");
			billingAddress.setState("");
	
			CreditCard creditCard = new CreditCard();
			creditCard.setNumber("");
			creditCard.setType("");
			creditCard.setExpireMonth(04);
			creditCard.setExpireYear(2001);
			creditCard.setCvv2("");
			creditCard.setFirstName("");
			creditCard.setLastName("");
			creditCard.setBillingAddress(billingAddress);
/*
 								  2061363695379808518
			creditCard.setNumber("5589671008243855");
			creditCard.setType("mastercard");
			creditCard.setExpireMonth(12);
			creditCard.setExpireYear(2015);
			creditCard.setCvv2("969");
			creditCard.setFirstName("Marc");
			creditCard.setLastName("Fervil");
			creditCard.setBillingAddress(billingAddress);
*/

//TODO Make sure static payments and information not being passed.
			
			Details amountDetails = new Details();
			amountDetails.setSubtotal("5.41");
			amountDetails.setTax("0.03");
			amountDetails.setShipping("0.03");
	
			Amount amount = new Amount();
			amount.setTotal("5.47");
			amount.setCurrency("USD");
			amount.setDetails(amountDetails);
					
			Transaction transaction = new Transaction();
			transaction.setAmount(amount);
			transaction.setDescription("This is the payment transaction description.");
	
			List<Transaction> transactions = new ArrayList<Transaction>();
			transactions.add(transaction);
	
			FundingInstrument fundingInstrument = new FundingInstrument();
			fundingInstrument.setCreditCard(creditCard);
	
			List<FundingInstrument> fundingInstruments = new ArrayList<FundingInstrument>();
			fundingInstruments.add(fundingInstrument);
	
			Payer payer = new Payer();
			payer.setFundingInstruments(fundingInstruments);
			payer.setPaymentMethod("credit_card");

			RedirectUrls redirectUrs = new RedirectUrls();
			redirectUrs.setReturnUrl("http://www.yahoo.com");
			redirectUrs.setCancelUrl("http://www.google.com");
			
			Payment payment = new Payment();
			payment.setIntent("sale");
			payment.setPayer(payer);
			payment.setRedirectUrls(redirectUrs);
			payment.setTransactions(transactions);
	
			Payment createdPayment = payment.create(accessToken );
	}

	
	public void executePayment(String accessToken, String payerId) throws Exception {
		
			Payment payment = Payment.get(accessToken, payerId);
		
			PaymentExecution paymentExecution = new PaymentExecution();
			paymentExecution.setPayerId("");
		
			Payment newPayment = payment.execute(accessToken, paymentExecution);
	}
	
}
