//
//  StateValueType.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 17.06.2023.
//

import SwiftUI

struct StateValueType: View {

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

struct SampleValueType_Previews: PreviewProvider {
    static var previews: some View {
        StateValueType()
    }
}
