//
//  ReportsViewModel.swift
//  sayar
//
//  Created by anwar on 02/11/1443 AH.
//


import SwiftUI


/// This view is responsible to draw reporting screen
struct ReportsView: View {
    @State var selectedTime = 0
    @ObservedObject var viewModel = ReportViewModel()
    
    /// Values displayed in the time dropdown
    var dataSourceTimeRange = ["This week","This month","This year"]
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                Text("Report")
                    .fontWeight(.semibold).font(.system(size: 25))
                HStack{
                    Text("Cost Comparison Chart")
                    Spacer()
                    Menu {
                        /// Buttons to update the state variable the selected value from the menu 0 week, 1 month, 2 year
                        Button {
                            selectedTime = 0
                        } label: {
                            Text(dataSourceTimeRange[0])
                        }
                        Button {
                            selectedTime = 1
                        } label: {
                            Text(dataSourceTimeRange[1])
                        }
                        Button {
                            selectedTime = 2
                        } label: {
                            Text(dataSourceTimeRange[2])
                        }
                    } label: {
                        HStack() {
                            Text(dataSourceTimeRange[selectedTime]).padding([.leading,.vertical]).foregroundColor(Color.red)
                            Image(systemName: "chevron.down").foregroundColor(Color.red).padding()
                        }.overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        
                    }
                }.onChange(of: selectedTime) { newValue in
                    /// Make call to firebase to fetch data as per the time selected
                    viewModel.makeNetworkCall( searchBy: ReportSearchBy.init(rawValue: newValue) ?? .week)
                }
                if !viewModel.isLoading, !viewModel.noDataFound{
                    /// Display the chart if data is available and screen is not loading
                    PieChartSwiftView(
                        values: viewModel.arrayOfValues,
                        names: ["Fuel", "Battery", "Oil","Tires"],
                        formatter: {value in String(format: "$%.2f", value)},colors: [Color.red.opacity(0.8),Color.green.opacity(0.8),Color.orange.opacity(0.8),Color.blue.opacity(0.8)],backgroundColor: .white).foregroundColor(.black)
                }
                else{
                    Spacer()
                }
            }.padding().onAppear(perform: {
                /// Fetch data from firebase when screen appears
                viewModel.makeNetworkCall( searchBy: ReportSearchBy.init(rawValue: selectedTime) ?? .week)
                
            })
            VStack(alignment: .center){
                Spacer()
                if viewModel.isLoading,!viewModel.noDataFound{
                    ActivityIndicator(isAnimating: .constant(true), style: UIActivityIndicatorView.Style.large)
                }
                else if viewModel.noDataFound{
                    Text("No Data Found").font(.system(size: 25)).bold()
                }
                Spacer()
            }
        }
        
    }
}

struct ReportsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView()
    }
}
