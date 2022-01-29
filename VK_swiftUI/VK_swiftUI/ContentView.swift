//
//  ContentView.swift
//  VK_SwiftUI
//
//  Created by Artem Firsov on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldShowFriendsView: Bool = false
    var body: some View {
        
        NavigationView {
            HStack {
            LoginView(isAuthorized: $shouldShowFriendsView)
                
            NavigationLink(
                destination: MainTabBarView(),
//                destination: FriendsView(),
                isActive: $shouldShowFriendsView) {
                EmptyView()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
