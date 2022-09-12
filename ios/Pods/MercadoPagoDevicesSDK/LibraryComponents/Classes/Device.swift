//
//  Device.swift
//  Devices
//
//  Created by Franco Cuevas on 2/26/20.
//

import Foundation

@objc
public class Device: NSObject, Codable {
    
    open var fingerprint: Fingerprint = Fingerprint()
    
    @objc public func toJSON() throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(self)
    }

    @objc public func toJSONString() throws -> String {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        let jsonString = String(data: data, encoding: .utf8)
        
        if let jsonString = jsonString {
            return jsonString
        }
        
        return ""
    }
    
    @objc public func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
