//
//  NewSampleBinding.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 18.06.2023.
//

import SwiftUI

struct NewSampleBinding: View {

    @State private var isScaled = false

    var body: some View {
        VStack {
            Text(isScaled ? "Circle Big" : "Circle Small")
                .font(.title3)

            CircleView(isScaled: $isScaled)
                .frame(height: 200)

            RedCircleView(isScaled: isScaled)
                .frame(height: 200)
        }
        .navigationTitle("Binding")
    }

}

struct NewSampleBinding_Previews: PreviewProvider {
    static var previews: some View {
        SampleBinding()
    }
}

