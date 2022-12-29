//
//  DataFetcherTests.swift
//  PlacesSearchTests
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import XCTest
@testable import PlacesSearch

class DataFetcherTests: XCTestCase {
    func testWhenFetchigJSONSucceeds_shouldReturnDecodableObject() async throws {
        let mockData = try XCTUnwrap(try? JSONLoader.data(filename: "person"))
        let mockPerson: Person = try JSONLoader.mappedData(data: mockData)
        MockURLProtocol.requestHandler = { _ in
            return (HTTPURLResponse(), mockData)
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        let endpoint = NetworkEndpoint(path: "")
        let sut = DataFetcher()
        sut.urlSession = urlSession
        do {
            let result: Person = try await sut.fetch(endpoint: endpoint, parameters: .empty)
            XCTAssertEqual(result.name, mockPerson.name)
        } catch {
            XCTFail("Expected success but received error \(error)")
        }
    }
    
    func testWhenFetchigJSONFails_shouldReturnJSONMappingError() async throws {
        let mockData = try XCTUnwrap(try? JSONLoader.data(filename: "person"))
        struct MockType: Decodable {
            let passportNumber: String
        }
        
        MockURLProtocol.requestHandler = { _ in
            return (HTTPURLResponse(), mockData)
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        let endpoint = NetworkEndpoint(path: "")
        let sut = DataFetcher()
        sut.urlSession = urlSession
        let expectation = XCTestExpectation(description: "Mapping error")
        do {
            let result: MockType = try await sut.fetch(endpoint: endpoint, parameters: .empty)
            XCTFail("Expected error but received success \(result)")
        } catch {
            switch error as? CoreError {
            case .jsonMapping:
                expectation.fulfill()
            default:
                XCTFail("Expected mapping error but received \(error)")
            }
        }
    }
}
