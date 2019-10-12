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
    public init() {}
}

public protocol FullStackObjectPrototype {
    var prop: String { get set }
}



public class Test: FullStackObject {
    public var prop: String = "hi haha"
    
    
    
}
