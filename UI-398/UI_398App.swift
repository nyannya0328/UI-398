//
//  UI_398App.swift
//  UI-398
//
//  Created by nyannyan0328 on 2021/12/20.
//

import SwiftUI

@main
struct UI_398App: App {
    @StateObject var model = CoffeeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onOpenURL { url in
                    if model.checkDeepLink(url: url){
                        
                        
                        
                        print("From Deep")
                    }
                    else{
                        
                        print("Back")
                    }
                }
        }
    }
}
