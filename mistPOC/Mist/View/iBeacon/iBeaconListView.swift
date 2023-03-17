//
//  ContentView.swift
//  mistPOC
//
//  Created by Guru Narayanan on 06/03/23.
//

import SwiftUI

struct iBeaconListView: View {
    @ObservedObject var beaconDiscoverer = iBeaconDetector()
    var body: some View {
        if(beaconDiscoverer.insufficientHardware){
            Text("No Suitable Hardware found")
        }
        else if(beaconDiscoverer.insufficientPrevilage){
            SettingsNavigator(title: "Location permission is not granted")
        }
        else{
            if(beaconDiscoverer.availableBeacons.count > 0){
                List{
                    ForEach(beaconDiscoverer.availableBeacons,id: \.self) { beacon in
                        iBeaconInformationView(beacon: beacon)
                    }
                }
            }
            else{
                Text("No iBeacon Found")
            }
        }
     }
}

struct iBeaconListView_Previews: PreviewProvider {
    static var previews: some View {
        iBeaconListView()
    }
}
//
//ForEach(0...5, id: \.self) { beacon in
//    iBeaconInformationView(beacon: nil)
//}
