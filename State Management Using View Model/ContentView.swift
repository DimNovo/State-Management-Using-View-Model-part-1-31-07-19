//
//  ContentView.swift
//  State Management Using View Model
//
//  Created by Dmitry Novosyolov on 31/07/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    //    @State private var userName: String = ""
    //    @State private var password: String = ""
    
    @ObservedObject private var loginViewModel = LoginViewModel(authService: AuthenticationService())
    
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    TextField("Enter username", text: self.$loginViewModel.username)
                        .padding()
                        .border(Color.gray, width: 1, cornerRadius: 10)
                    SecureField("Password", text: self.$loginViewModel.password)
                        .padding()
                        .border(Color.gray, width: 1, cornerRadius: 10)
                    Button("Login") {
                        self.loginViewModel.login()
                    }
                    .font(.title)
                        
                    .sheet(isPresented: self.$loginViewModel.isLoggedIn) { Text("Hi & Welcome!\ndear\n\(self.loginViewModel.username)")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    }
                    
                    Text(self.loginViewModel.isLoggedIn ? "LOGGED IN" : "NOT LOGGED IN")
                        .foregroundColor(self.loginViewModel.isLoggedIn ? .green : .red)
                        .bold()
                }
            }.padding()
                .navigationBarTitle("Login Screen")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
