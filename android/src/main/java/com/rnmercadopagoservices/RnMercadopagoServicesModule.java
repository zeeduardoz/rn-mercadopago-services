package com.rnmercadopagoservices;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

import com.mercadolibre.android.device.sdk.DeviceSDK;
import com.mercadolibre.android.device.sdk.domain.Device;

import java.util.Map;

@ReactModule(name = RnMercadopagoServicesModule.NAME)
public class RnMercadopagoServicesModule extends ReactContextBaseJavaModule {
    public static final String NAME = "RnMercadopagoServices";

    public RnMercadopagoServicesModule(ReactApplicationContext reactContext) {
        super(reactContext);
        DeviceSDK.getInstance().execute(reactContext);
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    @ReactMethod
    public void getDevice(Promise promise) {
      try {
        String json = DeviceSDK.getInstance().getInfoAsJsonString();
        promise.resolve(json);
      } catch (Exception exception) {
        promise.reject(exception.getMessage());
      }
    }
}
