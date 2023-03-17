//
//  EddyStoneBeaconListView.swift
//  mistPOC
//
//  Created by Guru Narayanan on 16/03/23.
//

import SwiftUI

struct EddyStoneBeaconListView: View {
    @ObservedObject var beaconDiscoverer = EddyStoneBeaconDiscoverer()
    var body: some View {
        if(beaconDiscoverer.insufficientHardware){
            Text("No Suitable Hardware found")
        }
       else if(beaconDiscoverer.insufficientPrevilage){
            SettingsNavigator(title: "Bluetooth Permission not given.")
        }
        else{
            if(beaconDiscoverer.eddyBeacons.count > 0){
                List{
                    ForEach(beaconDiscoverer.eddyBeacons, id: \.self) { beacon in
                        EddyStoneBeaconInformationView(beacon: beacon)
                    }
                }
            }
            else{
                Text("No Eddystone beacons availble")
            }
        }
       
    }
}

struct EddyStoneBeaconListView_Previews: PreviewProvider {
    static var previews: some View {
        EddyStoneBeaconListView()
    }
}

//
//ForEach(0...5, id: \.self) { beacon in
//    EddyStoneBeaconInformationView(beacon: nil)
//}
