//
//  MDLAsset+usdz.swift
//  obj2usdz
//
//  MIT License
//
//  Copyright (c) 2018-present patrick piemonte (http://patrickpiemonte.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import ModelIO

fileprivate let usdcFileExtension = "usdc"
fileprivate let usdzFileExtension = "usdz"

extension MDLAsset {
    
    /// export/convert an OBJ file to USDZ format on device
    ///
    /// - Parameters:
    ///   - destinationUrl: USDZ destination file URL, ex: "path/example.usdz"
    ///   - completionHandler: completion handler for the operation, (completed, error)
    public func exportToUSDZ(destinationFileUrl: URL, completionHandler: ((Bool, Error?) -> Void)? = nil) {
        // check if destinationUrl is valid
        if !FileManager.default.fileExists(atPath: destinationFileUrl.absoluteString) {
            DispatchQueue.main.async {
                completionHandler?(false, nil)
            }
        }
        
        // check if destination is ".usdz"
        // https://graphics.pixar.com/usd/docs/Usdz-File-Format-Specification.html
        if destinationFileUrl.pathExtension != usdzFileExtension {
            DispatchQueue.main.async {
                completionHandler?(false, nil)
            }
        }
        
        // export the .obj asset and create a temp .usdc file
        let usdcDestinationFileUrl = destinationFileUrl.deletingPathExtension().appendingPathExtension(usdcFileExtension)
        if MDLAsset.canExportFileExtension(usdcFileExtension) {
            do {
                try self.export(to: usdcDestinationFileUrl)
            } catch let error {
                DispatchQueue.main.async {
                    completionHandler?(false, error)
                }
            }
        } else {
            DispatchQueue.main.async {
                completionHandler?(false, nil)
            }
        }

        // rename the .usdc file to .usdz
        // https://www.scandy.co/blog/how-to-export-simple-3d-objects-as-usdz-on-ios
        do {
            try FileManager.default.moveItem(at: usdcDestinationFileUrl, to: destinationFileUrl)
        } catch let error {
            DispatchQueue.main.async {
                completionHandler?(false, error)
            }
        }
        
        // success!
        DispatchQueue.main.async {
            completionHandler?(true, nil)
        }
    }
    
}
