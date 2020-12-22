//
//  Social.swift
//  Neuroscience-DementiaApp
//
//  Created by Ellie Sara Huang on 12/21/20.
//  Copyright © 2020 Neuroscience Amador Valley. All rights reserved.
//

import SwiftUI

struct Social: View {
    
    @Environment(\.presentationMode) var presentationMode
    private let sSymptoms = ["Inability to speak properly",
                             "Slurring",
                             "Inability to identify object",
                             "Difficulty forming sentences",
                             "Cognitive impairment",
                             "Hostile behavior",
                             "Isolation from others",
                             "Unhealthy reliance on others",
                             "Abnormal stress",
                             "Abnormal fatigue"]
    @State var sChecks = [false, false, false, false, false, false, false, false, false, false]
    @State var newSymptom = false
    
    init() {
        UITableView.appearance().backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.8804875016, blue: 0.7963053584, alpha: 1)
        UITableViewCell.appearance().backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.8804875016, blue: 0.7963053584, alpha: 1)
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            NavigationView {
                
                ZStack {
                    Color(#colorLiteral(red: 0.9529411765, green: 0.8804875016, blue: 0.7963053584, alpha: 1)).edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        
                        Text("Social Symptoms").font(.largeTitle).fontWeight(.bold)
                        Text("Select all that apply").font(.caption).foregroundColor(Color.blue)
                            .padding(.top, geometry.size.height*0.013)
                        
                        List {
                            
                            ForEach(0..<self.sChecks.count) { i in
                                HStack {
                                    
                                    Text(self.sSymptoms[i])
                                    
                                    Spacer()
                                    
                                    Button (action: { self.sChecks[i].toggle() }) {
                                        if self.sChecks[i] {
                                            Image(systemName: "checkmark.square.fill")
                                                .foregroundColor(Color.blue)
                                        }
                                        else {
                                            Image(systemName: "square.fill")
                                                .foregroundColor(Color(#colorLiteral(red: 0.9339778938, green: 0.9339778938, blue: 0.9339778938, alpha: 1)))
                                        }
                                    }
                                    
                                }.listRowBackground(Color(#colorLiteral(red: 0.9529411765, green: 0.8804875016, blue: 0.7963053584, alpha: 1)))
                            }
                        }
                        
                        Button (action: { self.newSymptom = true }) {
                            
                            HStack (alignment: .center) {
                                
                                Text("New Symptom")
                                    .font(.system(size: geometry.size.width * 0.048))
                                    .fontWeight(.bold)
                                Image(systemName: "plus")
                                    .frame(width: geometry.size.width * 0.05,
                                           height: geometry.size.height * 0.05)
                            }
                            .padding()
                            .foregroundColor(Color(.white))
                            .frame(width: geometry.size.width * 0.5,
                                   height: geometry.size.height * 0.063)
                                .background(Color.blue)
                                .cornerRadius(10)
                            
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

struct Social_Previews: PreviewProvider {
    static var previews: some View {
        Social()
    }
}
