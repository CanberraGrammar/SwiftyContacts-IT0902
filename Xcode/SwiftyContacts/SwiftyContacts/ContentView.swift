//
//  ContentView.swift
//  SwiftyContacts
//
//  Created by MPP on 14/8/19.
//  Copyright © 2019 Matthew Purcell. All rights reserved.
//

import SwiftUI

struct Contact: Identifiable {
    let id: String
    let firstName: String
    let lastName: String
}

struct AddContactModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var firstName = ""
    @State var lastName = ""
    @Binding var contactArray: [Contact]
    
    var body: some View {
        
        NavigationView {
        
            HStack {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
            }
            
            .navigationBarTitle("Add Contact")
            .navigationBarItems(trailing:
            
                Button(action: {
                    
                    let newContact = Contact(id: UUID().uuidString, firstName: self.firstName, lastName: self.lastName)
                    
                    self.contactArray.append(newContact)
                    
                    // This only works on Beta 5
                    // self.presentationMode.value.dismiss()
                    
                }, label: {
                    Text("Save")
                })
                
            )
            
        }
        
    }
    
}

struct ContentView: View {
    
    @State var contactArray = [
        Contact(id: UUID().uuidString, firstName: "Robbie", lastName: "Magee"),
        Contact(id: UUID().uuidString, firstName: "Damo", lastName: "Dunkley"),
        Contact(id: UUID().uuidString, firstName: "Xander", lastName: "Phillips"),
        Contact(id: UUID().uuidString, firstName: "Dash1", lastName: "Brown-Rees"),
        Contact(id: UUID().uuidString, firstName: "Damo", lastName: "Smeh")
    ]
    
    @State var showAddContactModalView = false
    
    var body: some View {
        
        NavigationView {
        
            List(contactArray) { contact in
            
                HStack {
                    Text(contact.firstName)
                    Text(contact.lastName)
                        .bold()
                }
                
            }
         
        .navigationBarTitle("Swifty Contacts")
        .navigationBarItems(trailing:
            
            Button(action: {
                self.showAddContactModalView = true
            }, label: {
                Text("Add")
            })
                       
            )
            
        }
        
        .sheet(isPresented: $showAddContactModalView, content: {
            AddContactModalView(contactArray: self.$contactArray)
        })
        
    }
        
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
