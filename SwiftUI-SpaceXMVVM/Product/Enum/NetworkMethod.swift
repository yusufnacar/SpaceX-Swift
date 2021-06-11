//
//  NetworkMethod.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//

import Foundation
import Alamofire

enum NetworkMethod {
    case GET
    


    func method() throws -> HTTPMethod {
        switch self {
        case .GET:
            return HTTPMethod.get
    
        default:
            throw ProjectErrors.notFoundMethod
        }
    }
}
