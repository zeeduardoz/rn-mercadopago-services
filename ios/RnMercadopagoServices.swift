import MercadoPagoDevicesSDK

@objc(RnMercadopagoServices)
class RnMercadopagoServices: NSObject {

  @objc(getDevice:rejecter:)
  func getDevice(_ resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    MercadoPagoDevicesSDK.shared.execute()
    let json = try MercadoPagoDevicesSDK.shared.getInfoAsJsonString()
    resolve(json)
  }
}
