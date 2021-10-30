//
//  Endpoint.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/19.
//

import Foundation

enum Scheme: String {
    case https = "https"
}

enum Host: String {
    case base = "stoplight.io"
}

enum Path: String {
    case basePath = "/mocks/panther222128/kpgg/25039489/group/"
}

struct Endpoint {

    func url(with path: String) -> URL? {
        var component = URLComponents()
        component.scheme = Scheme.https.rawValue
        component.host = Host.base.rawValue
        component.path = Path.basePath.rawValue + path
        return component.url
    }
    
}



