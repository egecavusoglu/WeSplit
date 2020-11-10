//
//  ContentView.swift
//  WeSplit
//
//  Created by Ege Çavuşoğlu on 11/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var check = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        
        let total = Double(check) ?? 0
        let tip = Double(tipPercentages[tipPercentage]) / 100.0
        let result = total * (1 + tip) / Double(numberOfPeople + 2)
        
        return result
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Check Amount")
                        TextField("$0.00", text: $check)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                    }
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach (2 ..< 100)  {
                                Text("\($0) people")
                            }
                        }
                }
                
                Section(header: Text("Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach (0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")").multilineTextAlignment(.trailing)
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
