//
//  MockUrlProtocol.swift
//  PlacesSearchTests
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

/// `MockURLProtocol` helps to mock URLSession responses.
/// It is borrowed from https://github.com/mattneub/CheckWeather/blob/master/CheckWeatherTests/JSONTalkerTests.swift
/// This code is based on the WWDC video on testing https://developer.apple.com/videos/play/wwdc2018/417/
/// It is the prederred way of testing network request instead of e.g. mocking `URLSession` from a protocol

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = Self.requestHandler else {
            return
        }
        do {
            let (response, data) = try handler(request)
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            self.client?.urlProtocol(self, didLoad: data)
            self.client?.urlProtocolDidFinishLoading(self)
        } catch {
            self.client?.urlProtocol(self, didFailWithError:error)
        }
    }
    
    override func stopLoading() {} // not interested
}
