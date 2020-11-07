//
//  Physical.swift
//  Neuroscience-DementiaApp
//
//  Created by Ellie Sara Huang on 9/22/20.
//  Copyright © 2020 Neuroscience Amador Valley. All rights reserved.
//

import SwiftUI

struct Physical: View {
    
    @Environment(\.presentationMode) var presentationMode
    private let pSymptoms = ["Inability to wash body", "Trouble putting on clothes"]
    @State var pChecks = [false, false]
    @State var newSymptom = false
    
    init() {
        UITableView.appearance().backgroundColor = #colorLiteral(red: 0.6737673472, green: 1, blue: 0.9499762451, alpha: 1)
        UITableViewCell.appearance().backgroundColor = #colorLiteral(red: 0.6737673472, green: 1, blue: 0.9499762451, alpha: 1)
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Physical Symptoms").font(.largeTitle)
                Text("Select all that apply")
                List {
                    ForEach(0..<self.pChecks.count) { i in
                        HStack {
                            Text(self.pSymptoms[i])
                            Button (action: { self.pChecks[i].toggle() }) {
                                if self.pChecks[i] {
                                    Image(systemName: "checkmark.square.fill")
                                }
                                else {
                                    Image(systemName: "square.fill")
                                }
                            }
                        }
                    }
                }
                Button (action: { self.newSymptom = true }) {
                    HStack (alignment: .center) {
                        Text("New Symptom")
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: self.$newSymptom) {
                    NewSymptom()
                }
            }.navigationBarItems(
                leading: Button("Home") { self.presentationMode.wrappedValue.dismiss()},
                trailing: Button("Submit") { self.presentationMode.wrappedValue.dismiss() }
            )
        }
    }
}

struct Physical_Previews: PreviewProvider {
    static var previews: some View {
        Physical()
    }
}
