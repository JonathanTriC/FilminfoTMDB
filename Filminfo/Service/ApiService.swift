//
//  ApiService.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//

import Foundation
import Alamofire

final class APIService {
    private static let API_KEY = api_key
    private static let BASE_URL = base_url
    
    static func get<T: Codable>(endpoint: String, parameters: [String: Any] = [:], callback: @escaping (T) -> Void) {
        var params = parameters
        params["api_key"] = API_KEY
        AF.request(BASE_URL + endpoint, method: .get, parameters: params).responseDecodable(of: T.self, queue: .main) { result in
            print("HIT API WITH GET: \(BASE_URL)\(endpoint)\(params)" )
            if let error = result.error {
                print(error.localizedDescription)
                return
            }
            if let value = result.value {
                callback(value)
            } else {
                print("[Error]: Missing value.")
            }
        }
    }
    
}
