//
//  LocationManager.swift
//  OpenWeather
//
//  Created by Pratap Singh on 10/12/23.
//

import Foundation
import CoreLocation

protocol LocationManagerProtocol {
    var isAuthorizedLocation: Bool {get}
    var exposedLocation: CLLocation? {get}
    func getPlace(for location: CLLocation, completion: @escaping (CLPlacemark?) -> Void)
}

class LocationManager: NSObject, LocationManagerProtocol {
    
    private let locationManager = CLLocationManager()
    private var isAuthorized: Bool = false
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        self.locationManager.requestWhenInUseAuthorization()
    }
}

// MARK: - Core Location Delegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        switch status {
            case .notDetermined:
                self.locationManager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                self.locationManager.startUpdatingLocation()
                self.isAuthorized = true
            case .restricted, .denied:
                self.isAuthorized = false

            @unknown default:
                print("error")
            }
        NotificationCenter.default.post(name: Notification.Name(rawValue: "isLocationChanged"), object: nil)
    }
}

extension LocationManager {
    
    var isAuthorizedLocation: Bool {
        isAuthorized
    }
    
    var exposedLocation: CLLocation? {
        return self.locationManager.location
    }
    
    func getPlace(for location: CLLocation, completion: @escaping (CLPlacemark?) -> Void) {
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            
            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let placemark = placemarks?[0] else {
                print("*** Error in \(#function): placemark is nil")
                completion(nil)
                return
            }
            
            completion(placemark)
        }
    }
}
