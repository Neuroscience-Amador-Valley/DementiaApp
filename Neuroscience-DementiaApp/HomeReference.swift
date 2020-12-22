//
//  HomeReference.swift
//  Neuroscience-DementiaApp
//
//  Created by Ellie Sara Huang on 9/22/20.
//  Copyright © 2020 Neuroscience Amador Valley. All rights reserved.
//

import SwiftUI

struct HomeReference: View {
    
    @State private var physical = false
    @State private var mental = false /// new
    @State private var social = false /// new
    
    var body: some View {
        GeometryReader { geometry in
            
            NavigationView { /// new
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        VStack { /// new
                            
                            Button(action: { self.physical = true }) {
                                
                                HStack {
                                    Text("Physical")
                                        .font(.system(size: geometry.size.width*0.07))
                                        .fontWeight(.bold)
                                        .frame(width: geometry.size.width*0.3) /// new
                                        .padding() /// changed to padding in all directions
                                    
                                    Image(systemName: "hand.raised") /// changed SF Symbols
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.105) /// changed CGFloat values
                                        .padding(.leading) /// changed from .top to .leading
                                    
                                    Spacer() /// new
                                }
                                .padding()
                                .foregroundColor(Color(#colorLiteral(red: 0.2928513885, green: 0.2821008563, blue: 0.2951488495, alpha: 1))) /// changed color
                                .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.23) /// new (make sure it's the third modifier)
                                .background(Color(#colorLiteral(red: 0.7568627451, green: 0.8426002264, blue: 0.8870300651, alpha: 1))) /// changed color
                                .cornerRadius(25) /// changed to 25.0
                                
                            }.padding(.top) /// new
                            .sheet(isPresented: self.$physical) {
                                Physical()
                            }
                            
                            Button(action: { self.mental = true }) {
                                
                                HStack {
                                    Text("Mental")
                                        .font(.system(size: geometry.size.width*0.07))
                                        .fontWeight(.bold)
                                        .frame(width: geometry.size.width*0.3)
                                        .padding()
                                    
                                    Image(systemName: "eye")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.105)
                                        .padding(.leading)
                                    
                                    Spacer()
                                }
                                .padding()
                                .foregroundColor(Color(#colorLiteral(red: 0.2928513885, green: 0.2821008563, blue: 0.2951488495, alpha: 1)))
                                .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.23)
                                .background(Color(#colorLiteral(red: 0.7541411519, green: 0.8313546777, blue: 0.9701576829, alpha: 1)))
                                .cornerRadius(25)
                                
                            }
                            
                            Button(action: { self.social = true }) {
                                
                                HStack {
                                    Text("Social")
                                        .font(.system(size: geometry.size.width*0.07))
                                        .fontWeight(.bold)
                                        .frame(width: geometry.size.width*0.3)
                                        .padding()
                                    
                                    Image(systemName: "person.3.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.105)
                                        .padding(.leading)
                                    
                                    Spacer()
                                }
                                .padding()
                                .foregroundColor(Color(#colorLiteral(red: 0.2928513885, green: 0.2821008563, blue: 0.2951488495, alpha: 1)))
                                .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.23)
                                .background(Color(#colorLiteral(red: 0.9529411765, green: 0.8804875016, blue: 0.7963053584, alpha: 1)))
                                .cornerRadius(25)
                                
                            }
                            
                        }
                        
                        Spacer()
                        
                    }.navigationBarTitle(Text("Novemember 17")) /// now modifies VStack not HStack
                    
                    Spacer()
                }
            }
        }
    }
}

struct HomeReference_Previews: PreviewProvider {
    static var previews: some View {
        HomeReference()
    }
}
