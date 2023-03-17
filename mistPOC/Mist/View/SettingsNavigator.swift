//
//  SettingsNavigator.swift
//  mistPOC
//
//  Created by Guru Narayanan on 17/03/23.
//

import SwiftUI

struct SettingsNavigator: View {
    var title : String = ""
    var body: some View {
        VStack(spacing : 8){
            Text(title)
            Button("Go to Settings") {
                guard let url = URL(string: UIApplication.openSettingsURLString) else{return}
                if UIApplication.shared.canOpenURL(url){
                    UIApplication.shared.open(url)
                }
            }
        }
    }
}

struct SettingsNavigator_Previews: PreviewProvider {
    static var previews: some View {
        SettingsNavigator()
    }
}
