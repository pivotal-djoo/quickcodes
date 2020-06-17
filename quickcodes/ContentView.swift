//
//  ContentView.swift
//  quickcodes
//
//  Created by David Joo on 2020-06-16.
//  Copyright © 2020 djoo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var codeType = 0
    
    var body: some View {
        let data = getData()
        
        return VStack() {
            Picker(selection: $codeType, label: Text("")) {
                Text("Jane Doe QR").tag(0)
                Text("Random QR").tag(1)
                Text("Random Datamatrix").tag(2)
            }
                .pickerStyle(SegmentedPickerStyle())
                .padding(10)
                .frame(width: 400, height: 50, alignment: .leading)
            
            Image(nsImage: generateImage(from: data)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(30)
                .background(Color.white)
                .frame(width: 400, height: 390, alignment: .center)
            
            Text("Content")
                .foregroundColor(Color.primary)
                .font(.body)
                .padding(10)
        
            Text(data)
                .foregroundColor(Color.secondary)
                .font(.body)
                .padding()
                .frame(width: 400, height: 200, alignment: .top)
        }
    }
    
    private func getData() -> String {
        if (codeType == 0) {
            return """
            {
                "firstName": "Jane",
                "lastName": "Doe",
                "dob": "1900-03-04",
                "email": "jdoe@jdoe.com",
                "oid": "user-oid"
            }
            """
        }
        
        return UUID().uuidString
    }

    private func generateImage(from string: String) -> NSImage? {
        let data = string.data(using: String.Encoding.ascii)

        if (codeType == 2) {
            return generateDatamatrix(from: string)
        } else {
            return generateQRCode(from: data!)
        }
    }
    
    private func generateQRCode(from data: Data) -> NSImage? {
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                let rep = NSCIImageRep(ciImage: output)
                let nsImage = NSImage(size: rep.size)
                nsImage.addRepresentation(rep)
                return nsImage
            }
        }
        return nil
    }
    
    private func generateDatamatrix(from string: String) -> NSImage? {
        let writer = ZXMultiFormatWriter()
        let hints = ZXEncodeHints() as ZXEncodeHints
        let result = try! writer.encode(string, format: kBarcodeFormatDataMatrix, width: 1000, height: 1000, hints: hints)

        if let imageRef = ZXImage.init(matrix: result) {
            if let image = imageRef.cgimage {
                return NSImage(cgImage: image, size: NSSize(width: 300, height: 300))
            }
        }
        return nil
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

