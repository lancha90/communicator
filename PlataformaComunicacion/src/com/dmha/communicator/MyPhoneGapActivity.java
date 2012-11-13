package com.dmha.communicator;

import org.apache.cordova.DroidGap;
import android.os.Bundle;

public class MyPhoneGapActivity extends DroidGap {
	
	private Information information;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		
		super.onCreate(savedInstanceState);
		super.init();
		
		information = new Information(this, appView);
        appView.addJavascriptInterface(information, "information");
		
		super.loadUrl("file:///android_asset/www/login.html");
	}
}
