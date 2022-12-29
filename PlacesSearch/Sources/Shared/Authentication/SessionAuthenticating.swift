//
//  SessionAuthenticating.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

protocol SessionAuthenticating {
    typealias ApiToken = String
    static var apiToken: ApiToken { get }
    static var authorizationHeader: [String: String] { get }
}
