//
//  UserLocating.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation
import CoreLocation

protocol UserLocating {
    func requestUserLocation() async throws -> CLLocation
}
