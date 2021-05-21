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
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: Equipment.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Equipment.objectID, ascending: true)],
        predicate: nil
    ) private var equipments: FetchedResults<Equipment>
    @State private var showingModal = false

    var body: some View {
        NavigationView {
//            List {
//                ForEach(equipments) { equipment in
//                    Text(String(equipment.managementNumber))
//                }
//                .onDelete(perform: deleteCategory)
//            }
            List {
                ForEach(self.equipments, id: \.self) { equipment in
                    NavigationLink(destination: NewEquipmentView(categorySelected: equipment.category!)) {
//                        EquipmentRowView(equipment: equipment)
                        Text(equipment.equipmentType!)
                    }
                }
            }
        }
    }
    func deleteCategory(offsets: IndexSet) {
        for index in offsets {
            context.delete(equipments[index])
        }
        try? context.save()
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
struct EquipmentRowView: View {
    // 引数に@ObservedObjectを付与
    @ObservedObject var equipment: Equipment
    var body: some View {
        VStack(alignment: .leading) {
            Text(equipment.equipmentType!).font(.headline)
        }
    }
}
