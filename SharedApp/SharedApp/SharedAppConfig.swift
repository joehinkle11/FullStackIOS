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
        


//        let user = User(username: "john")
        //user.superPower = "asd"
        func test() {
//            let stuff2 = Mirror(reflecting: User.self).children.compactMap{ $0.label }
//            print("he")
//            print(stuff2)
//            let stuff3 = Mirror(reflecting: User(username: "blah"))
            
//            print(stuff3.children.compactMap{ $0.label })
//            print("he")
            
            let things = User.getListOfFullStackProperties()
            
            print(things)
            print("things")
            
        }
        let thing = test()
    }
}
