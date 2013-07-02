/*
 * Copyright (C) 2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import java.io.File;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;
import android.preference.Preference.OnPreferenceChangeListener;

public class TSFragmentActivity extends PreferenceFragment {

    private static final String TAG = "CMParts_General";

    private static final String FILE_TS = "/sys/Touch/sensitivity";

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.touchscreen_preferences);

        OnPreferenceChangeListener onPreferenceChangeListener = new OnPreferenceChangeListener() {
 
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                Utils.writeValue(FILE_TS, (String) newValue);
                return true;
            }
       };		
		
		ListPreference p = (ListPreference) getPreferenceManager().findPreference("ts_sensitivity");
		p.setOnPreferenceChangeListener(onPreferenceChangeListener);
    }

    // @Override
    // public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {

        // Utils.writeValue(FILE_TS, ((ListPreference)preference).getValue());

        // return true;
    // }

}
