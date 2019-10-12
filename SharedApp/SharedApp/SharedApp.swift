//
//  SharedApp.swift
//  SharedApp
//
//  Created by Joseph Hinkle on 10/11/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import Foundation

public typealias FullStackObject = FullStackObjectClass & FullStackObjectPrototype

public protocol FullStackObjectPrototype {
    static var databaseCollectionName: String { get }
}

public class FullStackObjectClass {
    
    public enum Permissions {
        case read
        case write
        case create
        case delete
    }
    
    public class FullStackProperty<T> {
       
        private let databasePropertyName: String
        private let previousDatabasePropertyNames: [String] = []
        private let isDeprecated: Bool = false
        private let publicPermissions: [Permissions] = []
        public var localValue: T?
        
        public init( databasePropertyName: String ) {
            self.databasePropertyName = databasePropertyName
        }
    }
    
    //
    
    //
    public init() {

    }
    
    public typealias FullStackString = FullStackProperty<String>
    public typealias FullStackInt = FullStackProperty<Int>
    public typealias FullStackBool = FullStackProperty<Bool>
}




public class User: FullStackObject {
    // setup
    static public var databaseCollectionName = "User"
    
    // properties
    public var username = FullStackString( databasePropertyName: "username")
    
    public init(username: String) {
//        self.username =
//        self.username.localValue
    }
}

