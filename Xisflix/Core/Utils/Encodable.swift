//
//  Encodable.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

extension Encodable {
    func toDictionary<T>(_ value: T) -> [String: Any] where T: Encodable {
        guard let data = try? JSONEncoder().encode(value) else { return [:] }
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return [:] }
        return dictionary
    }
}
