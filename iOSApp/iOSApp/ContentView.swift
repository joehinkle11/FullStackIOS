//
//  ContentView.swift
//  iOSApp
//
//  Created by Joseph Hinkle on 10/11/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import SwiftUI
import SharedApp

var stuff = User(username: "asdf" )
struct ContentView: View {
    var body: some View {
        Text("Hello World \(stuff.Database_Collection_Name)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
