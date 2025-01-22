//
//  ContentView.swift
//  NewStateManagementUI
//
//  Created by neodiyadin on 30.11.2024.
//

import SwiftUI
import SwiftData


@Observable
class DarkTheme {
    var isEnabled : Bool = false
}


struct DarkChoiceView : View {
    @Bindable var darkTheme : DarkTheme
    
    var body: some View {
        Toggle(isOn: $darkTheme.isEnabled) {
            EmptyView()
        }.fixedSize()
    }
}

struct DarkChoiceToggleView : View {
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        DarkChoiceView(darkTheme: darkTheme)
    }
}



struct InformationText : View {
    
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        Text(darkTheme.isEnabled ? "Dark mode is enabled" : "Dark mode is disabled")
            .font(.title)
            .foregroundStyle(darkTheme.isEnabled ? Color.white : Color.black)
    }
}


struct ContentView: View {
    
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        
        VStack {
            DarkChoiceToggleView()
            InformationText()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(darkTheme.isEnabled ? Color.black : Color.white)
    }
}





#Preview {
    ContentView()
        .environment(DarkTheme())
}
