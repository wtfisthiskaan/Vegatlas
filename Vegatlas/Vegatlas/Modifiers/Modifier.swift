//
//  Modifier.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 25.11.2022.
//

import Foundation
import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.green)
            .border(.purple)
            .padding()
    }
}
