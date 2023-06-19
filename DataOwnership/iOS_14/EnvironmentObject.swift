//
//  EnvironmentObject.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 17.06.2023.
//

import SwiftUI

final class EnvironmentObjectViewModel: ObservableObject {
    @Published var count = 0
    @Published var toggleValue = false

    func incrementCounter() {
        count += 1
    }
}

struct EnvironmentObjectView: View {
    @StateObject var viewModel = EnvironmentObjectViewModel()

    var body: some View {
        VStack(spacing: 32) {
            EnvironmentObjectChildView1(viewModel: viewModel)

            EnvironmentObjectChildView2()

            Toggle("Toggle", isOn: $viewModel.toggleValue)
                .padding(.horizontal, 120)
        }
        .padding(.vertical, 100)
        .environmentObject(viewModel)
        .navigationTitle("Environment Object")
    }
}

struct EnvironmentObjectChildView1: View {
    @ObservedObject var viewModel: EnvironmentObjectViewModel

    var body: some View {
        let _ = Self._printChanges()

        VStack {
            Text("Child View 1").font(.title3)
            Text("\(viewModel.count)").font(.title)
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

struct EnvironmentObjectChildView2: View {
    @EnvironmentObject var viewModel: EnvironmentObjectViewModel

    var body: some View {
        let _ = Self._printChanges()

        VStack {
            Text("Child View 2").font(.title3)
            Text("\(viewModel.count)").font(.title)
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

struct EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
