//
//  CoreError.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

/// `CoreError` can be used accross the app to handle errors.
enum CoreError: Error {
    typealias ErrorCode = Int

    case generic
    case invalidUrl
    case jsonMapping(Error)
    case error(Error)
    case http(code: ErrorCode)
}
