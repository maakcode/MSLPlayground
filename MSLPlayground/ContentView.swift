//
//  ContentView.swift
//  MSLPlayground
//
//  Created by Makeeyaf on 2022/04/03.
//

import SwiftUI

struct ContentView: View {
    let filter = TickTokfyFilter()
    
    var body: some View {
        VStack {
            Image("github")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            if let image = filter.apply(UIImage(named: "github")) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
