//
//  NewSymptom.swift
//  Neuroscience-DementiaApp
//
//  Created by Ellie Sara Huang on 11/6/20.
//  Copyright © 2020 Neuroscience Amador Valley. All rights reserved.
//

import SwiftUI

struct NewSymptom: View {
    
    @State var newSymptom: String = ""
    @State var addSymptom: Bool = false
    
    @State private var newSymptomArr: [String] = []
    
    var body: some View {
        HStack {
            Text("New Symptom")
                .font(.title).fontWeight(.bold).padding(.leading, UIScreen.main.bounds.width*0.03)
        }
        HStack {
            TextField("Enter new symptom name", text: $newSymptom)
                .textFieldStyle(CustomTextFieldStyle())
            Button(action: {
                
                self.newSymptomArr.append(self.newSymptom)
                self.newSymptom = ""
                
            }) {
                HStack(alignment: .center) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.02)
                }
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.15, height: UIScreen.main.bounds.height*0.037)
                .background(Color(#colorLiteral(red: 0, green: 0.5492870212, blue: 1, alpha: 1)))
            }
        }
        
        List {
            ForEach(0..<self.newSymptomArr.count, id:\.self) {
                Text(self.newSymptomArr[$0])
            }
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(.leading, UIScreen.main.bounds.width*0.03)
            .padding(.top, UIScreen.main.bounds.width*0.015)
            .padding(.bottom, UIScreen.main.bounds.width*0.015)
            .background(Color(#colorLiteral(red: 0.9339778938, green: 0.9339778938, blue: 0.9339778938, alpha: 1)))
            .cornerRadius(8)
    }
}

struct NewSymptom_Previews: PreviewProvider {
    static var previews: some View {
        NewSymptom()
    }
}
