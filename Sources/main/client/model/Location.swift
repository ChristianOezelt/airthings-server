//
// Location.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Location: Codable {

    public var _id: String
    public var name: String
    public var labels: [String:String]

    public init(_id: String, name: String, labels: [String:String]) {
        self._id = _id
        self.name = name
        self.labels = labels
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case labels
    }

}