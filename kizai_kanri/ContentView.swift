//
//  ContentView.swift
//  kizai_kanri
//
//  Created by hagiwara on 2021/05/10.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // offset変数でメニューを表示・非表示するためのオフセットを保持します
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    
    var body: some View {
        // 画面サイズの取得にGeometoryReaderを利用します
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // メインコンテンツ
                VStack () {
                    HStack () {
                        Spacer()
                        Text("機材管理システム")
                        Spacer()
                        Button(action: {
                            self.offset = self.openOffset
                        }){
                            Image(systemName: "list.bullet")
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                    Spacer()
                    Text("This is main contents")
                        .font(.largeTitle)
                    Spacer()
                }
                .background(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                // スライドメニューがでてきたらメインコンテンツをグレイアウトします
                Color.gray.opacity(
                    Double((self.closeOffset - self.offset)/self.closeOffset) - 0.4
                )
                // スライドメニュー
                MenuView()
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.7)
                    // 最初に画面のオフセットの値をスライドメニュー分マイナスします。
                    .onAppear(perform: {
                        self.offset = geometry.size.width
                        self.closeOffset = self.offset
                        self.openOffset = geometry.size.width - geometry.size.width * 0.7
                    })
                    .offset(x: self.offset)
                    // スライドのアニメーションを設定します
                    .animation(.default)
            }
            // ジェスチャーに関する実装をします
            // スワイプのしきい値を設定してユーザの思わぬメニューの出現を防ぎます
                .gesture(DragGesture(minimumDistance: 5)
                    .onChanged{ value in
                        // オフセットの値(メニューの位置)をスワイプした距離に応じて狭めていきます
                        if (self.offset > self.openOffset) {
                            self.offset = self.closeOffset + value.translation.width
                        }
                    }
                    .onEnded { value in
                        // value.translation.widthを使っても書けます
                        // 移動した距離がマイナス方向だったらメニューを開く
                        if (value.translation.width < 0) {
                            self.offset = self.openOffset
                        } else {
                            self.offset = self.closeOffset
                        }
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
