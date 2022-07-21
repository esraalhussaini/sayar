//
//  Intro.swift
//  sayar
//
//  Created by anwar on 22/12/1443 AH.
//

import Foundation
import SwiftUI

struct Intro: Identifiable{
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

var intros : [Intro] = [

    Intro(image: "1", title: "Markabah", description: "Welcome to Markabah.",color: Color("ColorApp")),
    Intro(image: "2", title: "Track your car expenses", description: "",color: Color("ColorApp")),
    Intro(image: "3", title: "Be aware of your vehicle required maintenance", description: "START.",color: Color("ColorApp")),
]
