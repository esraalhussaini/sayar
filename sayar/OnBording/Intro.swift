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

    Intro(image: "1", title: "XYXY", description: "Bblblblblblblblblblblblblblbl.",color: Color("ColorTiersOpa")),
    Intro(image: "2", title: "XYXLorem and lorem more lorem?Y", description: "blblblblblblblblblblblblblblblblblblbl.",color: Color("ColorTiersOpa")),
    Intro(image: "3", title: "XYXY", description: "blblblblblblblblblblblblbl.",color: Color("ColorTiersOpa")),
]
