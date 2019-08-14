//
//  ContentView.swift
//  SwiftyContacts
//
//  Created by MPP on 14/8/19.
//  Copyright © 2019 Matthew Purcell. All rights reserved.
//

import SwiftUI

struct Contact {
    let firstName: String
    let lastName: String
}

let contactOne = Contact(firstName: "Robbie", lastName: "Magee")
let contactTwo = Contact(firstName: "Damo", lastName: "Dunkley")
let contactThree = Contact(firstName: "Xander", lastName: "Phillips")
let contactFour = Contact(firstName: "Dash1", lastName: "Brown-Rees")
let contactFive = Contact(firstName: "Damo", lastName: "Smeh")

let contactArray = [contactOne, contactTwo, contactThree, contactFour, contactFive]

struct ContentView: View {
    
    var body: some View {
            
        List(contactArray, id: \.firstName) { contact in
        
            HStack {
                Text(contact.firstName)
                Text(contact.lastName)
                    .bold()
            }
            
        }
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
