//
//  LoginView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 13/11/2023.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: Global environment variables
    @EnvironmentObject var loginViewModel: LoginViewModel
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var homeViewModel = HomeViewModel()

#if DEBUG
    //  This is only exposed for teacher evaluation.. In production it should be removed
    @State private var publicKey = "2083b5dfcfdcacedb03cd8d21d3d578e"
    @State private var privateKey = "492626b5ce85739efe0a41451c9062a8d16a11ea"
#else
    // MARK: State variables
    @State private var publicKey = ""
    @State private var privateKey = ""
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
                    Text("Public Key")
                    SecureField("publicKey", text: $publicKey)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 20, y: 20)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .opacity(0.8)
                        .id(1) // Id for testing
                    Text("Private Key")
                    SecureField("$privateKey", text: $privateKey)
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
                        loginViewModel.login(publicKey: publicKey, privateKey: privateKey)
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
                    .onReceive(loginViewModel.$characters, perform: {
                        homeViewModel.characters = $0
                    })
                    
                    Spacer()
                    Spacer()
                }
                
                // Sign Up
                HStack {
                    Button(action: {
                        loginViewModel.state = .register
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
