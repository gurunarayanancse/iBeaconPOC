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
        VStack(spacing : 3){
            Text("UUID")
            Text("Major")
            Text("Minor")
            Text("proximity")
        }
    }
}

struct iBeaconInformationView_Previews: PreviewProvider {
    static var previews: some View {
        iBeaconInformationView()
    }
}
