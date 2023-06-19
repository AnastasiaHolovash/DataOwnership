//
//  NewStateValueType.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 18.06.2023.
//

import SwiftUI

struct NewStateValueTypeView: View {

    @State private var isScaled = false

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(
                width: isScaled ? 200 : 100,
                height: isScaled ? 200 : 100
            )
            .onTapGesture {
                isScaled.toggle()
            }
            .animation(.default, value: isScaled)
            .navigationTitle("State Value Type")
    }

}

struct NewStateValueType_Previews: PreviewProvider {
    static var previews: some View {
        NewStateValueTypeView()
    }
}
