//
// DeviceSimpleResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct DeviceSimpleResponse: Codable {

    public var _id: String
    public var deviceType: DeviceType
    public var segment: SegmentSimpleResponse

    public init(_id: String, deviceType: DeviceType, segment: SegmentSimpleResponse) {
        self._id = _id
        self.deviceType = deviceType
        self.segment = segment
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case deviceType
        case segment
    }

}
