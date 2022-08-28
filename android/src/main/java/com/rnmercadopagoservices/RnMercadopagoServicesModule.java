package com.rnmercadopagoservices;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

import com.mercadopago.android.px.model.CardToken;
import com.mercadopago.android.px.model.SavedCardToken;
import com.mercadopago.android.px.model.Token;
import com.mercadopago.android.px.model.exceptions.ApiException;
import com.mercadopago.android.px.services.Callback;
import com.mercadopago.android.px.services.MercadoPagoServices;

@ReactModule(name = RnMercadopagoServicesModule.NAME)
public class RnMercadopagoServicesModule extends ReactContextBaseJavaModule {
    public static final String NAME = "RnMercadopagoServices";
    private final ReactApplicationContext reactContext;
    private String _publicKey;
    private String _privateKey;
    private MercadoPagoServices _mercadoPagoServices;

    public RnMercadopagoServicesModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
        this._publicKey = "null";
        this._privateKey = "null";
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    @ReactMethod
    public void setPreferences(String publicKey, String privateKey) {
      this._privateKey = privateKey;
      this._publicKey = publicKey;

      this._mercadoPagoServices = new MercadoPagoServices(this.reactContext, publicKey, privateKey);
    }

    @ReactMethod
    public void createCardToken(String cardNumber, Integer cardExpirationMonth, Integer cardExpirationYear, String securityCode, String cardholderName, String identificationType, String identificationNumber, Promise promise) {
      CardToken form = new CardToken(
        cardNumber,
        cardExpirationMonth,
        cardExpirationYear,
        securityCode,
        cardholderName,
        identificationType,
        identificationNumber
      );

      _mercadoPagoServices.createToken(form, new Callback<Token>() {
        @Override
        public void success(Token token) {
          promise.resolve(token.toJson());
        }

        @Override
        public void failure(ApiException apiException) {
          promise.reject(apiException.getMessage());
        }
      });
    }

    @ReactMethod
    public void createCardTokenBySaved(String cardId, String securityCode, Promise promise) {
      SavedCardToken form = new SavedCardToken(
        cardId,
        securityCode
      );

      _mercadoPagoServices.createToken(form, new Callback<Token>() {
        @Override
        public void success(Token token) {
          promise.resolve(token.toJson());
        }

        @Override
        public void failure(ApiException apiException) {
          promise.reject(apiException.getMessage());
        }
      });
    }

}
