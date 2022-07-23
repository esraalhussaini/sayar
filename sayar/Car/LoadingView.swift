//
//  LoadingView.swift
//  sayar
//
//  Created by anwar on 22/12/1443 AH.
//

import Foundation
import SwiftUI
struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .opacity(0.9)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                .scaleEffect(2)
                .offset(y:-40)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
