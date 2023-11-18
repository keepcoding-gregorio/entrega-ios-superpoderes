//
//  ErrorView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 15/11/2023.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var appStateViewModel: AppStateViewModel
    
    private var message: String
    
    init(error: String){
        self.message = error
    }
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 80, height: 80)
                .padding()
            
            
            Text("\(message)")
                .font(.title2)
                .foregroundStyle(.red)
                .bold()
                .padding()
            
            Spacer()
            
            //boton
            Button(action: {
                appStateViewModel.state = .none
            }, label: {
                Text("Volver")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.orange)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 20, y: 10)
                
            })
        }
    }
}

#Preview {
    ErrorView(error: "Test error message")
        .environmentObject(AppStateViewModel())
}
