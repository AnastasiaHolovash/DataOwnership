//
//  StateReferenceType.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 17.06.2023.
//

import SwiftUI

final class StateReferenceTypeData {
    var isScaled = false {
        didSet {
            print("isScaled: \(isScaled)")
        }
    }
}

struct StateReferenceType: View {

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

struct StateReferenceType_Previews: PreviewProvider {
    static var previews: some View {
        StateReferenceType()
    }
}
