//
//  MercadoPagoDevicesSDK.swift
//  MercadoPagoDevicesSDK
//
//  Created by Franco Cuevas on 3/4/20.
//

import Foundation
import CoreLocation

@objc
open class MercadoPagoDevicesSDK : NSObject, CLLocationManagerDelegate {

    private static var sharedMercadoPagoDevicesSDK: MercadoPagoDevicesSDK = {
        let mercadoPagoDevicesSDK = MercadoPagoDevicesSDK()
        return mercadoPagoDevicesSDK
    }()
    
    private var manager: CLLocationManager
    private var device: Device
    private var location: Location?

    override private init() {
        manager = CLLocationManager()
        device = Device()
    }

    @objc public class var shared: MercadoPagoDevicesSDK {
        return sharedMercadoPagoDevicesSDK
    }
    
    func getDevice() -> Device {
        device = Device()
        device.fingerprint.location = location
        return device
    }
    
    public func getInfo() -> Device {
        return getDevice()
    }
    
    @objc public func getInfoAsJsonData() -> Data? {
        return (try? getDevice().toJSON()) ?? nil
    }
    
    @objc public func getInfoAsJsonString() -> String? {
        return (try? getDevice().toJSONString()) ?? nil
    }
    
    @objc public func getInfoAsDictionary() -> [String: Any]? {
        return (try? getDevice().toDictionary()) ?? nil
    }
    
    @objc public func execute() {
        if !CLLocationManager.locationServicesEnabled() || ![CLAuthorizationStatus.authorizedAlways, CLAuthorizationStatus.authorizedWhenInUse].contains(CLLocationManager.authorizationStatus()) {
            return
        }
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.startUpdatingLocation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.manager.stopUpdatingLocation()
        }
    }
    
    public func locationManager(_ mng: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.last {
            location = Location(longitude: newLocation.coordinate.latitude, latitude: newLocation.coordinate.longitude)
            print("update a \(location?.longitude),\(location?.latitude)")
        }
    }
    
}
