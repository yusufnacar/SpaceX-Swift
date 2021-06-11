//
//  BaseResponse.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//

import Foundation


struct BaseResponse<T : Codable> {
    var model: T?
    var message: String?
}
