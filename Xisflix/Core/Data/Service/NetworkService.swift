//
//  NetworkService.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import Alamofire
import ObjectMapper
import Combine

class NetworkService {
    
    static let shared = NetworkService()

    private init() {}
    
    func request<T: Mappable>(baseAPI: APIFactory) -> AnyPublisher<T, Error> {
        return Future<T, Error> { promise in
            let paramData = baseAPI.parameters
            let param = paramData.toDictionary(paramData)
            let url = baseAPI.baseURL.appendingPathComponent(baseAPI.path)
            AF.request(url, method: baseAPI.method, parameters: param)
            .validate()
            .responseString { response in
                switch response.result {
                case .success(let data):
                    let model = Mapper<T>().map(JSONString: data)
                    if let modelResponse = model {
                        promise(.success(modelResponse))
                    } else {
                        promise(.failure(ApiError.failedMappingError))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
