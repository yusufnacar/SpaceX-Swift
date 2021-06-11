//
//  LaunchDetailsView.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//



import SwiftUI
import Kingfisher

struct LaunchDetailView: View {
    
    let launch : LaunchSpaceX
    let urlPlaceHolder : String = "https://e27.co/img/startups/23654/logo-1491893751.png"
    
    var body: some View {
        VStack(content: {
            
            Spacer().frame(height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Mission Name: \(launch.missionName)").font(.headline).foregroundColor(.white)
            KFImage(URL(string: launch.links.missionImage ?? urlPlaceHolder))
                .resizable().aspectRatio(contentMode: .fit).frame(height: 200, alignment: .center)
            Text("Rocket Name: \(launch.rocket.rocketName)").font(.subheadline).foregroundColor(.white).bold()
            Spacer().frame(height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Details:").font(.subheadline).foregroundColor(.white).bold()
            Spacer().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(launch.details ?? "Details not found").foregroundColor(.white).padding()
            Spacer()
        }).frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background((LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom)))
        
    }}

struct LaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailView(launch: LaunchSpaceX(flightNumber: 1, missionName: "Mission", launchYear: "2019", rocket: Rocket(rocketID: "qwe", rocketName: "123", rocketType: "qwe"), links: Link(missionImage: "", missionImageSmall: ""), launchSuccess: true, details: "Detay"))
    }
}
