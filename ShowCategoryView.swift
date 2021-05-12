//
//  ShowCategoryView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/12.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import Foundation
import SwiftUI

struct ShowCategoryView: View {
    let fruits = ["PC", "キーボード", "マウス", "モニター", "ACアダブタ", "電源コード", "ディスプレイケーブル", "外付けHDD・SSD", "USBメモリ", "ライトニングケーブル", "ダブレット", "スマホ", "その他機器"]
        var body: some View {
            List {
                ForEach(0 ..< fruits.count) { index in
                    Text(fruits[index])
                }
            }
        }
}
