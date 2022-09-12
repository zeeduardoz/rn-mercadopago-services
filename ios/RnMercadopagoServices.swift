import MercadoPagoDevicesSDK

@objc(RnMercadopagoServices)
class RnMercadopagoServices: NSObject {

  @objc(getDevice:withRejecter:)
  func getDevice(resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    do {
        MercadoPagoDevicesSDK.shared.execute()
        let json = MercadoPagoDevicesSDK.shared.getInfoAsJsonString()
        resolve(json)
    } catch let error {
        reject(error.localizedDescription)
    }
  }
}
