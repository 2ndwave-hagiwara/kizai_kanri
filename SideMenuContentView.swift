//
//  SideMenuContentView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/12.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import Foundation
import SwiftUI

struct SideMenuContentView: View {
    let topPadding: CGFloat
//    let systemName: String
    let menu: String
    let text: String
    @Binding var bindText: String
    @Binding var isOpen: Bool
    @Binding var bindMenu: String

//    init(topPadding: CGFloat = 30, systemName: String, text: String, bindText: Binding<String>, isOpen: Binding<Bool>) {
    init(topPadding: CGFloat = 30, menu: String, text: String, bindText: Binding<String>, isOpen: Binding<Bool>, bindMenu: Binding<String>) {
        self.topPadding = topPadding
//        self.systemName = systemName
        self._bindText = bindText
        self._isOpen = isOpen
        self._bindMenu = bindMenu
        self.text = text
        self.menu = menu
    }

    var body: some View {
        
        HStack {
//            Image(systemName: systemName)
//                .foregroundColor(.gray)
//                .imageScale(.large)
//                .frame(width: 32.0)
            Text(text)
                .foregroundColor(.gray)
                .font(.headline)
            Spacer()
        }
        .padding(.top, topPadding)
        .padding(.leading, 32)
        .onTapGesture {
            self.bindText = self.text
            self.bindMenu = self.menu
            self.isOpen = false
        }
        
    }
}
