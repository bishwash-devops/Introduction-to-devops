package com.bishwash.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class AppUtil {
	public Properties getAppProperties() {
		Properties prop = new Properties();
		InputStream inputStream = DbUtil.class.getClassLoader().getResourceAsStream("/application.properties");
		try {
			prop.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return prop;
	}
}
