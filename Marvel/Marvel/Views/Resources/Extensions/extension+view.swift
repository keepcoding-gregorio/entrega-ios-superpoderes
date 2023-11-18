//
//  extension+view.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        condition ? transform(self) as! Self : self
    }
}
