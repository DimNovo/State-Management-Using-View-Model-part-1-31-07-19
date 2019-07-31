//
//  AuthenticationService.swift
//  State Management Using View Model
//
//  Created by Dmitry Novosyolov on 31/07/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class AuthenticationService {
    
    func authenticate(user: User, completion: @escaping (Bool) -> Void) {
        if !user.username.isEmpty && !user.password.isEmpty {
            completion(true)
        } else {
            completion(false)
        }
    }
}
