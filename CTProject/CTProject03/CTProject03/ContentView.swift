//
//  ContentView.swift
//  CTProject03
//
//  Created by 드즈 on 2022/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert: Bool = false
    @State var text: String = ""
    var body: some View {
        Button("Show Alert"){
            showAlert.toggle()
        }
        .alert("TextField Alert", isPresented: $showAlert) {
            // MARK : TextField In Alert
            TextField("", text: $text)
            
            Button("Cancel", role: .destructive) {
            
            }
            Button("Save", role: .cancel) {
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
