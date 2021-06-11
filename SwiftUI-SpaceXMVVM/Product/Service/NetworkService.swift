//
//  NetworkService.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//

import Foundation

final class NetworkService {

    private static var _instance: NetworkService?

    public static var instance: NetworkService {
        get {
            if let instance = _instance {
                return instance
            } else {
                let _instance = NetworkService()
                self._instance = _instance
                return _instance
            }
        }
    }

    private init() { }

    private let baseUrl = "https://api.spacexdata.com/"

    lazy var manager: INetworkManager = {
        return NetworkManager(config: NetworkConfig(baseURL: self.baseUrl))
    }()
}
