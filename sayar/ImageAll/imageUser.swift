//
//  imageUser.swift
//  sayar
//
//  Created by anwar on 20/12/1443 AH.
//

import SwiftUI
//import Kingfisher

struct defaultImageCar: View {
    var size : CGFloat
    var image : Image = Image("Cardefault")
    var imageURL : String = ""
    var body: some View {
        if !imageURL.isEmpty{
          //  KFImage(URL(string: imageURL))
//                .resizable()
//                .scaledToFill()
//                .frame(width: size, height: size)
//                .clipShape(Circle())
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

struct defaultImageCar_Previews: PreviewProvider {
    static var previews: some View {
        defaultImageCar(size: 35, image:Image("Cardefault"))
    }
}


