//
//  EddyStoneBeaconInformationView.swift
//  mistPOC
//
//  Created by Guru Narayanan on 16/03/23.
//

import SwiftUI
import EddystoneScanner

struct EddyStoneBeaconInformationView: View {
    var beacon : Beacon?
    var body: some View {
        VStack(alignment: .leading,spacing: 5) {
            Text("Name : \(beacon?.name ?? "EddyBeacon")")
            Text("UUID : \(beacon?.identifier.uuidString ?? "UUID")")
            Text("beaconID : \(beacon?.beaconID.description ?? "UUID")")
            Text("RSSI : \(beacon?.rssi ?? 0)")
            Text("URL: \(beacon?.eddystoneURL?.absoluteString ?? "URL")")
        }
    }
}

struct EddyStoneBeaconInformationView_Previews: PreviewProvider {
    static var previews: some View {
        EddyStoneBeaconInformationView()
    }
}
