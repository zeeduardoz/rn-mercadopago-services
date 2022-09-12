//
//  DeviceId.swift
//  Devices
//
//  Created by Franco Cuevas on 2/26/20.
//

import Foundation
import UIKit

open class Location: NSObject, Codable {
    open var longitude: Double!
    open var latitude: Double!

    public init(longitude: Double, latitude: Double!) {
        self.longitude = longitude
        self.latitude = latitude
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

    open class func fromJSONToLocation(data: Data) throws -> Location {
        return try JSONDecoder().decode(Location.self, from: data)
    }

    open class func fromJSON(data: Data) throws -> [Location] {
        return try JSONDecoder().decode([Location].self, from: data)
    }
}
