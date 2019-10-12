//
//  SharedApp.swift
//  SharedApp
//
//  Created by Joseph Hinkle on 10/11/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import Foundation

public typealias FullStackObject = FullStackObjectClass & FullStackObjectPrototype

public class FullStackObjectClass {
    
    public enum Permissions {
        case read
        case write
        case create
        case delete
    }
    
    public class FullStackProperty {
        
        
        
        
        public class FullStackValue {
//            var value: T
//
//            init( value: T) {
//                self.value = value
//            }
        }
        
        public enum FullStackValueTypes {
            case string
        }
        
        private static let FullStackValueTypesToSwiftTypes = [
            FullStackValueTypes.string: String.self
        ]
        
        public let databasePropertyName: String
        public let previousDatabasePropertyNames: [String] = []
        private let isDeprecated: Bool = false
        private let publicPermissions: [Permissions] = []
        private var type: FullStackValueTypes
        private var swiftType: Any.Type
        
        public init( type: FullStackValueTypes, databasePropertyName: String ) {
            self.databasePropertyName = databasePropertyName
            self.type = type
            if let swiftType = FullStackProperty.FullStackValueTypesToSwiftTypes[type] {
                self.swiftType = swiftType
            } else {
                fatalError("Unable to create FullStackProperty with databasePropertyName \"" + databasePropertyName + "\" because there an invalid FullStackValueTypes was provided")
            }
        }
    }
    
    //
//    public var
    
    //
    public init() {

    }
}

public protocol FullStackObjectPrototype {
    static var databaseCollectionName: String { get }
}



public class User: FullStackObject {
    // setup
    static public var databaseCollectionName = "User"
    
    // properties
    public var username = FullStackProperty( type: .string, databasePropertyName: "username")
    
    public init(username: String) {
//        self.username =
    }
}

