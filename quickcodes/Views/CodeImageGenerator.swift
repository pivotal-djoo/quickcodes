//
//  CodeImageGenerator.swift
//  quickcodes
//
//  Created by David Joo on 2020-06-17.
//  Copyright © 2020 djoo. All rights reserved.
//

import SwiftUI

class CodeImageGenerator {
    public static func generateQRCode(from string: String) -> NSImage? {
        let data = string.data(using: String.Encoding.ascii)
        
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
    
    public static func generateDatamatrix(from string: String) -> NSImage? {
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
