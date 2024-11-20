//
//  CurrentLocation.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-20.
//

import Foundation
import CoreLocation

class CurrentLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var location: CLLocationCoordinate2D?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var isLocationUpdated: Bool = false
    
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    /// Request location authorization from the user
    func requestAuthorization() {
        print("Requesting location authorization...")
        locationManager.requestWhenInUseAuthorization()
    }
    
    /// Starts updating location
    func startUpdatingLocation() {
        print("Starting location updates...")
        locationManager.startUpdatingLocation()
    }
    
    /// Stops updationg location
    func stopUpdatingLocation() {
        print("Stopping location updates...")
        locationManager.stopUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    
    /// Called when the location manager updates the location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return } // Get the most recent location
        
        print("Updated location: \(newLocation.coordinate.latitude), \(newLocation.coordinate.longitude)")

        DispatchQueue.main.async {
            self.location = newLocation.coordinate // Update the observable property
        }
        
        if (!locations.isEmpty) {stopUpdatingLocation()}
        isLocationUpdated.toggle()
    }
    
    /// Called when the authorization status changes
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        DispatchQueue.main.async {
            self.authorizationStatus = manager.authorizationStatus
        }
        
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            startUpdatingLocation()
        } else {
            print("Authorization denied or not determined.")
        }
    }
    
    /// Called when the location manager encounters an error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
    
}
