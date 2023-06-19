//
//  NewEnvironmentObject.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 18.06.2023.
//

import SwiftUI
import Observation

@Observable final class NewObservationViewModel {
    var count = 0
    var toggleValue = false

    func incrementCounter() {
        count += 1
    }
}

struct NewObservationView: View {
    @State var viewModel = NewObservationViewModel()

    var body: some View {
        VStack(spacing: 32) {
            NewObservationChildView1(viewModel: viewModel)

            NewObservationChildView2()

            Toggle("Toggle", isOn: $viewModel.toggleValue)
                .padding(.horizontal, 120)
        }
        .padding(.vertical, 100)
        .environment(viewModel)
        .navigationTitle("Environment Object")
    }
}

struct NewObservationChildView1: View {
    var viewModel: NewObservationViewModel

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

struct NewObservationChildView2: View {
    @Environment(NewObservationViewModel.self) private var viewModel

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

struct NewEnvironmentObjectViewt_Previews: PreviewProvider {
    static var previews: some View {
        NewObservationView()
    }
}
