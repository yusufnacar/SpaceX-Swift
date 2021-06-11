//
//  SpaceXService.swift
//  SwiftUI-SpaceXMVVM
//
//  Created by Yusuf Nacar on 10.06.2021.
//


import Foundation

class SpaceXService {
    let service: INetworkManager

    init(service: NetworkService) {
        self.service = service.manager
    }
    func getAllLaunches(onSucess: @escaping ([LaunchSpaceX]) -> Void, onError: @escaping(BaseError) -> Void) {
        service.fetch(path: .launches , paramaters: nil, method: .get, onSuccess: { (response: BaseResponse<[LaunchSpaceX]>) in
            guard let launch = response.model else {
                onError(BaseError(message: "Not Found"))
                return
            }
            onSucess(launch)
        }) { (error) in
            print(error)
            onError(error)
        }
    }


}
