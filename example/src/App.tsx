import React, { useEffect } from 'react';

import { Text, ScrollView } from 'react-native';
import { setPreferences } from 'rn-mercadopago-services';

import { CreateCardToken } from './hooks/createCardToken';
import { CreateCardTokenBySaved } from './hooks/createSavedCardToken';

import { mainStyles } from './styles';
import PREFERENCES from './app.json';

export default function App() {
  useEffect(() => {
    setPreferences(PREFERENCES.publicKey, PREFERENCES.privateKey);
  }, []);

  return (
    <ScrollView
      showsHorizontalScrollIndicator={false}
      showsVerticalScrollIndicator={false}
      style={mainStyles.container}
    >
      <Text style={mainStyles.title}>React Native MercadoPago Services</Text>

      {/* ----------------------
              Services
      ---------------------- */}
      <CreateCardToken />
      <CreateCardTokenBySaved />
      {/* ---------------------- */}
    </ScrollView>
  );
}
