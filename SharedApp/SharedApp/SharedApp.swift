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
        
        public enum PropertyAvailability {
            /// property is fully serviced by the backend
            case available
            /// property is only serviced  by the backend when it already exists on an object in the database, and will throw warnings when used in the frontend
            case legacy
            /// property is fully serviced by the backend, but will throw warnings when used in the frontend
            case deprecated
            /// property is never serviced by the backend, and will throw errors when used in the frontend
            case obsolete
            /// property is never serviced by the backend, but will not through warnings or errors when used in the frontend
            case invisible
        }
       
        private let databasePropertyName: String
        private let previousDatabasePropertyNames: [String] = []
        private var availability: PropertyAvailability = .available
        private let publicPermissions: [Permissions] = []
        public var value: T?
        
        public init( databasePropertyName: String ) {
            self.databasePropertyName = databasePropertyName
        }
        
        
        
        /// property is fully serviced by the backend
        public func available() -> FullStackProperty<T> {
            self.availability = .deprecated
            return self
        }
        /// property is only serviced  by the backend when it already exists on an object in the database, and will throw warnings when used in the frontend
        public func legacy() -> FullStackProperty<T> {
            self.availability = .legacy
            return self
        }
        /// property is fully serviced by the backend, but will throw warnings when used in the frontend
        public func deprecated() -> FullStackProperty<T> {
            self.availability = .deprecated
            return self
        }
        /// property is never serviced by the backend, and will throw errors when used in the frontend
        public func obsolete() -> FullStackProperty<T> {
            self.availability = .obsolete
            return self
        }
        /// property is never serviced by the backend, but will not through warnings or errors when used in the frontend
        public func invisible() -> FullStackProperty<T> {
            self.availability = .invisible
            return self
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
    public var superPower = FullStackString( databasePropertyName: "superPower").deprecated()
    
    public init(username: String) {
        
    }
}

