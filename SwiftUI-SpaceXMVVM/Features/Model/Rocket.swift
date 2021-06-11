//
//  Rocket.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//

import Foundation


struct Rocket : Codable {
    
    let rocketID : String
    let rocketName : String
    let rocketType : String
    
    
     enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
     

}
