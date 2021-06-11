//
//  INetworkManager.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//

import Foundation
import Alamofire


protocol INetworkManager {
    var config: NetworkConfig { get set }

    init(config: NetworkConfig)

    func fetch<T>(path: NetworkPath,
                  paramaters: [String: String]?,
                  method: HTTPMethod,
                  onSuccess: @escaping Success<T>,
                  onError: @escaping Error)

}
