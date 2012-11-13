package com.dmha.communicator;

import org.apache.cordova.DroidGap;

import android.util.Log;
import android.webkit.WebView;

public class Information {

	/**
	 * Variable que almacenará el nombre de usuario
	 */
	private String userId = "";
	private WebView mAppView;
	private DroidGap mGap;

	public Information(DroidGap gap, WebView view) {
		mAppView = view;
		mGap = gap;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}