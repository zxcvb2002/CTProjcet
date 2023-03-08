//
//  ContentView.swift
//  CTProject04
//
//  Created by 드즈 on 2022/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDates: Set<DateComponents> = []
    var body: some View {
        // MARK : Multiple Date Picker
        MultiDatePicker("", selection: $selectedDates)
            .frame(height: 400)
            .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
