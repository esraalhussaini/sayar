//
//  ReportsViewModel.swift
//  sayar
//
//  Created by anwar on 02/11/1443 AH.
//


import SwiftUI

//Protocols
protocol ChartDataProvidable {
    var percentage: Double {get}
    var description: String {get}
    var color: Color {get}
}

protocol ChartViewModel: ObservableObject {
    var data: [ChartDataProvidable] { get }
}

//Models
enum Asset {
    case fuel , oil, tiers , battery
}



struct CarPrefrence: ChartDataProvidable {
    let percentage: Double
    let description: String
    let color: Color
}

    // keep track of how much percentage of these assets
struct AssetAllocation: ChartDataProvidable {
    //track the type of asset
    let asset: Asset
    let percentage: Double
    let description: String
    let color: Color
}


//ViewModels
final class AssetViewModel: ChartViewModel{
    @Published var data:[ChartDataProvidable] = [
        AssetAllocation(asset: .fuel , percentage: 0.1, description: "Fuel", color: Color("cFuel")),
        AssetAllocation(asset: .oil , percentage: 0.4, description: "Oil", color: Color("cOil")),
        AssetAllocation(asset: .tiers , percentage: 0.3, description: "Tiers", color: Color("cTiers")),
        AssetAllocation(asset: .battery , percentage: 0.2, description: "Battery", color: Color("cBattery")),
    ]
}


//Views
struct PieceOfPie: Shape {
    let startDegree: Double
    let endDegree: Double
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            p.move(to: center)
            p.addArc(center: center, radius: rect.width / 2,
                startAngle: Angle(degrees: startDegree), endAngle: Angle(degrees: endDegree), clockwise: false)
            p.closeSubpath()
        }
    }
    
  
}

struct PieChart<T>: View where T: ChartViewModel {
    @ObservedObject var viewModel: T
    @State var selectedPieChartElement: Int? = nil
    let action: ((ChartDataProvidable) -> Void)?
    
    
    var body: some View {
        ZStack {
            ForEach(0..<viewModel.data.count){ index in
                let currentData = viewModel.data[index]
                let currentEndDegree = currentData.percentage * 360
                //sum up the persentage to start a new chart part
                let lastData = viewModel.data.prefix(index).map
                {$0.percentage}.reduce(0, +) * 360
                
                ZStack {
                    PieceOfPie(startDegree: lastData,
                               endDegree: lastData + currentEndDegree )
                                .fill(currentData.color)
                                .scaleEffect(index == selectedPieChartElement ? 1.2 : 1.0)
                    
                    GeometryReader { geometry in
                        Text(currentData.description)
                            .font(.custom("Avenir", size: 20))
                            .foregroundColor(.white)
                            .position(getLabelCoordinate(in: geometry.size , for: lastData + (currentEndDegree / 2)))
                        
                        
                        
                    }
                    
                   
                }.onTapGesture(count: 1, perform: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        if index == selectedPieChartElement {
                            self.selectedPieChartElement = nil
                        } else {
                            self.selectedPieChartElement = index
                            action?(currentData)
                        }
                    }
                })
                
                //end
            }
            
            
//            PieceOfPie(startDegree: 0, endDegree: 90)
//                .fill(Color.orange)
//            PieceOfPie(startDegree: 90, endDegree: 180)
//                .fill(Color.blue)
        }
    }
    private func getLabelCoordinate (in geoSize: CGSize, for degree: Double) -> CGPoint {
        let center = CGPoint(x: geoSize.width / 2, y: geoSize.height / 2)
        let radius = geoSize.width / 3
        let yCoordinate = radius * sin(CGFloat(degree) * (CGFloat.pi / 180))
        let xCoordinate = radius * cos(CGFloat(degree) * (CGFloat.pi / 180))

        return CGPoint (x: center.x + xCoordinate, y: center.y + yCoordinate)
    }
}

//content view so we can see it

struct ReportsViewModel: View {
    var body: some View {
        
        VStack {
            PieChart(viewModel: AssetViewModel()){ assetData in
                print(assetData)
            }
                //.frame(width: 300, height: 300)
           // PieceOfPie(startDegree: 0, endDegree: 90)
        }.padding()
        
    }
}

struct ReportsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ReportsViewModel()
    }
}
