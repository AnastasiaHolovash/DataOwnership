//
//  ObservableObjectView.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 17.06.2023.
//

import SwiftUI

struct ObservableObjectView: View {
    @State private var toggle = false

    var body: some View {
        VStack(spacing: 32) {
            ObservedObjectChildView()
            StateObjectChildView()

            Text("Toggle: \(toggle.description)" ).font(.title)
            Button("Toggle") {
                toggle.toggle()
            }
        }
        .padding(.vertical, 100)
        .navigationTitle("Observed & State Object")
    }
}

final class CounterViewModel: ObservableObject {
    @Published var count = 0

    func incrementCounter() {
        count += 1
    }
}

struct ObservedObjectChildView: View {
    @ObservedObject var viewModel = CounterViewModel()

    var body: some View {
        let _ = Self._printChanges()

        VStack {
            Text("ObservedObject").font(.title3)
            Text("\(viewModel.count)").font(.title)
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

struct StateObjectChildView: View {
    @StateObject var viewModel = CounterViewModel()

    var body: some View {
        let _ = Self._printChanges()

        VStack {
            Text("StateObject").font(.title3)
            Text("\(viewModel.count)").font(.title)
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectView()
    }
}
