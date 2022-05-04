//
//  GroupAsTransparentLayout.swift
//  SnowSeeker
//
//  Created by Andres camilo Raigoza misas on 1/05/22.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Andrés")
            Text("Country: Colombia")
            Text("Pets: No pets")
        }
    }
}

struct HorizontalAvailableSpace: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    var body: some View {
        Group {
            if sizeClass == .compact && typeSize > .large {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
        // This limits the range of dynamic type
        // It will resize the text just for dynamic types below to or including xxxLarge
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
}

struct HorizontalAvailableSpace_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalAvailableSpace()
            .previewInterfaceOrientation(.portrait)
    }
}
