//
//  LoginView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 13/11/2023.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: Global environment variables
    @EnvironmentObject var appState: AppStateViewModel
    @Environment(\.colorScheme) var colorScheme

#if DEBUG
    @State private var email = "gonzagregorio03@gmail.com"
    @State private var password = "KeepGrego2023!"
#else
    // MARK: State variables
    @State private var email = ""
    @State private var password = ""
#endif
    
    // MARK: Body
    var body: some View {
        ZStack {
            // Background
            Image(.backgroundLogin)
                .resizable()
                .opacity(1)
            Image("")
                .resizable()
                .background(.black)
                .opacity(colorScheme == .light ? 0.5 : 0.1)
            
            VStack {
                // Logo
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.9)
                    .padding(.top, 160)
                
                // Fields
                VStack {
                    Spacer()
                    Spacer()
                    
                    TextField("email", text: $email)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 20, y: 20)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .opacity(0.8)
                        .id(1) // Id for testing
                    SecureField("password", text: $password)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 20, y: 20)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .opacity(0.8)
                        .padding(.top, 20)
                        .id(2) // Id for testing
                    
                    Spacer()
                    Spacer()

                    // Button
                    Button(action: {
                        appState.login(user: email, password: password)
                    }, label: {
                        
                        Text("Log In")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(.red)
                            .cornerRadius(8)
                            .shadow(radius: 20, x: 10, y: 10)
                    })
                    .opacity(0.8)
                    .id(3)
                    
                    Spacer()
                    Spacer()
                }
                
                // Sign Up
                HStack {
                    Button(action: {
                        appState.state = .register
                    }, label: {
                        Text("Sign Up")
                            .foregroundStyle(.white)
                    })
                }
                .padding(.bottom, 50)
                .id(3)
            }
            .padding([.leading, .trailing], 40)
            
            
        }
        .ignoresSafeArea()
    }
}

// MARK: Preview
#Preview {
    LoginView()
        .environment(\.locale, .init(identifier: "en"))
        .preferredColorScheme(.light)
}
