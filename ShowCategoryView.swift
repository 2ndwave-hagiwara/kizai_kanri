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
    var body: some View {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<51) { i in
                                Image(systemName: "\(i).square")
                                    .font(.system(size: 100))
                                    .frame(width: 130, height: 130)
                            }
                        }
                    }
     
                    ForEach(0..<17) { i in
                        HStack(spacing: 0) {
                            ForEach(0..<3) { ii in
                                Image(systemName: "\(i * 3 + ii).circle")
                                    .font(.system(size: 100))
                                    .frame(width: 130, height: 130)
                                    .border(Color.gray, width: 1)
                            }
                        }
                    }
                }
            }
        }
}
