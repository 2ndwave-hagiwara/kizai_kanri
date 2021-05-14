//
//  ShowEquipmentView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/12.
//  Copyright © 2021 hagiwara. All rights reserved.
//

//import Foundation
import SwiftUI
struct ShowEquipmentView: View {
    @State private var showingModal = false
    let equipments = ["機材1", "機材2", "機材3", "機材4", "機材5", "機材6", "機材7", "機材8", "機材9", "機材10", "機材11", "機材12", "機材13"]
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< equipments.count) { index in
                    Text(equipments[index])
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.showingModal.toggle()
            }, label: {
                Text("+")
            }).sheet(isPresented: $showingModal) {
                EquipmentModalView()
            })
        }
    }
}

struct EquipmentModalView: View {
    var body: some View {
        Text("Modal View")
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        EquipmentModalView()
//    }
//}
