import { NativeModules, Platform } from 'react-native';

import type {
  ICardToken,
  ICardTokenByCardId,
  IPublicKey,
} from './@types/mercadopago';

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

export const CardToken = async (
  public_key: IPublicKey,
  cardNumber: string,
  expirationMonth: number,
  expirationYear: number,
  securityCode: string,
  cardholderName: string,
  identificationType: string,
  identificationNumber: string
): Promise<ICardToken | string> => {
  try {
    const device = await RnMercadopagoServices.getDevice();

    const body = {
      site_id: 'MLB',
      card_number: cardNumber,
      expiration_year: expirationYear,
      expiration_month: expirationMonth,
      security_code: securityCode,
      cardholder: {
        identification: {
          type: identificationType,
          number: identificationNumber,
        },
        name: cardholderName,
      },
      device,
    };

    const response = await fetch(
      `https://api.mercadopago.com/v1/card_tokens?public_key=${public_key}`,
      {
        method: 'POST',
        body: JSON.stringify(body),
      }
    );

    const data = await response.json();

    return data;
  } catch (err: any) {
    return err.message;
  }
};

export const CardTokenByCardId = async (
  public_key: IPublicKey,
  cardId: string,
  securityCode: string,
  cardholderName: string,
  identificationType: string,
  identificationNumber: string
): Promise<ICardTokenByCardId | string> => {
  try {
    const body = {
      cardId,
      cardholder: {
        identification: {
          type: identificationType,
          number: identificationNumber,
        },
        name: cardholderName,
      },
      security_code: securityCode,
    };

    const response = await fetch(
      `https://api.mercadopago.com/v1/card_tokens?public_key=${public_key}`,
      {
        method: 'POST',
        body: JSON.stringify(body),
      }
    );

    const data = await response.json();

    return data;
  } catch (err: any) {
    return err.message;
  }
};
