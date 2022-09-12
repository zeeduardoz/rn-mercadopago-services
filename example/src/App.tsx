import React from 'react';

import { Text, ScrollView } from 'react-native';

import { CreateCardToken } from './hooks/createCardToken';

import { mainStyles } from './styles';

export default function App() {
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
      {/* ---------------------- */}
    </ScrollView>
  );
}
