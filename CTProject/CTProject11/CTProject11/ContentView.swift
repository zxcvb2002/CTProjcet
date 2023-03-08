//
//  ContentView.swift
//  CTProject11
//
//  Created by 드즈 on 2023/01/07.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var cities = ["Paris", "Milano", "Tirana", "New York", "Barcelona", "Torino"]
    
    var body: some View {
        List{
            ForEach(cities, id :\.self) { cityName in
                Text(cityName)
            }.onDelete(perform: { indexSet in
                deleteCities(at: indexSet)
            })
        }
    }
    
    //delete city
    func deleteCities(at offsets: IndexSet) {
            cities.remove(atOffsets: offsets)
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
