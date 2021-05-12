//
//  SideMenuView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/12.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import Foundation
import SwiftUI

struct SideMenuView: View {
    @Binding var isOpen: Bool
    @Binding var text: String
    @Binding var menu: String
    let width: CGFloat = 270

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .opacity(1.0)
            .animation(.easeIn(duration: 0.25))
            .onTapGesture {
                self.isOpen = false
            }

            HStack {
                VStack() {
                    SideMenuContentView(menu: "equipment", text: "機材一覧", bindText: $text, isOpen: $isOpen, bindMenu: $menu)
                    SideMenuContentView(menu: "category",text: "新規登録", bindText: $text, isOpen: $isOpen, bindMenu: $menu)
                    SideMenuContentView(menu: "maker",text: "メーカー一覧", bindText: $text, isOpen: $isOpen, bindMenu: $menu)
                    SideMenuContentView(menu: "user",text: "使用者一覧", bindText: $text, isOpen: $isOpen, bindMenu: $menu)
                    Spacer()
                }
                .frame(width: width)
                .background(Color(UIColor.systemGray6))
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.easeIn(duration: 0.25))
                Spacer()
            }
        }
    }
}
