import React, { useState } from 'react';
import { Text, TouchableOpacity, View } from 'react-native';

import { createCardToken } from 'rn-mercadopago-services';

import { hooksStyles } from '../styles';
import { CARD_INFO } from './mock';

export const CreateCardToken = () => {
  const [result, setResult] = useState<string>('');

  const handleExample = async () => {
    try {
      const response = await createCardToken(
        CARD_INFO.cardNumber,
        CARD_INFO.expirationMonth,
        CARD_INFO.expirationYear,
        CARD_INFO.securityCode,
        CARD_INFO.cardholderName,
        CARD_INFO.identificationType,
        CARD_INFO.identificationNumber
      );

      if (typeof response !== 'string') setResult(response.id);
      if (typeof response === 'string') setResult(response);

      console.log(response);
    } catch (err: any) {
      console.error(err.message);
      setResult(err.message);
    }
  };

  return (
    <View style={hooksStyles.container}>
      <Text style={hooksStyles.title}>Create Card Token</Text>
      <Text style={hooksStyles.result}>Result: {result}</Text>
      <TouchableOpacity
        style={hooksStyles.button}
        onPress={handleExample}
        activeOpacity={0.85}
      >
        <Text>Create</Text>
      </TouchableOpacity>
    </View>
  );
};
