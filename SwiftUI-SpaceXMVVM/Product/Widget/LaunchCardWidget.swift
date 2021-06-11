//
//  LaunchCardWidget.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//

import SwiftUI
import UIKit
import Kingfisher

struct LauncCardWidget: View {

    let launch: LaunchSpaceX
    let imageName : String
    
    let imageplaceHolder : String = "https://e27.co/img/startups/23654/logo-1491893751.png"
    

    var body: some View {
        
        
            KFImage(URL(string: launch.links.missionImageSmall ?? imageplaceHolder )).resizable().aspectRatio(contentMode: .fit).frame(height: 50, alignment: .leading
            )
        
            VStack(alignment: .leading, spacing: 5, content: {
                Text(launch.missionName).fontWeight(.light).font(.system(size: 14))
                Text(launch.launchYear).bold()
    
            })
        Spacer()
        Image(systemName: imageName).resizable().frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

    }
}

struct LauncCardWidget_Previews: PreviewProvider {
    static var previews: some View {
        LauncCardWidget(launch: LaunchSpaceX(flightNumber: 1, missionName: "Test", launchYear: "2018", rocket: Rocket(rocketID: "rocket id", rocketName: "rocket name", rocketType: "rocket type"), links: Link(missionImage: "https://e27.co/img/startups/23654/logo-1491893751.png", missionImageSmall: "https://e27.co/img/startups/23654/logo-1491893751.png"), launchSuccess: true, details:"asdfasd"), imageName: "heart.fill")
        
                            
                            
                            
                
    }
}
