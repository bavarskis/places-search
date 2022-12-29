//
//  UserLocator.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation
import CoreLocation

/// `UserLocator` returns current user location.
/// For demo purposes it only returns hardcoded location
class UserLocator: UserLocating {
    func requestUserLocation() async throws -> CLLocation {
        return CLLocation(latitude: 52.376557, longitude: 4.905993)
    }
}
