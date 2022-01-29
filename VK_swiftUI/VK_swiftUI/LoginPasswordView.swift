//
//  LoginView.swift
//  VK_SwiftUI
//
//  Created by Artem Firsov on 1/14/22.
//

import Foundation
import SwiftUI

struct LoginPasswordView: View {
    
    @Binding var login: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            HStack {
                Label("Введите логин", systemImage: "")
                TextField("Заполните поле", text: $login)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 150)
            }
            .padding(.bottom, 20)
            
            HStack {
                Label("Введите пароль", systemImage: "")
                TextField("Заполните поле", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 150)
            }
            .padding(.bottom, 30)
        }
        .frame(maxWidth: 250)

    }
}
