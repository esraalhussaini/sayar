//
//  ContentImage.swift
//  sayar
//
//  Created by anwar on 30/11/1443 AH.
//

import SwiftUI

struct ContentImage: View {





@EnvironmentObject var vm: ViewModel
    @StateObject var addCarViewModel = AddCarViewModel()
var body: some View {
    NavigationView {
        VStack {
            if let image = vm.image {
                ZoomableScrollView {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.6)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.horizontal)
            }
            HStack {
                Button {
                    vm.source = .camera
                    vm.showPhotoPicker()
                } label: {
                    Text(LocalizedStringKey("Camera"))
                }
                Button {
                    vm.source = .library
                    vm.showPhotoPicker()
                } label: {
                    Text(LocalizedStringKey("Photos"))
                }
            }
            Spacer()
        }
//        .sheet(isPresented: $vm.showPicker) { 
//            ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
//                .ignoresSafeArea()
//        }
        .navigationTitle(LocalizedStringKey("My Images"))
    }
}
}

struct ContentImage_Previews: PreviewProvider {
static var previews: some View {
    ContentImage()
        .environmentObject(ViewModel())
}
}
