//
//  Beacondiscoverer.swift
//  mistPOC
//
//  Created by Guru Narayanan on 07/03/23.
//

import Foundation
import CoreLocation

class iBeaconDetector : NSObject, CLLocationManagerDelegate,ObservableObject{
    let locationManager = CLLocationManager()
    let notificationHandler = NotificationHandler()
    @Published var availableBeacons : [CLBeacon] = []
    
    override init() {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
    }
    func startScanning(){
        guard let uuid = UUID(uuidString: "B0702880-A295-A8AB-F734-031A98A512DE") else { return }
        let constraint = CLBeaconIdentityConstraint(uuid: uuid)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "com.beacon.myroom")
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(satisfying: constraint)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if(locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways){
            if(CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self)){
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
                else{
                    print("Ranging not available")
                }
            }
            else{
                print("Monitoring not available")
            }
        }
        else{
            print("Permission not granted")
        }
    }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        availableBeacons = beacons
    }
}
