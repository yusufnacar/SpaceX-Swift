//
//  NetworkPath.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//


import Foundation


enum NetworkPath: String {
    case launches = "v2/launches"


    func launchesPath() -> String {
        return "\(self.rawValue)"
    }
}
