//
//  LoginView.swift
//  VK_SwiftUI
//
//  Created by Artem Firsov on 1/10/22.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var showLogo: Bool = true
    @State private var logInState : Bool = false
    
    @Binding var isAuthorized: Bool
    
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
                    
                    LoginPasswordView(login: $login, password: $password)
                    
                    Button(action: {
                        let areCredentialRight = userDataCheck(login: login, password: password)
                        logInState = !areCredentialRight
                        isAuthorized = !logInState
                    }) {
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
        }.alert(isPresented: $logInState, content: {
            Alert(title: Text("Неверные данные"), message: Text("Попробуйте ещё раз"), dismissButton: .cancel(Text("ОК")))
        })
    }
    
    private func userDataCheck(login: String, password: String) -> Bool {
        return login == "Adm"; password == "123"
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//
//    }
//}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
