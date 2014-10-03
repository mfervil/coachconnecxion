package com.fervil.spring.careercoach.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CareerCoachConfig {
    private static final Logger logger = LoggerFactory.getLogger(CareerCoachConfig.class);
	
	private static String databaseVendor;

	public static String getDatabaseVendor()  throws Exception {
		return databaseVendor;
	}

	public void setDatabaseVendor(String databaseVendor)  throws Exception {
		CareerCoachConfig.databaseVendor = databaseVendor;
	}
}