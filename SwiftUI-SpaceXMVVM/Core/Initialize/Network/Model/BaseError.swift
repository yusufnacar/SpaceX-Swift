//
//  BaseError.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//

import Foundation
import Alamofire


struct BaseError {
    var errorMessage: String?
    var statusCode: Int?
    var debugMessage: String?
    
    init(message: String) {
        self.errorMessage = message
    }
    
    init(afError: AFError?) {
        guard let error = afError else {
            self.statusCode = 500
            self.errorMessage = ErrorMessage
                .someThingWentWrong.rawValue
            return }
        self.errorMessage = error.errorDescription
        self.statusCode = error.responseCode
        self.debugMessage = error.localizedDescription
    }
}
