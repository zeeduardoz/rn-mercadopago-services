//
//  DeviceId.swift
//  Devices
//
//  Created by Franco Cuevas on 2/26/20.
//

import Foundation
import UIKit

open class DeviceId: NSObject, Codable {
    open var name: String!
    open var value: String!

    public init(name: String, value: String) {
        self.name = name
        self.value = value
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

    open class func fromJSONToDeviceId(data: Data) throws -> DeviceId {
        return try JSONDecoder().decode(DeviceId.self, from: data)
    }

    open class func fromJSON(data: Data) throws -> [DeviceId] {
        return try JSONDecoder().decode([DeviceId].self, from: data)
    }
}
