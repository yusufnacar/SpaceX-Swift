//
//  LaunchsView.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//



import SwiftUI

struct LaunchsView: View {

    @ObservedObject var viewModel: LaunchViewModel
    
    
    var body: some View {
        NavigationView(content: {
            
            LaunchListView().navigationBarTitle("SpaceX").toolbar(content: {
                Button("Filter") {
                    viewModel.changefilterPickerIsVisible()
                }
            })
        }
        )
    }
    
    fileprivate func LaunchListView() -> some View {
        
        return VStack {
            List {
                
                ForEach(viewModel.getList(), id: \.id) { item in
                    self.launchCard(item: item)
                }

            }
            if (viewModel.isLoading) {
                loadingView()
            }
            
            if (viewModel.filterPickerIsVisible){
                datePicker()
            }

        }
    }
    fileprivate func loadingView() -> some View {
        return ProgressView()
    }

       @State private var pickedYearIndex = 0
    
    fileprivate func datePicker() -> some View {
        VStack {
           
            Button("Done"){
                viewModel.changefilterPickerIsVisible()
                viewModel.orderByDate(year: viewModel.getYears()[pickedYearIndex]
                )
            }
            Picker(selection: $pickedYearIndex, label: Text("")) {
                ForEach(0 ..< viewModel.getYears().count) {
                           Text(self.viewModel.getYears()[$0])
                                                }
                
           }
        }

    }

    func launchCard(item: LaunchSpaceX) -> some View {
        return NavigationLink(destination: LaunchDetailView(launch: item)
        ) {
            LauncCardWidget(launch: item , imageName: viewModel.isSuccess(item: item))
        }.buttonStyle(PlainButtonStyle())
    }


}

struct LaunchsView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchsView(viewModel: LaunchViewModel()).environment(\.locale, .init(identifier: "en"))
    }
}
