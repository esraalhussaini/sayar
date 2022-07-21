//
//  OnboardingHome.swift
//  sayar
//
//  Created by anwar on 22/12/1443 AH.
//

import SwiftUI


struct OnboardingHome: View {
    
    var screenSize: CGSize
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        VStack{
            
            Button {
                
            } label: {
                Image("0")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color("ColorApp"))
                    .frame(width: 80, height: 60)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            OffsetPageTabView(offset: $offset) {
                

                HStack(spacing: 0){
                 
                    ForEach(intros){intro in
                     
                        VStack{
                            
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)
                            
                            VStack(alignment: .leading, spacing: 22) {
                                
                                Text(intro.title)
                                    .font(.title)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color("ColorOil"))
                                
                                Text(intro.description)
                                    .font(.title)
                                    .fontWeight(.light)
                                    .foregroundColor(.primary)
                            }
                            .foregroundStyle(.white)
                            .padding(.top,50)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        .padding()
                        .frame(width: screenSize.width)
                    }
                }
            }
            
            // Animated Indicator....
            HStack(alignment: .bottom) {
                
                // Indicators...
                HStack(spacing: 12){
                    
                    ForEach(intros.indices,id: \.self){index in
                        
                        Capsule()
                            .fill(.white)
                        // increasing width for only current index...
                            .frame(width: getIndex() == index ? 20 : 7, height: 7)
                    }
                }
                .overlay(
                
                    Capsule()
                        .fill(.white)
                        .frame(width: 20, height: 7)
                        .offset(x: getIndicatorOffset())
                    
                    ,alignment: .leading
                )
                .offset(x: 10, y: -15)
                
                Spacer()
                
                Button {
                    
                    // updating offset...
                    let index = min(getIndex() + 1, intros.count - 1)
                    
                    offset = CGFloat(index) * screenSize.width
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundColor(Color("ColorApp"))
                        .padding(20)
                        .background(
                        
                            intros[getIndex()].color,
                            in: Circle()
                        )
                }

            }
            .padding()
            .offset(y: -20)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        // Animating when index Changes...
        .animation(.easeInOut,value: getIndex())
    }
    
    // offset for indicator...
    func getIndicatorOffset()->CGFloat{
        
        let progress = offset / screenSize.width
        
        // 12 = spacing
        // 7 = Circle size...
        
        let maxWidth: CGFloat = 12 + 7
        
        return progress * maxWidth
    }
    
    func getIndex()->Int{
        
        let progress = round(offset / screenSize.width)
        
        let index = min(Int(progress), intros.count - 1)
        return index
    }
}

struct OnboardingHome_Previews: PreviewProvider {
    static var previews: some View {
        //TabBar
       // TabViewApp()
        OnboardingV()
    }
}
