//
//  SharedAppConfig.swift
//  SharedApp
//
//  Created by Joseph Hinkle on 10/27/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

public class SharedAppConfig {
    
    public static let shared = SharedAppConfig()
    
    private var _serverDb: ServerDatabaseDelegate?
    public static var serverDb: ServerDatabaseDelegate {
        // if _serverDb is not setup, then it isn't possible to run the server
        return shared._serverDb!
    }
    
    private init() { }
    
    public func setDb( serverDb: ServerDatabaseDelegate ) {
        self._serverDb = serverDb
    }
}
