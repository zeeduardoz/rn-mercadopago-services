# rn-mercadopago-services

[![NPM Version](https://img.shields.io/npm/v/rn-mercadopago-services.svg)](http://npmjs.com/package/rn-mercadopago-services)
[![Downloads](https://img.shields.io/npm/dt/rn-mercadopago-services.svg)](http://npmjs.com/package/rn-mercadopago-services)
[![License](https://img.shields.io/apm/l/vim-mode)](https://github.com/zeeduardoz/rn-mercadopago-services)

Serving all MercadoPago users who use react native in their application, the gateway in turn does not have support for react native and the community is very small, so we created a lib using the native services of MercadoPago to make it easier in react native.

---

## 📲 Installation

```sh
npm install rn-mercadopago-services

yarn add rn-mercadopago-services
```

---

## 🌟 Usage

```js
// Example get Card Token for payments checkout transparent ...

import { CardToken } from 'rn-mercadopago-services';

const response = await CardToken(
  publicKey,
  cardNumber,
  expirationMonth,
  expirationYear,
  securityCode,
  cardholderName,
  identificationType,
  identificationNumber
);
```

---

## ❤️ Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.<br>

---

## 📚 License

MIT license. Copyright (c) 2022 - Jose Eduardo<br>
For more information, see the LICENSE file.
