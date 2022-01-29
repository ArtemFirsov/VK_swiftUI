//
//  FriendsView.swift
//  VK_SwiftUI
//
//  Created by Artem Firsov on 1/18/22.
//

import SwiftUI

struct FriendsView: View {
    
    @State private var addFriendModal: Bool = false
    
    var friendsArray = [
        FriendModel(name: "Ivan"),
        FriendModel(name: "Artem"),
        FriendModel(name: "Soonya"),
        FriendModel(name: "Ulya"),
        FriendModel(name: "Pavel")]
    var body: some View {

        List(friendsArray) { friend in
            NavigationLink(
                destination: FriendGallery(name: friend.name)) {
            HStack {
                Image("buster")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea(.all)
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(20)
                Text(friend.name)
                    .padding(.leading, 20)
                Spacer()
            }
            }
            .navigationBarTitle("Друзья", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.addFriendModal.toggle()
    //            print(self.addFriendModal).
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $addFriendModal, content: {
                FriendGallery()
            })
        }
    }
    
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
