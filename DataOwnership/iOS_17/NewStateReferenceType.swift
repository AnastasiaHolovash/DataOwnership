//
//  NewStateReferenceType.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 18.06.2023.
//

import SwiftUI

final class NewStateReferenceTypeData {
    var isScaled = false {
        didSet {
            print("isScaled: \(isScaled)")
        }
    }
}

struct NewStateReferenceTypeView: View {

    @State var model = StateReferenceTypeData()

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(
                width: model.isScaled ? 200 : 100,
                height: model.isScaled ? 200 : 100
            )
            .onTapGesture {
                model.isScaled.toggle()
            }
            .animation(.default, value: model.isScaled)
            .navigationTitle("State Reference Type")
    }

}

struct NewStateReferenceType_Previews: PreviewProvider {
    static var previews: some View {
        NewStateReferenceTypeView()
    }
}
