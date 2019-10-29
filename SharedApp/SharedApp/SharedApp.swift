//
//  SharedApp.swift
//  SharedApp
//
//  Created by Joseph Hinkle on 10/11/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import Alamofire

public typealias FullStackObject = FullStackObjectClass & FullStackObjectPrototype

public protocol FullStackObjectPrototype {
    init()
    static var databaseCollectionName: String { get }
}

extension FullStackObjectPrototype {
    public static func query( predicate: String, completion: ([Self]) -> () ) {
        FullStackObjectClass.query( type: Self.self, predicate: "" ) { list in
            completion(list as! [Self])
        }
    }
}

public enum Permissions {
    case read
    case update
    case create
    case delete
}

public class FullStackProperty<T> {
    
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
    
    
    public func sync( completion: (String) -> () ) {
        completion("success!")
    }
    
    public func set( value: T?, immediatelySyncWithCompletion: ((String) -> ())? = nil ) {
        self.value = value
        if let completion = immediatelySyncWithCompletion {
            self.sync(completion: completion)
        }
    }
    
    public func get() -> T? {
        return self.value
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

public class FullStackObjectClass: Identifiable {
    
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
    
    public static func query( type: FullStackObjectPrototype.Type, predicate: String, completion: ([FullStackObjectPrototype]) -> () ) {
        let databaseCollectionName = type.databaseCollectionName
        // look through db collection "databaseCollectionName" for documents matching the predicate then call the completion
        completion( [type.init()] )
    }
    
    public func jsonify() -> String {
        let properties = type(of: self).getListOfFullStackProperties()
        return ""
    }
    
    ///
    /// CRUD IMPLEMENTATION BELOW
    ///
    
    /// Create a new document on the server. Fails if a document with a matching unique key already exists. Fails immediately if object is already associated with a document on the server.
    public func createOnServer( completion: (String) -> () ) {
        if self.isAssociatedWithServerDoc() {
            // fail!
        } else {
            // success
            AF.download("https://www.google.com/")
//            AF.request("https://httpbin.org/get").responseJSON { response in
//                debugPrint("Response: \(response)")
//            }
//            SharedAppConfig.serverDb
        }
    }
    
    /// Downloads the document associated with this from the server. Fails immediately if object is NOT associated with a document on the server.
    public func readFromServer( updateLocalCopyOnSuccess: Bool = true, completion: (String) -> () ) {
        if self.isAssociatedWithServerDoc() {
            // success
        } else {
            // fail!
        }
    }
    
    /// Update document on the server associated with this object. Fails immediately if object is NOT associated with a document on the server.
    public func updateToServer( completion: (String) -> () ) {
        if self.isAssociatedWithServerDoc() {
            // success
        } else {
            // fail!
        }
    }
    
    /// Delete document on the server associated with this object. Fails immediately if object is NOT associated with a document on the server.
    public func deleteOnServer( completion: (String) -> () ) {
        if self.isAssociatedWithServerDoc() {
            // success
        } else {
            // fail!
        }
    }
    
}



public struct Query<T: FullStackObjectClass> {
    public let db: T
    public let matchingProperties: FullStackProperties
}

