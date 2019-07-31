//
//  LoginViewModel.swift
//  State Management Using View Model
//
//  Created by Dmitry Novosyolov on 31/07/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    
    var authenticationService: AuthenticationService
    
    @Published
    var username: String = ""
    @Published
    var password: String = ""
    
    init(authService: AuthenticationService) {
        self.authenticationService = authService
    }
    
    @Published
    var isLoggedIn: Bool = false
}

extension LoginViewModel {
    
    func login() {
        // call a web service and authenticate the user
        let user = User(username: self.username, password: self.password)
        self.authenticationService.authenticate(user: user) {
            self.isLoggedIn = $0
        }
    }
}
