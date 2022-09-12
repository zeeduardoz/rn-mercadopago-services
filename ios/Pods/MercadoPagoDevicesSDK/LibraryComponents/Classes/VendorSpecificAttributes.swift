//
//  VendorSpecificAttributes.swift
//  Devices
//
//  Created by Franco Cuevas on 2/26/20.
//

import Foundation
import UIKit
import MessageUI
import MobileCoreServices

open class VendorSpecificAttributes: NSObject, Codable {

    open var deviceIdiom: String?
    open var canSendSMS = true
    open var canMakePhoneCalls = true
    open var deviceLanguage: String?
    open var deviceModel: String?
    open var deviceName: String?
    open var deviceFamily: Int = DeviceFamily.DeviceFamilyUnknown.rawValue
    open var simulator = false
    open var platform: String = ""
    open var featureCamera = false
    open var featureFrontCamera = false
    open var featureFlash = false
    open var videoCameraAvailable = false
    open var retinaDisplayCapable = false
    open var cpuCount: UInt32?
    
    public enum DeviceFamily : Int {
        case DeviceFamilyiPhone = 0, DeviceFamilyiPod, DeviceFamilyiPad, DeviceFamilyAppleTV, DeviceFamilyUnknown
    }

    public override init() {
        super.init()
        let device: UIDevice = UIDevice.current

        if device.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            self.deviceIdiom = "Pad"
        } else {
            self.deviceIdiom = "Phone"
        }

        if Locale.preferredLanguages.count > 0 {
            self.deviceLanguage = Locale.preferredLanguages[0]
        }

        if !Utils.isNullOrEmpty(device.model) {
            self.deviceModel = device.model
        }

        if !Utils.isNullOrEmpty(device.name) {
            self.deviceName = device.name
        }
        
        self.canMakePhoneCalls = self.getCanMakePhoneCalls()
        self.canSendSMS = self.getCanSendSMS()
        
        self.platform = (try? Sysctl.string(forName: "hw.machine")) ?? ""
        self.featureCamera = self.getCameraAvailable()
        self.featureFrontCamera = self.getFrontCameraAvailable()
        self.featureFlash = self.getFlashAvailable()
        self.videoCameraAvailable = self.getVideoCameraAvailable()
        self.retinaDisplayCapable = self.getRetinaDisplayCapable()
        self.cpuCount = (try? Sysctl.value(ofType: UInt32.self, forName: "hw.ncpu")) ?? 0
        self.deviceFamily = self.getDeviceFamily().rawValue
        
        #if targetEnvironment(simulator)
            self.simulator = true
        #endif
        
    }
    
    func getCameraAvailable() -> Bool {
        if #available(iOS 4.0, *) {
            return UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        } else {
            return false
        }
    }
    
    func getFrontCameraAvailable() -> Bool {
        if #available(iOS 4.0, *) {
            return UIImagePickerController.isCameraDeviceAvailable(UIImagePickerController.CameraDevice.front)
        } else {
            return false
        }
    }
    
    func getFlashAvailable() -> Bool {
        if #available(iOS 4.0, *) {
            return UIImagePickerController.isFlashAvailable(for: UIImagePickerController.CameraDevice.rear)
        } else {
            return false
        }
    }
    
    func getVideoCameraAvailable() -> Bool {
        if #available(iOS 4.0, *) {
            let picker : UIImagePickerController = UIImagePickerController()
            let sourceTypes : Array =  UIImagePickerController.availableMediaTypes(for: picker.sourceType) ?? []
            let a = String(kUTTypeMovie)
            if (!sourceTypes.contains(a)) {
                return false
            }

            return true
        } else {
            return false
        }
    }
    
    func getCanMakePhoneCalls() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "tel://")!)
    }
    
    func getCanSendSMS() -> Bool {
        if #available(iOS 4.0, *) {
            return MFMessageComposeViewController.canSendText()
        } else {
            return UIApplication.shared.canOpenURL(URL(string: "sms://")!)
        }
    }
    
    func getRetinaDisplayCapable() -> Bool {
        var scale : CGFloat = CGFloat(1.0)
        let screen : UIScreen = UIScreen.main
        if screen.responds(to: #selector(NSDecimalNumberBehaviors.scale)) {
            scale = screen.scale
        }
        
        if scale == 2.0 {
            return true
        } else {
            return false
        }
    }
    
    func getDeviceFamily() -> DeviceFamily {
        let platform = self.platform
        if platform.hasPrefix("iPhone") {
            return DeviceFamily.DeviceFamilyiPhone
        }
        if platform.hasPrefix("iPod") {
            return DeviceFamily.DeviceFamilyiPod
        }
        if platform.hasPrefix("iPad") {
            return DeviceFamily.DeviceFamilyiPad
        }
        if platform.hasPrefix("AppleTV") {
            return DeviceFamily.DeviceFamilyAppleTV
        }
        
        return DeviceFamily.DeviceFamilyUnknown
    }

    public enum vendorSpecificAttributesKeys: String, CodingKey {
        case deviceIdiom = "device_idiom"
        case canSendSMS = "can_send_sms"
        case canMakePhoneCalls = "can_make_phone_calls"
        case deviceLanguage = "device_languaje"
        case deviceModel = "device_model"
        case deviceName = "device_name"
        case featureCamera = "feature_camera"
        case featureFrontCamera = "feature_front_camera"
        case featureFlash = "feature_flash"
        case videoCameraAvailable = "video_camera_available"
        case retinaDisplayCapable = "retina_display_capable"
        case cpuCount = "cpu_count"
        case deviceFamily = "device_family"
        case simulator
        case platform
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: vendorSpecificAttributesKeys.self)
        try container.encodeIfPresent(self.deviceIdiom, forKey: .deviceIdiom)
        try container.encode(self.canSendSMS, forKey: .canSendSMS)
        try container.encode(self.canMakePhoneCalls, forKey: .canMakePhoneCalls)
        try container.encodeIfPresent(self.deviceLanguage, forKey: .deviceLanguage)
        try container.encodeIfPresent(self.deviceModel, forKey: .deviceModel)
        try container.encodeIfPresent(self.deviceName, forKey: .deviceName)
        try container.encode(self.simulator, forKey: .simulator)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.featureCamera, forKey: .featureCamera)
        try container.encode(self.featureFrontCamera, forKey: .featureFrontCamera)
        try container.encode(self.featureFlash, forKey: .featureFlash)
        try container.encode(self.videoCameraAvailable, forKey: .videoCameraAvailable)
        try container.encode(self.retinaDisplayCapable, forKey: .retinaDisplayCapable)
        try container.encode(self.cpuCount, forKey: .cpuCount)
        try container.encode(self.deviceFamily, forKey: .deviceFamily)
    }

    open func toJSONString() throws -> String? {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        return String(data: data, encoding: .utf8)
    }

    open func toJSON() throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(self)
    }

    open class func fromJSON(data: Data) throws -> VendorSpecificAttributes {
        return try JSONDecoder().decode(VendorSpecificAttributes.self, from: data)
    }
}
