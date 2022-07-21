//
//  DemoImage.swift
//  sayar
//
//  Created by anwar on 22/12/1443 AH.
//

import Foundation
import SwiftUI
import Kingfisher

struct AvatarImage: View {
    var size : CGFloat
    var image : Image = Image("default-avatar")
    var imageURL : String = ""
    var body: some View {
        if !imageURL.isEmpty{
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
                .clipShape(Circle())
        }
        else{
            image
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
                .clipShape(Circle())
        }
    }
}

struct AvatarImage_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImage(size: 35, image:Image("default-avatar"))
    }
}
