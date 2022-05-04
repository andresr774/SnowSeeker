//
//  AlertAndSheetWithOptionals.swift
//  SnowSeeker
//
//  Created by Andres camilo Raigoza misas on 1/05/22.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertAndSheetWithOptionals: View {
    @State private var selelctedUser: User?
    @State private var isShowingUser = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                selelctedUser = User()
                isShowingUser = true
            }
//            .sheet(item: $selelctedUser) { user in
//                Text(user.id)
//            }
//            .alert("Welcome", isPresented: $isShowingUser, presenting: selelctedUser) { user in
//                Button(user.id) { }
//            }
            .alert("Welcome", isPresented: $isShowingUser) { }
    }
}

struct AlertAndSheetWithOptionals_Previews: PreviewProvider {
    static var previews: some View {
        AlertAndSheetWithOptionals()
    }
}
