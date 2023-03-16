//
//  HomeView.swift
//  mistPOC
//
//  Created by Guru Narayanan on 15/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing : 15){
                
                // Ibeacon Navigation
                NavigationLink {
                    iBeaconListView().navigationBarTitleDisplayMode(.inline).navigationTitle("Available iBeacon")
                } label: {
                    Text("Scan iBeacons").frame(width: 220).padding(5).background(Color.purple)
                }
                
                // Eddystone Beacon Navigation
                NavigationLink {
                    EddyStoneBeaconListView().navigationBarTitleDisplayMode(.inline).navigationTitle("Availble Eddystone Beacons")
                } label: {
                    Text("Scan EddyStone Beacons").frame(width: 220).padding(5).background(Color.blue)
                }
            }.foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
