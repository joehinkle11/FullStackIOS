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
    
    let documentOptions: [FullStackObject.Type] = [
        User.self
    ]
    
    var body: some View {
        VStack {
            Text("Welcome to the Full Stack iOS demo!")
                .bold()
                .font(.largeTitle)
            Divider()
            Text("Select a document type")
                .font(.title)
            Picker(selection: $documentTypeSelectedId, label: Text("Select a document")) {
                ForEach(0 ..< documentOptions.count) {
                    Text(String(describing: self.documentOptions[$0])).tag($0)
                }
            }
                .pickerStyle(SegmentedPickerStyle())
            Divider()
            selectionView()
            Spacer()
        }
    }
    
    func selectionView() -> AnyView {
        let selectedDocumentType = documentOptions[documentTypeSelectedId]
        let selectedDocumentName = String(describing: selectedDocumentType)
        return AnyView(VStack (alignment: .leading, spacing: 15) {
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
                    .background((documentSelected == nil) ? Color.green.opacity(0.5) : Color.green)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke((documentSelected == nil) ? Color.green.opacity(0.5) : Color.green, lineWidth: 5)
                    )
                }
                .disabled(documentSelected == nil)
                
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
                    .background((documentSelected == nil) ? Color.red.opacity(0.5) : Color.red)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke((documentSelected == nil) ? Color.red.opacity(0.5) : Color.red, lineWidth: 5)
                    )
                }
                .disabled(documentSelected == nil)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
