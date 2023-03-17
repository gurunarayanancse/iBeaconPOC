//
//  EddyStoneScanner.swift
//  mistPOC
//
//  Created by Guru Narayanan on 15/03/23.
//

import Foundation
import CoreBluetooth
import EddystoneScanner

/// Class (ViewModel) to provide a service to detect EddystoneBeacons
///```
/// Steps:
/// 1. import the EddyStoneScanner
/// 2. Assign delegate
/// 3. we are good since Authorization handled by Eddystone frameword itself
/// 4. Start Scanning
/// 4. Implement all the skeletons mentioned in Scanner delegate protocol
///     1. Update EddyBeacons from Methods in Scanner delegate
///```

class EddyStoneBeaconDiscoverer : NSObject,ObservableObject{
    
    let bluetoothCentralManager = CBCentralManager()
    ///Scanner - it is the one , will help us to handle EddyBeacons
    let eddystoneScanner = EddystoneScanner.Scanner()
    
    ///Updated and available EddystoneBeacons
    @Published var eddyBeacons : [Beacon] = []
   
    /// variable to handle insufficient hardware scenario
    @Published var insufficientPrevilage : Bool = false
    
    //variable to handle insufficient previlages
    @Published var insufficientHardware : Bool = false
  
    /// Initalizer Use
    /// ```
    /// 1. Assign Delegate to EddyStoneScanner
    /// 2. Start Scanning
    /// ```
    override init(){
        super.init()
        
        eddystoneScanner.startScanning()
        eddystoneScanner.delegate = self
        bluetoothCentralManager.delegate = self
    }
}


// Implementation of Delegate functions of ScannerDelegate
extension EddyStoneBeaconDiscoverer : ScannerDelegate{
    
    /// Will get Called once a new beacon found.
    /// ```
    /// 1. We are Adding the Values our variable eddyBeacons - where we manage all the available beacons
    /// ```
    func didFindBeacon(scanner: EddystoneScanner.Scanner, beacon: EddystoneScanner.Beacon) {
        eddyBeacons.append(beacon)
    }
    
    // Will get Called once a beacon is not available to the end device.
    /// ```
    /// 1. We are finding the index of the specific beacon
    /// 2. Removing that beacon from our eddyBeacon array(aka EddyBeacons repo)
    /// ```
    func didLoseBeacon(scanner: EddystoneScanner.Scanner, beacon: EddystoneScanner.Beacon) {
        let index = eddyBeacons.firstIndex(of: beacon)
        if let index = index{
            eddyBeacons.remove(at: index)
        }else{return}
    }
    
    // Will get Called once a beacon is modified - (like signal strength and proximity).
    /// ```
    /// 1. We are finding the index of the specific beacon
    /// 2. updating the specific beacon depend if it is already available
    /// 3. if the beacon not available on the eddyBeacon Array(our beacon repo), insert it
    /// 4. Here Main Queue is very important because updation process is happening in background thread by default. and publishing the values should not be through background thread. so enclose statments MainQueue
    /// ```
    func didUpdateBeacon(scanner: EddystoneScanner.Scanner, beacon: EddystoneScanner.Beacon) {
        DispatchQueue.main.async{
            let index = self.eddyBeacons.firstIndex(of: beacon)
            if let index = index{
                self.eddyBeacons[index] = beacon
            }else{
                self.eddyBeacons.append(beacon)
            }
        }
    }
    func didUpdateScannerState(scanner: EddystoneScanner.Scanner, state: EddystoneScanner.State) {
    }
}

extension EddyStoneBeaconDiscoverer : CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        self.insufficientHardware = central.state == .unsupported
        self.insufficientPrevilage = central.state == .unauthorized
    }
}
