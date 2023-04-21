//
//  Home.swift
//  GameStreamRG
//
//  Created by Rodrigo Fidel Gaxiola Sosa on 22/03/23.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab:Int = 2
    
    var body: some View {
        TabView (selection: $selectedTab) {
            Text("ProfileScreen").font(.system(size: 30,weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            Text("GamesScreen").font(.system(size: 30,weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            HomeScreen()
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            Text("FavoritesScreen").font(.system(size: 30,weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }.accentColor(.white)
    }
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBar-Color"))
        UITabBar.appearance().isTranslucent = true
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
}

struct HomeScreen:View {
    
    @State var searchText = ""
    var body: some View{
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11.0)
                HStack{
                    Button(action: search, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(searchText
                            .isEmpty ? Color(.yellow) : Color("dark-cian"))
                    })
                    TextField(text: $searchText,
                              label: {
                        Text("Buscar un video").foregroundColor(.gray)
                    }).foregroundColor(.white)
                    
                }.padding([.top,.leading,.bottom],11.0).background(Color("blue-gray")).clipShape(Capsule())
                Spacer()
            }.padding(.horizontal,18)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
    
    
    func search () {
        print("El usuario está buscando \(searchText)")
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
