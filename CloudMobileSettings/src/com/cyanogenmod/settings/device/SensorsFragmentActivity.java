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
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;

public class SensorsFragmentActivity extends PreferenceFragment {

    private static final String TAG = "CMParts_General";

    private static final String FILE_GPU = "/sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/limit_mode";
    private static final String FILE_DISPLAY = "/sys/class/graphics/fb0/eco_mode";

    private static final boolean sHasEcoGPU = Utils.fileExists(FILE_GPU);
    private static final boolean sHasEcoDisplay = Utils.fileExists(FILE_DISPLAY);

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.sensors_preferences);

        PreferenceCategory prefs = (PreferenceCategory) findPreference(DeviceSettings.CATEGORY_ECO);
        if (!sHasEcoGPU) {
            prefs.removePreference(findPreference(DeviceSettings.KEY_ECO_GPU));
        }
        if (!sHasEcoDisplay) {
            prefs.removePreference(findPreference(DeviceSettings.KEY_ECO_DISPLAY));
        }
        if (prefs.getPreferenceCount() == 0) {
            getPreferenceScreen().removePreference(prefs);
        }
    }

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {

        String boxValue;
        String key = preference.getKey();

        Log.w(TAG, "key: " + key);

        if (key.compareTo(DeviceSettings.KEY_ECO_GPU) == 0) {
            Utils.writeValue(FILE_GPU, ((CheckBoxPreference)preference).isChecked() ? "1" : "0");
        } else if (key.compareTo(DeviceSettings.KEY_ECO_DISPLAY) == 0) {
            Utils.writeValue(FILE_DISPLAY, ((CheckBoxPreference)preference).isChecked() ? "1" : "0");
        }

        return true;
    }

    public static void restore(Context context) {
        //SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);

    }
}
