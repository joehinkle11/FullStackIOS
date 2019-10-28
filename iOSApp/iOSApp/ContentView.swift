//
//  ContentView.swift
//  iOSApp
//
//  Created by Joseph Hinkle on 10/11/19.
//  Copyright © 2019 Joseph Hinkle. All rights reserved.
//

import SwiftUI
import SharedApp2



struct ContentView: View {
    
    @State private var documentTypeSelectedId = 0
    @State private var documentSelected: FullStackObject?
    
    let documentOptions: [FullStackObject.Type] = [User.self, PowerUp.self]
    
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
            descriptionView()
            Divider()
            selectionView()
            Spacer()
        }
    }
    
    func descriptionView() -> AnyView {
        let selectedDocumentType = documentOptions[documentTypeSelectedId]
        let properties = selectedDocumentType.getListOfFullStackProperties()
        let strings = String(describing: properties.strings.map { property -> String in
            return property.databasePropertyName
        })
        let ints = String(describing: properties.bools.map { property -> String in
            return property.databasePropertyName
        })
        let bools = String(describing: properties.bools.map { property -> String in
            return property.databasePropertyName
        })
        return AnyView(VStack (alignment: .leading, spacing: 15) {
            Text("Strings:\t\(strings)")
            Text("Ints:\t\t\(ints)")
            Text("Bools:\t\t\(bools)")
        })
    }
    
    func selectionView() -> AnyView {
        let selectedDocumentType = documentOptions[documentTypeSelectedId]
        return AnyView(VStack (spacing: 15) {
            Text("Query for documents in \"\(selectedDocumentType.databaseCollectionName)\"")
                .font(.title)
            
//            TextField("", text: <#T##Binding<String>#>)
            
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
            
            Divider()
            
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
