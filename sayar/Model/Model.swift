//
//  Model.swift
//  sayar
//
//  Created by Nouf Saud on 16/07/2022.
//

import SwiftUI
import Foundation

class TextItem: Identifiable {
    var id: String
    var text: String = ""
 
    init() {
        id = UUID().uuidString
    }
}

