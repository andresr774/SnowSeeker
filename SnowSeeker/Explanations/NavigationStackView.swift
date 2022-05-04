//
//  NavigationStackView.swift
//  SnowSeeker
//
//  Created by Andres camilo Raigoza misas on 3/05/22.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New Secondary")
            } label: {
                Text("Primary label")
            }
            Text("Secondary")
        }
        //.phoneOnlyNavigationView()
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}
