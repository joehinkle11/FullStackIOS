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
    @State private var selection = 0
    
    let documentOptions: [(String, FullStackObject.Type?)] = [
        ("None", nil),
        ("User", User.self)
    ]
    
    var body: some View {
        VStack {
            Text("Welcome to the Full Stack iOS demo!")
                .bold()
                .font(.title)
            Divider()
            Spacer()
            
            Picker(selection: $selection, label: Text("Select a document")) {
                ForEach(0 ..< documentOptions.count) {
                    Text(self.documentOptions[$0].0).tag($0)
                }
            }
            
            selectionView()
        }
    }
    
    func selectionView() -> AnyView {
        if let selectedDocumentType = documentOptions[selection].1 {
            return AnyView(VStack {
                Text("Selection: \(documentOptions[selection].0)")
                
                TextField("username", text: $username)
                    .frame(width: 100)
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
                Spacer()
            })
        } else {
            return AnyView(Spacer())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
