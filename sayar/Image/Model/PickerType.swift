//
//  Picker.swift
//  sayar
//
//  Created by anwar on 30/11/1443 AH.
//

import Foundation
import UIKit

enum PickerType {
    enum Source: String {
        case library, camera
    }
    
   
    static func checkPermissions() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return true
        } else {
            return false
        }
    }
}
