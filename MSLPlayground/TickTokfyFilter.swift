//
//  TickTokfyFilter.swift
//  MSLPlayground
//
//  Created by Makeeyaf on 2022/04/03.
//

import UIKit
import CoreImage

class TickTokfyFilter: CIFilter {
    private let context = CIContext()
    private let kernel: CIKernel? = {
        guard let url = Bundle.main.url(forResource: "default", withExtension: "metallib"),
              let data = try? Data(contentsOf: url)
        else { return nil }
        
        return try? CIKernel(functionName: "tiktokfy", fromMetalLibraryData: data)
    }()
    
    func apply(_ sourceImage: UIImage?, offset: CGFloat) -> UIImage? {
        let offset = max(-1.0, min(1.0, offset))
        
        guard let sourceImage = sourceImage,
              let inputImage = CIImage(image: sourceImage),
              let outputImage = kernel?.apply(extent: inputImage.extent, roiCallback: ({ index, rect in rect }), arguments: [inputImage, offset]),
              let cgImage = context.createCGImage(outputImage, from: outputImage.extent)
        else { return nil }
        
        return UIImage(cgImage: cgImage)
    }
}
