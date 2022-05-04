//
//  TwoSideBySideViews.swift
//  SnowSeeker
//
//  Created by Andres camilo Raigoza misas on 1/05/22.
//

import SwiftUI

struct TwoSideBySideViews: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New Secondary")
            } label: {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Primary")
            
            Text("Secondary")
            
            Text("Tertiary")
        }
    }
}

struct TwoSideBySideViews_Previews: PreviewProvider {
    static var previews: some View {
        TwoSideBySideViews()
            .previewInterfaceOrientation(.portrait)
    }
}
