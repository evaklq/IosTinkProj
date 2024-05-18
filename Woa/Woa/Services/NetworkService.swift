//
//  NetworkService.swift
//  Woa
//
//  Created by evaklq on 2024-05-03.
//

import Foundation
import Moya

let provider = MoyaProvider<NetworkService>()

enum NetworkService {
    case postExample(email: String, password: String)
}

extension NetworkService: TargetType {
    var baseURL: URL {
        createBaseUrl()
    }

    var path: String {
        ""
    }

    var method: Moya.Method {
        .post
    }

    var task: Moya.Task {
        switch self {
        case let .postExample(email, password):
            let parameters: [String: Any] = [
                "email": email,
                "password": password
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        nil
    }

}

extension NetworkService {
    func createBaseUrl() -> URL {
        guard let url = URL(string: "http://localhost:7067") else { fatalError("can't convert url") }
        return url
    }

    func postExample(email: String, password: String, completion: @escaping (Result<String, MoyaError>) -> Void) {
        provider.request(.postExample(email: email, password: password)) { result in
            switch result {
            case let .success(response):
                do {
                    let responseString = try response.mapString()
                    completion(.success(responseString))
                } catch {
                    completion(.failure(MoyaError.jsonMapping(response)))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
