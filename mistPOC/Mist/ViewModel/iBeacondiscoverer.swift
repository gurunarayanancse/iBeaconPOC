//
//  Beacondiscoverer.swift
//  mistPOC
//
//  Created by Guru Narayanan on 07/03/23.
//

import Foundation
import CoreLocation

class iBeaconDetector : NSObject, CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    let notificationHandler = NotificationHandler()
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
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print("\(beacons.count) are there in region")
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print(region)
//        notificationHandler.sendNotification(content: notificationHandler.createNotificationContent(title: "Hooray, Welcome", body: "You have entered into Wonderful app Region", badge: 1), trigger: notificationHandler.createNotificationTrigger(timeInterval: 5))
        print("Entered into beacon region")

    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//        notificationHandler.sendNotification(content: notificationHandler.createNotificationContent(title: "Thankyou verymuch for Visiting us", body: "Early waiting for your next arraival", badge: 1), trigger: notificationHandler.createNotificationTrigger(timeInterval: 5))
        print("Exited from beacon region")

    }
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("Failes")
    }
}
