//
//  CoffeeViewModel.swift
//  UI-398
//
//  Created by nyannyan0328 on 2021/12/20.
//

import SwiftUI

class CoffeeViewModel: ObservableObject {
    
    @Published var currentTab : Tab = .Home
    
    @Published var currentDeatailPage : String?
    
    
    func checkDeepLink(url : URL) -> Bool{
        
        guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else{
            
            return false
        }
        
        
        if host == Tab.Home.rawValue{
            
            
            currentTab = .Home
        }
        
        else if host == Tab.Search.rawValue{
            
            
            currentTab = .Search
        }
        
        
        else if host == Tab.Settings.rawValue{
            
            
            currentTab = .Settings
        }
        
        else{
            
           return checkInternal(host: host)
        }
        
        return true
        
        
        
        
    
        
        
    }
    
    func checkInternal(host : String) -> Bool{
        
        if let index = coffees.firstIndex(where: { coffee in
            coffee.id == host
            
        }){
            
            currentTab = .Search
            
            currentDeatailPage = coffees[index].id
            
            
            return true
            
        }
        
        return false
        
        
    }
    
    
    
    
    
    
    
  
}

enum Tab : String{
    
    case Home = "home"
    case Search = "search"
    case Settings = "settings"
}

