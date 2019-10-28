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

//extension FullStackObjectPrototype {
//}

public enum Permissions {
    case read
    case update
    case create
    case delete
}

public class FullStackProperty<T: Any> {
    
    enum PropertyAvailability {
        case available
        case legacy
        case deprecated
        case obsolete
        case invisible
    }
   
    private let _databasePropertyName: String
    public var databasePropertyName: String { return _databasePropertyName }
    private let previousDatabasePropertyNames: [String] = []
    private var availability: PropertyAvailability = .available
    private var publicPermissions: [Permissions] = []
    private var isPrimaryKey: Bool = false
    private var isUnique: Bool = false
    public var value: T?
    
    public init( databasePropertyName: String ) {
        self._databasePropertyName = databasePropertyName
    }
    
    
    func sync( completion: (String) -> () ) {
        completion("asdf")
    }
    
    
    ///
    public func primaryKey() -> FullStackProperty<T> {
        self.isPrimaryKey = true
        self.isUnique = true
        return self
    }
    
    ///
    public func setPublicPermission( permissions: [Permissions] ) -> FullStackProperty<T> {
        self.publicPermissions = permissions
        return self
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

public typealias FullStackString = FullStackProperty<String>
public typealias FullStackInt = FullStackProperty<Int>
public typealias FullStackBool = FullStackProperty<Bool>

public struct FullStackProperties {
    public let strings: [FullStackString]
    public let ints: [FullStackInt]
    public let bools: [FullStackBool]
}

public class FullStackObjectClass {
    
    //
    private var _docId: String?
    public var docId: String? {
        return _docId
    }
    
    //
    public required init() {

    }
    
    
    public static func getListOfFullStackProperties() -> FullStackProperties {
        let temp = Self()
        var strings: [FullStackString] = []
        var ints: [FullStackInt] = []
        var bools: [FullStackBool] = []
        
        let mirror = Mirror(reflecting: temp)
        
        let anyProperties = mirror.children.compactMap{ $0 }
        for anyProperty in anyProperties {
            if let val = anyProperty.value as? FullStackString {
                strings.append(val)
            } else if let val = anyProperty.value as? FullStackInt {
                ints.append(val)
            } else if let val = anyProperty.value as? FullStackBool {
                bools.append(val)
            }
        }
        return FullStackProperties(strings: strings, ints: ints, bools: bools)
    }
    
    public func isAssociatedWithServerDoc() -> Bool {
        return _docId != nil
    }
    
    
//    public static func query( predicate: String, completion: ([FullStackObject], String?, Any.Type) -> () ) {
//        let type = self
//        completion( [], nil, type )
//    }
    
}




