//
//  SimulatedServerDb.swift
//  iOSApp
//
//  Created by Joseph Hinkle on 10/25/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import SharedApp2
import CouchbaseLiteSwift

class SimulatedServerDb: ServerDatabaseDelegate {
    
    // Couchbase Lite database
    let database: Database
    
    init( dbName: String ) {
        // Get the database (and create it if it doesn’t exist).
        do {
            database = try Database(name: dbName)
        } catch {
            fatalError("Error opening database")
        }
    }
    
    private func jsonToMutableDoc(json: String) -> MutableDocument {
        let mutableDoc = MutableDocument()
//        .setFloat(2.0, forKey: "version")
//        .setString("SDK", forKey: "type")
        return mutableDoc
    }
    
    func create(json: String) {
        
    }
    
    func read(json: String) {
        
    }
    
    func update(json: String) {
        
    }
    
    func delete(json: String) {
        
    }
    
    func query(json: String) {

    }
}
