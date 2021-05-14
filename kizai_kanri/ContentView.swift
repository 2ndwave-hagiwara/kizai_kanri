//
//  ContentView.swift
//  kizai_kanri
//
//  Created by hagiwara on 2021/05/10.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isOpenSideMenu: Bool = false
    @State var text = "機材一覧"
    @State var menu = ""
    var body: some View {
        ZStack{
            NavigationView {
                Group {
                    if self.menu == "category" {
                        ShowCategoryView()
                    } else if self.menu == "maker" {
                        ShowMakerView()
                    } else if self.menu == "user" {
                        ShowUserView()
                    } else {
                        ShowEquipmentView()
                    }
                }
                    .navigationBarTitle(Text(text), displayMode: .inline)
                    .navigationBarItems(trailing: (
                        Button(action: {
                            self.isOpenSideMenu.toggle()
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                    }))
            }

            SideMenuView(isOpen: $isOpenSideMenu, text: $text, menu: $menu)
                .edgesIgnoringSafeArea(.all)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
