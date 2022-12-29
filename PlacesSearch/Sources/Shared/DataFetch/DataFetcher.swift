//
//  DataFetcher.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

/// `DataFetcher` handles fetching JSON data.
final class DataFetcher: DataFetching {
    lazy var urlSession: URLSession = {
        URLSession(configuration: URLSessionConfiguration.default)
    }()
}
