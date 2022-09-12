#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RnMercadopagoServices, NSObject)

RCT_EXTERN_METHOD(getDevice: (RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

@end
