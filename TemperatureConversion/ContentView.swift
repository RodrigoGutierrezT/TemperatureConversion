//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Rodrigo on 31-05-24.
//

import SwiftUI

struct ContentView: View {
    
    enum TemperatureType: String, CaseIterable {
        case celsius, kelvin, farenheit
    }
    
    @State private var inputType: TemperatureType = .celsius
    @State private var outputType: TemperatureType = .farenheit
    @FocusState private var inputNumberIsFocused: Bool
    
    @State private var inputNumber: Double = 0
    private var outputNumber: Double {
        if inputType == .celsius && outputType == .farenheit{
            return (inputNumber * 9/5) + 32
        } else if inputType == .celsius && outputType == .kelvin {
            return inputNumber + 273.15
        } else if inputType == .farenheit && outputType == .celsius {
            return (inputNumber - 32) * 5/9
        } else if inputType == .farenheit && outputType == .kelvin {
            let celsius = (inputNumber - 32) * 5/9
            return celsius + 273.15
        } else if inputType == .kelvin && outputType == .celsius {
            return inputNumber - 273.15
        } else if inputType == .kelvin && outputType == .farenheit {
            let celsius = inputNumber - 273.15
            return (celsius * 9/5) + 32
        } else {
            return inputNumber
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Temperature") {
                    Picker("Choose input type", selection: $inputType) {
                        ForEach(TemperatureType.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Enter Amount", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputNumberIsFocused)
                }
                
                Section("Output Temperature") {
                    Picker("Choose output type", selection: $outputType) {
                        ForEach(TemperatureType.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(outputNumber, format: .number)
                }
                
                
            }
            .navigationTitle("Temperature App")
            .toolbar {
                if inputNumberIsFocused {
                    Button("Done") {
                        inputNumberIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
