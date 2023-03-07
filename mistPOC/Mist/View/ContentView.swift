//
//  ContentView.swift
//  mistPOC
//
//  Created by Guru Narayanan on 06/03/23.
//

import SwiftUI

struct HomeView: View {
    let beaconDiscoverer = BeaconDetector()
    var body: some View {
        Text("Hello")
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
