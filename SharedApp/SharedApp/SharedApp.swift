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
    public init() {

    }
}

public protocol FullStackObjectPrototype {
    static var Database_Collection_Name: String { get }
}



public class User: FullStackObject {
    // setup
    static public var Database_Collection_Name = "User_Collection"
    
    // properties
    public var username: String
    
    public init(username: String) {
        self.username = username
    }
}
