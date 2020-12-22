//
//  SettingsView.swift
//  Neuroscience-DementiaApp
//
//  Created by Ellie Sara Huang on 12/21/20.
//  Copyright © 2020 Neuroscience Amador Valley. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings").font(.largeTitle).fontWeight(.bold)
            Text("In progress").font(.caption)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
