//
//  SharedAppConfig.swift
//  SharedApp
//
//  Created by Joseph Hinkle on 10/27/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

public class SharedAppConfig {
    
    public static let shared = SharedAppConfig()
    private var serverDb: MongoDbDelegate?
    
    private init() { }
    
    public func setDb( serverDb: MongoDbDelegate ) {
        self.serverDb = serverDb
    }
}
