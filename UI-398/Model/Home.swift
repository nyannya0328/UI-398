//
//  Home.swift
//  UI-398
//
//  Created by nyannyan0328 on 2021/12/20.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model : CoffeeViewModel
    var body: some View {
        TabView(selection:$model.currentTab){
            
            
            HomeView()
            
             
                .tag(Tab.Home)
                .tabItem {
                    
                    Image(systemName: "house.fill")
                }
            
            SearchView()
                .environmentObject(model)
                .tag(Tab.Search)
                .tabItem {
                    
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Settings")
                .tag(Tab.Settings)
                .tabItem {
                    
                    Image(systemName: "gearshape")
                }
            
            
        }
    }
    

    
    @ViewBuilder
    func HomeView()->some View{
        
        
        GeometryReader{proxy in
            
            let size = proxy.size
            
            TabView{
                
                ForEach(1...6,id:\.self){image in
                    
                    Image("p\(image)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea()
                    
                    
                }
            }
            .rotationEffect(.init(degrees: 90))
        
            .frame(width: size.height)
            .frame(width: size.width)
           
           
          
           
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
    
            
        }
        .ignoresSafeArea()
        
        
    }
    
    

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct SearchView : View{
    @EnvironmentObject var model : CoffeeViewModel

    
    var body: some View{
        
        NavigationView{
            
            
            List{
                
                
                ForEach(coffees){coffee in
                    
                    
                    
                    NavigationLink(tag:coffee.id,selection: $model.currentDeatailPage) {
                        
                        DetaileView(coffee: coffee)
                        
                    } label: {
                        
                        
                        
                        HStack{
                            
                            
                            
                            Image(coffee.productImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 65, height: 65)
                                .cornerRadius(10)
                            
                            
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                
                                
                                Text(coffee.title)
                                    .font(.caption.weight(.bold))
                                    .foregroundColor(.black)
                                
                                Text(coffee.productPrice)
                                    .font(.title.weight(.bold))
                                    .foregroundColor(.gray)
                                
                                
                                
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                        }
                        
                        
                    }

                    
                    
                    
                    
                }
                
                
                
            }
            .listStyle(.sidebar)
            .navigationTitle("Search")
            
            
            
        }
    }
    
    @ViewBuilder
    func DetaileView(coffee : Coffee)->some View{
        
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                Image(coffee.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 280)
                    .cornerRadius(2)
                
                
                
                VStack(alignment:.leading,spacing: 16){
                    
                    
                    Text(coffee.title)
                        .font(.headline.weight(.bold))
                        .foregroundColor(.black)
                    
                    
                    Text(coffee.productPrice)
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.gray)
                
                
                
                Text(coffee.description)
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.gray)
                    .kerning(1.6)
                    .multilineTextAlignment(.leading)
                    
                    
                }
                .padding()
                    
                
                
                    
                
                
            }
          
          
        }
      
        .navigationTitle(coffee.title)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}
