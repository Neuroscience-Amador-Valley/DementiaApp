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
    private let pSymptoms = ["Having an unkempt appearance", "Inability to wash body", "Trouble putting on clothes", "Difficulty brushing teeth", "Inability to shave/comb hair", "Convulsions"] /// added 4 more and reordered
    @State var pChecks = [false, false, false, false, false, false] /// added 4 more
    @State var newSymptom = false
    
    init() { /// added
        UITableView.appearance().backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1)
        UITableViewCell.appearance().backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1)
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        GeometryReader { geometry in /// new
            
            NavigationView { /// new
                
                ZStack {
                    Color(#colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1)).edgesIgnoringSafeArea(.all) /// new
                    
                    VStack {
                        
                        Text("Physical Symptoms").font(.largeTitle).fontWeight(.bold) /// added .bold
                        Text("Select all that apply").font(.caption).foregroundColor(Color.blue)
                            .padding(.top, geometry.size.height*0.013) /// added modifiers
                        
                        List {
                            
                            ForEach(0..<self.pChecks.count) { i in
                                HStack {
                                    
                                    Text(self.pSymptoms[i])
                                    
                                    Spacer()  /// new
                                    
                                    Button (action: { self.pChecks[i].toggle() }) {
                                        if self.pChecks[i] {
                                            Image(systemName: "checkmark.square.fill")
                                                .foregroundColor(Color.blue) /// new
                                        }
                                        else {
                                            Image(systemName: "square.fill")
                                                .foregroundColor(Color(#colorLiteral(red: 0.9339778938, green: 0.9339778938, blue: 0.9339778938, alpha: 1))) /// new
                                        }
                                    }
                                    
                                }.listRowBackground(Color(#colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1))) /// new
                            }
                        }
                        
                        Button (action: { self.newSymptom = true }) {
                            
                            HStack (alignment: .center) {
                                
                                Text("New Symptom")
                                    .font(.system(size: geometry.size.width * 0.048)) /// new
                                    .fontWeight(.bold) /// new
                                Image(systemName: "plus")
                                    .frame(width: geometry.size.width * 0.05,
                                           height: geometry.size.height * 0.05) /// new
                            }
                            .padding() /// new
                            .foregroundColor(Color(.white)) /// new
                            .frame(width: geometry.size.width * 0.5,
                                   height: geometry.size.height * 0.063) /// new
                                .background(Color.blue) /// new
                                .cornerRadius(10) /// new
                            
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
    }
}

struct Physical_Previews: PreviewProvider {
    static var previews: some View {
        Physical()
    }
}
