//
//  CurrentLocation.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-20.
//

import Foundation
import CoreLocation

class CurrentLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var location: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    /// Request location authorization from the user
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    /// Starts updating location
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    /// Stops updationg location
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    
    /// Called when the location manager updates the location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return } // Get the most recent location
        DispatchQueue.main.async {
            self.location = newLocation // Update the observable property
        }
    }
    
    /// Called when the authorization status changes
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        DispatchQueue.main.async {
            self.authorizationStatus = manager.authorizationStatus
        }
        
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            startUpdatingLocation()
        }
    }
    
    /// Called when the location manager encounters an error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
    
}
