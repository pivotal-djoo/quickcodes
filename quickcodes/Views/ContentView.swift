//
//  ContentView.swift
//  quickcodes
//
//  Created by David Joo on 2020-06-16.
//  Copyright © 2020 djoo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var pickerIndex = 0
    
    var body: some View {
        let pickerData = [
            CodeType.qr(SampleData.exampleData),
            CodeType.qr(UUID().uuidString),
            CodeType.datamatrix(UUID().uuidString)
        ]

        return VStack() {
            Picker(selection: $pickerIndex, label: Text("")) {
                Text("Jane Doe QR").tag(0)
                Text("Random QR").tag(1)
                Text("Random Datamatrix").tag(2)
            }
                .pickerStyle(SegmentedPickerStyle())
                .padding(10)
                .frame(width: 400, height: 50, alignment: .leading)
            
            Image(nsImage: pickerData[pickerIndex].codeImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(30)
                .background(Color.clear)
                .frame(width: 400, height: 390, alignment: .center)
            
            Text("Content")
                .foregroundColor(Color.primary)
                .font(.body)
                .padding(10)
        
            Text(pickerData[pickerIndex].data)
                .foregroundColor(Color.secondary)
                .font(.body)
                .padding()
                .frame(width: 400, height: 200, alignment: .top)
        }
        .background(VisualEffectView(
            material: colorScheme == .dark ? .dark : .light,
            blendingMode: NSVisualEffectView.BlendingMode.behindWindow
        ))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

