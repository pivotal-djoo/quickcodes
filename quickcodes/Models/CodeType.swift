//
//  CodeType.swift
//  quickcodes
//
//  Created by David Joo on 2020-06-17.
//  Copyright © 2020 djoo. All rights reserved.
//

import Foundation
import SwiftUI

enum CodeType {
    case qr(String)
    case datamatrix(String)
    
    var data: String {
        get {
            switch self {
            case .qr(let data):
                return data
            case .datamatrix(let data):
                return data
            }
        }
    }
    
    var codeImage: NSImage? {
        get {
            switch self {
            case .qr(let data):
                return CodeImageGenerator.generateQRCode(from: data)
            case .datamatrix(let data):
                return CodeImageGenerator.generateDatamatrix(from: data)
            }
        }
    }
}
