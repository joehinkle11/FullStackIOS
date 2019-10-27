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



let user = User(username: "john")
//user.superPower = "asd"


struct ContentView: View {
    @State var message = ""
    @State var username = "some"
    @State private var selection = 1
    
//    private
    
    var body: some View {
        VStack {
            TextField("username", text: $username)
                .frame(width: 100)
            
            
            Picker(selection: $selection, label: Text("Document Key")) {
                Text("User").tag(1)
                Text("Other?").tag(2)
            }

            Button(action: {
                self.message = "test"
            }) {
                Text("Add document!")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.purple)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
                )
            }
            
            
            Text(message)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
