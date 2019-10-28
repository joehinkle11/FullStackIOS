//
//  User.swift
//  SharedApp
//
//  Created by Joseph Hinkle on 10/27/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import Foundation


public class User: FullStackObject {
    
    // setup
    static public var databaseCollectionName = "User"
    
    // properties
    public var username = FullStackString( databasePropertyName: "username")
        .setPublicPermission(permissions: [.read,.update])
    public var superPower = FullStackString( databasePropertyName: "superPower")
        .deprecated()
        .setPublicPermission(permissions: [.read])
    
    public var test = ""

    public required init() {
        
    }
}
