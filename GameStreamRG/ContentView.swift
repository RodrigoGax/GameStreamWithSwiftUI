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
        NavigationStack {
            ZStack {
                
                Spacer()
                Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
                VStack{
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250, alignment: .center).padding(.bottom, 42)
                    LoginAndRegisterView()
                    
                }
            }.navigationBarHidden(true)
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
    @State var isHomeScreenActive = false
    var body: some View{
        ScrollView {
            VStack (alignment: .leading) {
                Text("Correo electrónico").foregroundColor(Color("dark-cian"))
                ZStack (alignment: .leading){
                    if email.isEmpty{
                        Text(verbatim: "example@example.com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("",text: $email).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                
                ZStack (alignment: .leading){
                    if password.isEmpty{
                        Text(verbatim: "Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("",text: $password).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("dark-cian"))
                
                Button(action: login, label: {
                    Text("INICIAR SESIÓN"
                    ).fontWeight(.bold).foregroundColor(.white).frame(maxWidth:  .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white,radius: 6))
                }).navigationDestination(isPresented: $isHomeScreenActive, destination: {Home()})
                    
                
                
                
                Text("Inicia sesión con redes sociales").frame(maxWidth: .infinity).foregroundColor(.white)
                
                HStack{
                    
                    Button(action: {print("Inicio de sesión con Facebook")}) {
                        Text("Facebook").font(.subheadline).fontWeight(.bold).foregroundColor(.white).padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))}.padding()
                        
                        Button(action: {print("Inicio de sesión con Twitter")}) {
                            Text("Twitter").font(.subheadline).fontWeight(.bold).foregroundColor(.white).padding(.vertical, 3.0)
                                .frame(maxWidth: .infinity)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        
                            }.padding()
                }
            }
        }.padding(.horizontal, 77.0)
        
        /*NavigationLink(
        destination: Home(),
        isActive: $isHomeScreenActive,
        label: {
            EmptyView()
        })*/
    }
    func login() {
        print("Estoy iniciando sesión")
        isHomeScreenActive = true
    }
    
}

struct RegisterView:View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    var body: some View{
        ScrollView {
            
            VStack(alignment: .center){
                Text("Elije una foto de perfil").fontWeight(.bold).foregroundColor(.white)
                Text("Puedes cambiar o elegirla más adelante").font(.footnote).fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: takePhoto) {
                    ZStack {
                        Image("picture").resizable().aspectRatio(contentMode: .fit).frame(width: 80,height: 80)
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                }.padding(.bottom)
            }
            VStack () {
                VStack(alignment: .leading){
                    Text("Correo electrónico*").foregroundColor(Color("dark-cian")).frame(width: 300,alignment: .leading)
             ZStack (alignment: .leading){
             if email.isEmpty{
             Text(verbatim: "example@example.com").font(.caption).foregroundColor(.gray)
             }
             TextField("",text: $email).foregroundColor(.white)
             }
             Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
             
             Text("Contraseña*").foregroundColor(.white)
             
             ZStack (alignment: .leading){
             if password.isEmpty{
             Text(verbatim: "Escribe tu contraseña").font(.caption).foregroundColor(.gray)
             }
             SecureField("",text: $password).foregroundColor(.white)
             }
             Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
             
        
             
                Text("Confirmar contraseña*").foregroundColor(.white)
                
                ZStack (alignment: .leading){
                if password.isEmpty{
                Text(verbatim: "Confirma tu contraseña").font(.caption).foregroundColor(.gray)
                }
                SecureField("",text: $confirmPassword).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                }
             Button(action: register, label: {
             Text("REGÍSTRATE"
             ).fontWeight(.bold).foregroundColor(.white).frame(maxWidth:  .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white,radius: 6))
             }).padding(.bottom)
                
                Text("Regístrate con redes sociales").frame(maxWidth: .infinity).foregroundColor(.white)
                
                HStack{
                    
                    Button(action: {print("Regístrate con Facebook")}) {
                        Text("Facebook").font(.subheadline).fontWeight(.bold).foregroundColor(.white).padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))}.padding()
                        
                        Button(action: {print("Regístrate con Twitter")}) {
                            Text("Twitter").font(.subheadline).fontWeight(.bold).foregroundColor(.white).padding(.vertical, 3.0)
                                .frame(maxWidth: .infinity)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        
                            }.padding()
                }
             }
        }.padding(.horizontal, 77.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



func register() {
    print("Estoy registrándome")
}

func takePhoto() {
    print("Testing takePhoto()")
}
