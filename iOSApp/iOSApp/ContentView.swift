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
    
    @State private var documentTypeSelectedId = 0
    @State private var documentSelected: FullStackObject?
    
    let documentOptions: [(String, FullStackObject.Type?)] = [
        ("None", nil),
        ("User", User.self)
    ]
    
    var body: some View {
        VStack {
            Text("Welcome to the Full Stack iOS demo!")
                .bold()
                .font(.largeTitle)
            Divider()
            Picker(selection: $documentTypeSelectedId, label: Text("Select a document")) {
                ForEach(0 ..< documentOptions.count) {
                    Text(self.documentOptions[$0].0).tag($0)
                }
            }
            selectionView()
        }
    }
    
    func selectionView() -> AnyView {
        if let selectedDocumentType = documentOptions[documentTypeSelectedId].1 {
            let selectedDocumentName = documentOptions[documentTypeSelectedId].0
            return AnyView(VStack {
                Text("Selection: \(selectedDocumentName)")
                    .font(.title)
                
                Text("databaseCollectionName: \"\(selectedDocumentType.databaseCollectionName)\"")
                
//                TextField("username", text: $username)
//                    .frame(width: 100)
                HStack (alignment: .center, spacing: 10) {
                    Button(action: {
//                        self.message = "test"
                    }) {
                        Text("Create")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.green, lineWidth: 5)
                        )
                    }
                    Button(action: {
//                        self.message = "test"
                    }) {
                        Text("Query")
                        .fontWeight(.bold)
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
                    Button(action: {
//                        self.message = "test"
                    }) {
                        Text("Delete")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.red, lineWidth: 5)
                        )
                    }
                }
                
                
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
