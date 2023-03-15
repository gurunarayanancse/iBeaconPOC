//
//  HomeView.swift
//  mistPOC
//
//  Created by Guru Narayanan on 15/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing : 15){
            Button("Scan iBeacons") {
                print("ibeacon Selected")
            }.frame(width: 150).padding(5).background(Color.purple)
            Button("Scan EddyStone ") {
                print("ibeacon Selected")
            }.frame(width: 150).padding(5).background(Color.blue)
        }.foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
