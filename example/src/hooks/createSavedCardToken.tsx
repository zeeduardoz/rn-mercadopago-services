import React, { useState } from 'react';
import { Text, TouchableOpacity, View } from 'react-native';

import { createCardTokenBySaved } from 'rn-mercadopago-services';

import { hooksStyles } from '../styles';
import { CARD_TOKEN_SAVED } from './mock';

export const CreateCardTokenBySaved = () => {
  const [result, setResult] = useState<string>('');

  const handleExample = async () => {
    try {
      const response = await createCardTokenBySaved(
        CARD_TOKEN_SAVED.cardId,
        CARD_TOKEN_SAVED.securityCode
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
      <Text style={hooksStyles.title}>Create Card Token by Saved</Text>
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
