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
    @State var text = "Hello, World!"
    @State var menu = ""
    var body: some View {
        ZStack{
            NavigationView {
                Text(text)
                    .navigationBarTitle("メイン画面")
                    .navigationBarItems(leading: (
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
        Group {
            if self.menu == "category" {
                ShowCategoryView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
