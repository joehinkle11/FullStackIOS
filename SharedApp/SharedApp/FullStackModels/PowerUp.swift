//
//  PowerUp.swift
//  SharedApp
//
//  Created by Joseph Hinkle on 10/27/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import Foundation


public class PowerUp: FullStackObject {
    
    // setup
    static public var databaseCollectionName = "PowerUp"
    
    // properties
    public var name = FullStackString( databasePropertyName: "name")
        .setPublicPermission(permissions: [.read])
    public var expRequired = FullStackInt( databasePropertyName: "expRequired")
        .setPublicPermission(permissions: [.read])
    public var isMagicType = FullStackBool( databasePropertyName: "isMagicType")
        .setPublicPermission(permissions: [.read])

    public required init() {
        
    }
}
