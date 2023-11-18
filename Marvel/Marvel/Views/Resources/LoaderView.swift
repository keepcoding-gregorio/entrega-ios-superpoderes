//
//  LoaderView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 15/11/2023.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        Image(systemName: "clock")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        Text("Loading data...")
            .font(.title)
            .padding(.top, 50)
    }
}

#Preview {
    LoaderView()
}
