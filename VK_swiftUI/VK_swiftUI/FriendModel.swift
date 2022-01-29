//
//  FriendModel.swift
//  VK_SwiftUI
//
//  Created by Artem Firsov on 1/18/22.
//

import SwiftUI


struct FriendModel: Identifiable {
    var name: String
    var id: String { name }
}
