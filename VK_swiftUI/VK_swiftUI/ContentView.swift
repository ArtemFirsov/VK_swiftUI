//
//  ContentView.swift
//  VK_SwiftUI
//
//  Created by Artem Firsov on 1/10/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var showLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification).map { _ in true }, NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map { _ in false })
        .removeDuplicates()
    
// MARK - Верстка экрана авторизации
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
               Image("VkBackground")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
            }
            ScrollView {
                VStack {
                    if showLogo {
                    Text("ВКонтакте")
                        .padding(.top, 32.0)
                        .font(.largeTitle).accentColor(.blue)
                    }
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
                    }.frame(maxWidth: 250)
                    
                    Button(action: { print("Hello")}) {
                        Text("Войти")
                            .accentColor(.white)
                            .font(.title2)
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 40.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .disabled(login.isEmpty || password.isEmpty)
                }
            }.onReceive(keyboardIsOnPublisher, perform: { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 1)) {
                    self.showLogo = !isKeyboardOn
                }
            })
            Spacer()
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
