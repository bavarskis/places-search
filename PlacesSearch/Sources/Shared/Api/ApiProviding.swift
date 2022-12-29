//
//  ApiProviding.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

protocol ApiProviding {
    static var scheme: String { get }
    static var domain: String { get }
    static var servicePath: String { get }
}
