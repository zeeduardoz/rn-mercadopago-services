#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RnMercadopagoServices, NSObject)

RCT_EXTERN_METHOD(getDevice:
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
