//
//  PlacesView+ViewModel.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import SwiftUI
import CoreLocation

extension PlacesView {
    @MainActor class ViewModel: ObservableObject {
        // MARK: - Published
        
        @Published var places: [Place] = []
        @Published var rangeInMeters = Double(5000) {
            willSet {
                sliderText = Self.sliderText(range: newValue)
            }
        }
        @Published var isFetchingData = false
        @Published var isShowingError = false
        @Published var sliderText: String
  
        // MARK: - Dependencies
        
        let placesService: PlacesServiceProtocol
        let userLocator: UserLocating
        
        // MARK: - Constants
        
        let title = NSLocalizedString("placesTitle", comment: "")
        let genericErrorMessage = NSLocalizedString("genericErrorMessage", comment: "")
        let okTitle = NSLocalizedString("ok", comment: "")
        let minRangeLimitInMeters = Double(1000)
        let maxRangeLimitInMeters = Double(50000)
        
        // MARK: - init
        
        init(placesService: PlacesServiceProtocol = PlacesService(),
             userLocator: UserLocating =  UserLocator()) {
            self.placesService = placesService
            self.userLocator = userLocator
            let range = CGFloat(1000)
            self.rangeInMeters = range
            self.sliderText = Self.sliderText(range: range)
        }
        
        // MARK: - Data fetching
        
        func fetchPlaces() async {
            isShowingError = false
            isFetchingData = true
            do {
                let location = try await userLocator.requestUserLocation()
                places = try await placesService.getPlaces(location: location, radiusInMeters: Int(rangeInMeters), searchTerm: "")
            } catch {
                isShowingError = true
            }
            
            isFetchingData = false
        }
        
        // MARK: - Slider
        
        static func sliderText(range: Double) -> String{
            "\(NSLocalizedString("searchingInRange", comment: "")) \(Int(range) / 1000) \(NSLocalizedString("kilometersShort", comment: ""))"
        }
    }
}
