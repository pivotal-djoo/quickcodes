//
//  CodeTypeSpec.swift
//  quickcodesTests
//
//  Created by david on 2020-06-17.
//  Copyright © 2020 djoo. All rights reserved.
//

@testable import quickcodes

import Quick
import Nimble

class CodeTypeSpec: QuickSpec {
  override func spec() {
    describe("CodeType") {
      it("can be initialized with data") {
        let qrCode = CodeType.qr("qr-code-data")
        let datamatrixCode = CodeType.datamatrix("datamatrix-code-data")
        
        expect(qrCode).notTo(beNil())
        expect(datamatrixCode).notTo(beNil())
      }

      context("initialized CodeType") {
        let qrCode = CodeType.qr("qr-code-data")
        let datamatrixCode = CodeType.datamatrix("datamatrix-code-data")
        
        it("can return data") {
            expect(qrCode.data).to(equal("qr-code-data"))
            expect(datamatrixCode.data).to(equal("datamatrix-code-data"))
        }
        
        it("can generate code image") {
            expect(qrCode.codeImage).notTo(beNil())
            expect(datamatrixCode.codeImage).notTo(beNil())
        }
      }
    }
  }
}
