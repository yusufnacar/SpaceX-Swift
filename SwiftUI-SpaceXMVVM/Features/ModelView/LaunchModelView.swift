//
//  LaunchModelView.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//



import Foundation


final class LaunchViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var launchList: [LaunchSpaceX] = []
    @Published var filteredLaunchList: [LaunchSpaceX] = []
    @Published var filterPickerIsVisible: Bool = false
    var hasItEverFiltered  : Bool = false
    
    let spacexService: SpaceXService


    init() {
        self.spacexService = SpaceXService(service: NetworkService.instance)
        fetchLaunchList()
    }

    func fetchLaunchList() {
        changeLoading()
        spacexService.getAllLaunches(onSucess: { (datas) in
            self.changeLoading()
            self.launchList = datas
            
            
        }) { (error) in
            self.changeLoading()
            print("Error when fetching to data")
        }
    }
    
    private func changeLoading() {
        self.isLoading = !isLoading
    }
    
     func changefilterPickerIsVisible() {
        self.filterPickerIsVisible = !filterPickerIsVisible
    }

  
    
    func isSuccess(item : LaunchSpaceX) -> String {
        if (item.launchSuccess != nil) {
            if(item.launchSuccess ?? false){
               return "checkmark.seal"
           }else
           {
               return "xmark.seal"
           }
        }else {
            return "questionmark.circle"
        }

    }
    
    
    func orderByDate(year  : String) {
        
        filteredLaunchList = launchList.filter { item in
            return item.launchYear == year
        }
        hasItEverFiltered = true
    }
    
    func getList() -> [LaunchSpaceX] {
        if (filteredLaunchList.count > 0){
            return filteredLaunchList
        }else if(hasItEverFiltered) {
            return []
        }else{
            return launchList
        }
 
    }
    
    
    func getYears() -> [String] {
        let years = (2006...2020).map { String($0) }
        
        return years
    }
    }
    
    

    
    




