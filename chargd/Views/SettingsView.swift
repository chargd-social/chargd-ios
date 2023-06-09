//
//  Settings.swift
//  chargd
//
//  Created by Tongyu Jiang on 16/3/23.
//

import SwiftUI

struct Settings: View {
    
    @AppStorage("use_12h_clock") var use_12h_clock = false
    @AppStorage("username") var username = "Anonymous"
    
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Group {
                        Text("hello, ") + Text(username).bold() + Text("!")
                    }
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    
                    Toggle(isOn: $use_12h_clock) {
                        Text("Use 12h clock")
                    }.onSubmit {
                        UserDefaults.standard.set(use_12h_clock, forKey: "use_12h_clock")
                    }
                    
                    Button("Request notification permissions") {
                        requestNotifPerms()
                    }
                }
            }.navigationTitle("Settings")
        }
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
