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
        VStack{
            Text("Available iBeacons")
            List{
                ForEach(beaconDiscoverer.availableBeacons,id: \.self) { beacon in
                    iBeaconInformationView(beacon: beacon)
                }
                ForEach(0...5,id: \.self) { beacon in
                    iBeaconInformationView(beacon: nil)
                }
            }
        }
       
    }
}

struct iBeaconListView_Previews: PreviewProvider {
    static var previews: some View {
        iBeaconListView()
    }
}
