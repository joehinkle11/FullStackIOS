//
//  ContentView.swift
//  iOSApp
//
//  Created by Joseph Hinkle on 10/11/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import SwiftUI
import SharedApp2

var stuff = User(username: "asdf" )


//let test: [User] = User.query( predicate: "asdf")


let user = User(username: "john")
//user.superPower = "asd"


struct ContentView: View {
    var body: some View {
        Text("Hello World \(User.databaseCollectionName)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
