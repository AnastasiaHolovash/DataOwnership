//
//  ContentView.swift
//  DataOwnership
//
//  Created by Anastasia Holovash on 17.06.2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            List {
                Section("iOS 14+") {
                    NavigationLink("State Value Type") {
                        StateValueType()
                    }
                    NavigationLink("State Reference Type") {
                        StateReferenceType()
                    }
                    NavigationLink("Binding") {
                        SampleBinding()
                    }
                    NavigationLink("Observable Object") {
                        ObservableObjectView()
                    }
                    NavigationLink("Environment Object") {
                        EnvironmentObjectView()
                    }
                }
                Section("iOS 17+") {
                    NavigationLink("New State Value Type") {
                        NewStateValueTypeView()
                    }
                    NavigationLink("New State Reference Type") {
                        NewStateReferenceTypeView()
                    }
                    NavigationLink("New Binding") {
                        NewSampleBinding()
                    }
                    NavigationLink("New Observation") {
                        NewObservationView()
                    }
                }
            }
            .navigationTitle("Data ownership")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
