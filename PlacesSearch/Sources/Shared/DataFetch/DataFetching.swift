//
//  DataFetching.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

protocol DataFetching {
    var sessionAuthenticator: SessionAuthenticating.Type { get }
    var urlSession: URLSession { get }
    func fetch<DataType: Decodable>(endpoint: NetworkEndpoint,
                                    parameters: RequestParameters) async throws -> DataType
}

extension DataFetching {
    /**
     Method which performs an GET HTTP request.

     - parameter endpoint: the endpoint from which to fetch data
     - parameter parameters: Parameters to pass with request
     */
    func fetch<DataType: Decodable>(endpoint: NetworkEndpoint,
                                    parameters: RequestParameters) async throws -> DataType {
        var urlComponents = endpoint.urlComponents
        urlComponents.queryItems = parameters.queryItems

        guard
            let urlString = urlComponents.string,
            urlString.isValidUrl,
            let url = URL(string: urlString)
        else {
            throw CoreError.invalidUrl
        }

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = sessionAuthenticator.authorizationHeader
        var result: (data: Data, response: URLResponse)
        do {
            result = try await urlSession.data(for: request)
        } catch {
            throw CoreError.error(error)
        }

        // Check if there is url response
        guard let httpResponse = result.response as? HTTPURLResponse else {
            throw CoreError.generic
        }

        switch httpResponse.statusCode {
            // Allow all success codes
        case 200...299:
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(DataType.self, from: result.data)
            } catch {
                // If decoding fails throw specific error
                throw CoreError.jsonMapping(error)
            }
        default:
            // Because status code did not yeald success
            // throw HTTP error and pass the code
            throw CoreError.http(code: httpResponse.statusCode)
        }
    }
}
