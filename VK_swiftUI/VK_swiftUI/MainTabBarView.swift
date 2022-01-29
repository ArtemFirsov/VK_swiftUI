//
//  MainTabBarView.swift
//  VK_SwiftUI
//
//  Created by Artem Firsov on 1/21/22.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {

        TabView {
            FriendGallery()
                .tabItem {
                    Text("Галерея")
                    Image(systemName: "photo.fill")
                }
            FriendsView()
                .tabItem {
                    Text("Друзья")
                    Image(systemName: "house.fill")
                }
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
