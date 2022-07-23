//
//  SwiftUIView.swift
//  sayar
//
//  Created by Hadeel Altamimi on 23/07/2022.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        
        VStack{
     
                 Button {
     
                 } label: {
                     Image("0")
                         .resizable()
                         .renderingMode(.template)
                         .foregroundColor(Color("ColorApp"))
                         .frame(width: 70, height: 50)
                 }
                 .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                 .padding()
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
