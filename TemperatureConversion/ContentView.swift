//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Rodrigo on 31-05-24.
//

import SwiftUI

struct ContentView: View {
    
    enum TemperatureType {
        case ceslsius, kelvin, farenheit
    }
    
    @State private var inputType: TemperatureType = .ceslsius
    @State private var outputType: TemperatureType = .farenheit
    
    var body: some View {
        NavigationStack {
            Form {
                
            }
            .navigationTitle("Temperature App")
        }
    }
}

#Preview {
    ContentView()
}
