//
//  NetworkService.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/19.
//

import Foundation
import Alamofire

class NetworkService {
    
    private var endPoint: Endpoint
    
    init() {
        self.endPoint = Endpoint()
    }
    
    func sendRequest<T: Decodable>(path: String, type: T.Type, completion: @escaping ((Error?, T?) -> Void)) {
        let url = endPoint.url(with: path)
        AF.request(url!, method: .get)
            .validate(statusCode: 200..<600)
            .responseDecodable(of: type) { response in
                if let error = response.error {
                    print(error)
                    return completion(error, nil)
                }
                if let list = response.value {
                    return completion(nil, list)
                }
            }
      print(url!)
    }
    
}

