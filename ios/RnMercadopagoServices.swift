@objc(RnMercadopagoServices)
class RnMercadopagoServices: NSObject {

  @objc(getDevice:withResolver:withRejecter:)
  func getDevice(resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)

    do {
      
    } catch let error {
      reject(error.localizedDescription)
    }
  }
}
