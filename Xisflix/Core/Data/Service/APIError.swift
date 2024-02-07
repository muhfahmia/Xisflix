//
//  APIError.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

enum ApiError: Error {
    case unknown, connectionError, invalidJSONError, failedMappingError
    case middlewareError(txt: String?)
    var localizedDescription: String {
        switch self {
        case .unknown:
          return "An error occurred. Please try again later."
        case .connectionError:
          return "Connection problem. Please check your internet connection."
        case .invalidJSONError:
          return "Service response in an unexpected format."
        case .middlewareError(let message):
          return message ?? ""
        case .failedMappingError:
          return "Failed to read server's response."
        }
    }
}
