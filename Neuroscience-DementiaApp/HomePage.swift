//
//  HomePage.swift
//  Neuroscience-DementiaApp
//
//  Created by Ellie Sara Huang on 9/22/20.
//  Copyright © 2020 Neuroscience Amador Valley. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    @State private var physical = false
    
    var body: some View {
        //        NavigationView {
        //            NavigationLink(destination: Physical()) {
        //                HStack {
        //                    Image(systemName: "thermometer").frame(width: 50, height: 100)
        //                    Text("Neuroscience").font(.headline)
        //                }.navigationBarTitle(Text("October 6, 2020"))
        //            }
        //        }
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: { self.physical = true }) {
                            HStack {
                                Image(systemName: "thermometer")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width*0.1, height: geometry.size.height*0.05)
                                    .padding(.top)
                                    .padding(.bottom)
                                Text("Physical")
                                    .font(.system(size: geometry.size.width*0.07))
                                    .fontWeight(.bold)
                                    .padding(.trailing)
                            }
                            .padding()
                            .foregroundColor(.black)
                            .background(Color(.lightGray))
                            .cornerRadius(15.0)
                        }.sheet(isPresented: self.$physical) {
                            Physical()
                        }
                        Spacer()
                    }.navigationBarTitle(Text("October 6, 2020"))
                    Spacer()
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
