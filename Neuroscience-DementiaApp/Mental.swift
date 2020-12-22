//
//  Mental.swift
//  Neuroscience-DementiaApp
//
//  Created by Ellie Sara Huang on 12/21/20.
//  Copyright © 2020 Neuroscience Amador Valley. All rights reserved.
//

import SwiftUI

struct Mental: View {
    
    @Environment(\.presentationMode) var presentationMode
    private let mSymptoms = ["Forgetfulness"]
    @State var mChecks = [false]
    @State var newSymptom = false
    
    init() {
        UITableView.appearance().backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1)
        UITableViewCell.appearance().backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1)
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            NavigationView {
                
                ZStack {
                    Color(#colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1)).edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        
                        Text("Physical Symptoms").font(.largeTitle).fontWeight(.bold)
                        Text("Select all that apply").font(.caption).foregroundColor(Color.blue)
                            .padding(.top, geometry.size.height*0.013)
                        
                        List {
                            
                            ForEach(0..<self.mChecks.count) { i in
                                HStack {
                                    
                                    Text(self.mSymptoms[i])
                                    
                                    Spacer()
                                    
                                    Button (action: { self.mChecks[i].toggle() }) {
                                        if self.mChecks[i] {
                                            Image(systemName: "checkmark.square.fill")
                                                .foregroundColor(Color.blue)
                                        }
                                        else {
                                            Image(systemName: "square.fill")
                                                .foregroundColor(Color(#colorLiteral(red: 0.9339778938, green: 0.9339778938, blue: 0.9339778938, alpha: 1)))
                                        }
                                    }
                                    
                                }.listRowBackground(Color(#colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1)))
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

struct Mental_Previews: PreviewProvider {
    static var previews: some View {
        Mental()
    }
}
