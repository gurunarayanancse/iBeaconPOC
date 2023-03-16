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
        List{
            ForEach(beaconDiscoverer.eddyBeacons, id: \.self) { beacon in
                EddyStoneBeaconInformationView(beacon: beacon)
            }
            ForEach(0...5, id: \.self) { beacon in
                EddyStoneBeaconInformationView(beacon: nil)
            }
        }
    }
}

struct EddyStoneBeaconListView_Previews: PreviewProvider {
    static var previews: some View {
        EddyStoneBeaconListView()
    }
}
