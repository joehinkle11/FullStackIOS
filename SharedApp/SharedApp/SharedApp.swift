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
    
//    public classFullStackProperty
    
    public enum Permissions {
        case read
        case write
        case create
        case delete
    }
    
    
    public class FullStackProperty {
        public let databasePropertyName: String
        public let previousDatabasePropertyNames: [String]
        public let isDeprecated: Bool
        public let publicPermissions: [Permissions]
        
        public init(
            databasePropertyName: String,
            previousDatabasePropertyNames: [String] = [],
            isDeprecated: Bool = false,
            publicPermissions: [Permissions] = []
        ) {
            self.databasePropertyName = databasePropertyName
            self.previousDatabasePropertyNames = previousDatabasePropertyNames
            self.isDeprecated = isDeprecated
            self.publicPermissions = publicPermissions
        }
    }
    
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
    public var username = FullStackProperty(
        databasePropertyName: "username",
        publicPermissions: [.read]
    )
    
    public init(username: String) {
//        self.username =
    }
}

