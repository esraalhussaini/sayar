//
//  ViewModel.swift
//  sayar
//
//  Created by anwar on 30/11/1443 AH.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: PickerType.Source = .library
    
    func showPhotoPicker() {
        if source == .camera {
            if !PickerType.checkPermissions() {
                print(LocalizedStringKey("Thereisnocameraonthisdevice"))
                return
            }
        }
        showPicker = true
    }
}
