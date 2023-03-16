//
//  iBeaconInformationView.swift
//  mistPOC
//
//  Created by Guru Narayanan on 14/03/23.
//

import SwiftUI
import CoreLocation

struct iBeaconInformationView: View {
    var beacon : CLBeacon?
    var body: some View {
        VStack(alignment: .leading,spacing : 3){
            Text("UUID : \(self.beacon?.uuid.uuidString ?? "UUID")")
            HStack(spacing : 5){
                Text("Minor : \(self.beacon?.minor ?? 0)")
                Text("Major : \(self.beacon?.major ?? 0)")
            }
            Text("Proximity : \(self.beacon?.proximity.rawValue ?? 0)")
            Text("Signal Strength : \(self.beacon?.rssi ?? 0)")
            Text("Accuracy : \(self.beacon?.accuracy ?? 0)")
        }
    }
}

struct iBeaconInformationView_Previews: PreviewProvider {
    static var previews: some View {
        iBeaconInformationView()
    }
}
