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
    @State private var tipPercentage = 10
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
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
                Section {
                    Text("$\(check)")
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
