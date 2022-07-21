//
//  OnboardingV.swift
//  sayar
//
//  Created by anwar on 22/12/1443 AH.
//

import Foundation
import SwiftUI

struct OnboardingV: View {
    var body: some View {

        GeometryReader{proxy in

            let size = proxy.size

            OnboardingHome (screenSize: size)
//                .preferredColorScheme(.dark)
        }
    }
}

struct OnboardingV_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingV()
    }
}
