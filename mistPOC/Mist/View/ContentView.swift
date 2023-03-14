//
//  ContentView.swift
//  mistPOC
//
//  Created by Guru Narayanan on 06/03/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var beaconDiscoverer = iBeaconDetector()
    var body: some View {
        Text("Something")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
