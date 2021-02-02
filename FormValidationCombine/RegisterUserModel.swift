//
//  RegisterUserModel.swift
//  FormValidationCombine
//
//  Created by Sergey Antoniuk on 2/2/21.
//

import Foundation
import Combine

class RegisterUser: ObservableObject{
   
    //Input
    @Published var mail = ""
    @Published var phone = ""
    @Published var contact = ""
    
    //Output
    @Published var isMailValid = false
    @Published var isPhoneValid = false
    @Published var isContactValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init (){
        
        $mail
            .receive(on: RunLoop.main)
            .map{
                mail in
                return mail.contains("@")
            }.assign(to: \.isMailValid, on: self)
            .store(in: &cancellableSet)
        
        $phone
            .receive(on: RunLoop.main)
            .map{
                phone in
                return phone.count > 6
            }.assign(to: \.isPhoneValid, on: self)
            .store(in: &cancellableSet)
       
        $contact
            .receive(on: RunLoop.main)
            .map{
                contact in
                return contact.count >= 3
            }.assign(to: \.isContactValid, on: self)
            .store(in: &cancellableSet)
        
    }
    
}
