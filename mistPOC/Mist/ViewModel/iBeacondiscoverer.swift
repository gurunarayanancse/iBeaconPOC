//
//  Beacondiscoverer.swift
//  mistPOC
//
//  Created by Guru Narayanan on 07/03/23.
//

import Foundation
import CoreLocation

/// Class (ViewModel) to provide a service to detec the beacons as well as to pass to the View
///```
/// Steps:
/// 1. Declare the locationManager.
/// 2. Ask for the permission and check the status.
///     2.1 if permission granted we are good to go.
///     2.2 otherwise Open settings and ask the permission.
/// 3. Assign a deligate.
/// 4. Start a scanning process with startRanging() and startMonitoring().
/// 4. implement didRangeBeacons.
///     1. asign that to publishable variable so that the class using this ViewModel can access it.
///```


class iBeaconDetector : NSObject, CLLocationManagerDelegate,ObservableObject{
    /// 1. Declare the locationManager.
    let locationManager = CLLocationManager()
    
    /// 1. class where the beacon info gets stored.
    @Published var availableBeacons : [CLBeacon] = []
    
    /// 1.initalizer will ask for authorization and assigns a deligation.
    override init() {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
    }
    
    /// Initiate the scanning process.
    /// ```
    /// Steps:
    /// 1. Define constraint.
    /// 2. Define Beacon region to scan.
    /// 3. start ranging beacons so that scanning process starts and the outputs fed into didRangeBeacons deligate function.
    ///```
    func startScanning(){
        guard let uuid = UUID(uuidString: "B0702880-A295-A8AB-F734-031A98A512DE") else { return }
        let constraint = CLBeaconIdentityConstraint(uuid: uuid)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "com.beacon.myroom")
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(satisfying: constraint)
    }
    
    /// Checks auth status of location manager.
    /// ```
    /// Steps:
    /// 1. Check authorization status.
    /// 2. check for available environment.
    ///     2.1 if all are satisfying, go for scanning process.
    ///     2.2 otherwise, throw error.
    ///```
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
    
    /// provides list of available beans and we capture them in out publishable variable.
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        availableBeacons = beacons
    }
}
