# MercadoPago's Devices SDK for iOS

## What is this for?

The MercadoPago's Devices SDK for iOS makes it easy to obtain the device fingerprinting information.
You should send this information when processing a payment with MercadoPago so we can use it to help you avoid rejected payments or chargebacks.
For more details about this, visit the [developers guide](https://developers.mercadopago.com). 

## Requirements

This module currently supports **iOS 10.0+**, with _Swift_ or _Objective-C_.

## Installation

MercadoPago's Devices SDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MercadoPagoDevicesSDK"
```

## Usage

To import this module you have to do the following:

**Swift**
```swift
import MercadoPagoDevicesSDK
```

**Objective-C**
```smalltalk
@import MercadoPagoDevicesSDK;
```

To use the module, there are only two steps.

First, you have to initialize the SDK when the app opens.
For this you should include in the `AppDelegate`'s `didFinishLaunchingWithOptions` method the following line.

**Swift**
```swift
MercadoPagoDevicesSDK.shared.execute()
```

**Objective-C**
```smalltalk
[[MercadoPagoDevicesSDK shared] execute];
```

Then, when the user arrives to the checkout you can execute **one** the following methods to retrieve the device fingerprinting information.

**Swift**
```swift
MercadoPagoDevicesSDK.shared.getInfo() // Returns a Device object with the info, this class is a Codable class
MercadoPagoDevicesSDK.shared.getInfoAsJson() // returns a Data object from JSON library
MercadoPagoDevicesSDK.shared.getInfoAsJsonString() // returns a String object with the infomation encoded as JSON
MercadoPagoDevicesSDK.shared.getInfoAsDictionary() // returns a Dictionary<String,Any> object
```

**Objective-C**
```smalltalk
[[[MercadoPagoDevicesSDK] shared] getInfoAsJson] // returns a Data object from JSON library
[[[MercadoPagoDevicesSDK] shared] getInfoAsJsonString] // returns a String object with the infomation encoded as JSON
[[[MercadoPagoDevicesSDK] shared] getInfoAsDictionary] // returns a Dictionary<String,Any> object
```

## Examples

We include two examples of the usage of this SDK, one in `Swift` and one in `Objective-C`.

## Author

Devices Team, device@mercadolibre.com

## License

Mercado Pago's Devices SDK is available under the MIT license. See the LICENSE file for more info.
