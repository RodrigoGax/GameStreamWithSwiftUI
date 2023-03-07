//
//  ContentView.swift
//  GameStreamRG
//
//  Created by Rodrigo Fidel Gaxiola Sosa on 06/03/23.
//

import SwiftUI


enum LoginType {
    case login
    case register
}

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Spacer()
            Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
            VStack{
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250, alignment: .center).padding(.bottom, 42)
                LoginAndRegisterView()
                
            }
        }
        
    }
}

struct LoginAndRegisterView:View
{
    
    @State var LoginType: LoginType = .login
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button ("INICIA SESIÓN"){
                    self.LoginType = .login
                    print("Pantalla inicio sesión")
                }.foregroundColor(self.LoginType == .login ? .white : .gray)
                Spacer()
                Button ("REGÍSTRATE"){
                    self.LoginType = .register
                    print("Pantalla de registro")
                }.foregroundColor(self.LoginType == .register ? .white : .gray)
                Spacer()
                
                
            }
            Spacer()
            switch LoginType {
                       case .login:
                           LoginView()
                       case .register:
                           RegisterView()
                       }
        }
        Spacer(minLength: 42)
        
       
        
    }
}

struct LoginView:View {
    
    @State var email = ""
    @State var password = ""
    var body: some View{
        ScrollView {
            VStack (alignment: .leading) {
                Text("Correo electrónico").foregroundColor(Color("dark-cian"))
                ZStack (alignment: .leading){
                    if email.isEmpty{
                        Text(verbatim: "example@example.com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("",text: $email)
                    }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)

                ZStack (alignment: .leading){
                    if password.isEmpty{
                        Text(verbatim: "Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("",text: $password)
                    }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
            }
        }.padding(.horizontal, 77.0)
    }
}

struct RegisterView:View {
    var body: some View{
        Text("RegisterView").foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
