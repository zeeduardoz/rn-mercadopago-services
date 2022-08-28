import { NativeModules, Platform } from 'react-native';

import type { ICardToken, IPrivateKey, IPublicKey } from './@types/mercadopago';

const LINKING_ERROR =
  `The package 'rn-mercadopago-services' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const RnMercadopagoServices = NativeModules.RnMercadopagoServices
  ? NativeModules.RnMercadopagoServices
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export const setPreferences = (
  public_key: IPublicKey,
  private_key: IPrivateKey
) => {
  return RnMercadopagoServices.setPreferences(public_key, private_key);
};

export const createCardToken = async (
  cardNumber: string,
  expirationMonth: number,
  expirationYear: number,
  securityCode: string,
  cardholderName: string,
  identificationType: string,
  identificationNumber: string
): Promise<ICardToken | string> => {
  try {
    const response = await RnMercadopagoServices.createCardToken(
      cardNumber,
      expirationMonth,
      expirationYear,
      securityCode,
      cardholderName,
      identificationType,
      identificationNumber
    );
    return response;
  } catch (err: any) {
    return err.message;
  }
};

export const createCardTokenBySaved = async (
  cardId: string,
  securityCode: string
): Promise<ICardToken | string> => {
  try {
    const response = await RnMercadopagoServices.createCardTokenBySaved(
      cardId,
      securityCode
    );
    return response;
  } catch (err: any) {
    return err.message;
  }
};
