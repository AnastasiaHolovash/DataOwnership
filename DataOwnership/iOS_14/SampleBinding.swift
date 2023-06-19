//
//  SampleBinding.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 17.06.2023.
//

import SwiftUI

struct SampleBinding: View {

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

struct CircleView: View {

    @Binding var isScaled: Bool

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
    }

}

struct RedCircleView: View {

    @State var isScaled: Bool

    var body: some View {
        Circle()
            .fill(Color.red)
            .frame(
                width: isScaled ? 200 : 100,
                height: isScaled ? 200 : 100
            )
            .onTapGesture {
                isScaled.toggle()
            }
            .animation(.default, value: isScaled)
    }

}

struct Sample2_Previews: PreviewProvider {
    static var previews: some View {
        SampleBinding()
    }
}
