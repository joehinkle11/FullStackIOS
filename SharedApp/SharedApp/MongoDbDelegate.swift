//
//  MongoDbDelegate.swift
//  SharedApp
//
//  Created by Joseph Hinkle on 10/25/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import Foundation


public protocol ServerDatabaseDelegate: class {
    
    /// Initialize database
    init()
    
    /// Create new document
    func create( json: String )
    
    /// Read a document
    func read( json: String )
    
    /// Update a document
    func update( json: String )
    
    /// Delete a document
    func delete( json: String )
    
    /// Query for documents
    func query( json: String )
    
}
