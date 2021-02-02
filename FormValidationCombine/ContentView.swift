//
//  ContentView.swift
//  FormValidationCombine
//
//  Created by Sergey Antoniuk on 2/2/21.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var mail = ""
//    @State private var phone = ""
//    @State private var contact = ""
    
    @ObservedObject private var registerUser = RegisterUser()
    
    var body: some View {
        VStack (spacing: 20){
        Text("Combine + SwiftUI")
            .font(.largeTitle)
            .padding()
            
            
            Field(value: $registerUser.mail, placeholder: "Mail", icon: "envelope.fill")
            
            Validator(
                icon: registerUser.isMailValid ? "checkmark.rectangle.fill" : "xmark.square",
                color: registerUser.isMailValid ? Color.green : Color.red,
                message: registerUser.isMailValid ? "Accepted" : "Rejected")
            
            Field(value: $registerUser.phone, placeholder: "Phone", icon: "phone.circle.fill")
            
            Validator(
                icon: registerUser.isPhoneValid ? "checkmark.rectangle.fill" : "xmark.square",
                color: registerUser.isPhoneValid  ? Color.green : Color.red,
                message: registerUser.isPhoneValid ? "Accepted" : "Rejected")
            
            Field(value: $registerUser.contact, placeholder: "Contact", icon: "person.crop.circle.fill")
            
            Validator(
                icon: registerUser.isContactValid ? "checkmark.rectangle.fill" : "xmark.square",
                color: registerUser.isContactValid ? Color.green : Color.red,
                message: registerUser.isContactValid ? "Accepted" : "Rejected")
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                Text("Sign Up").padding().font(.headline)
                    .background(RoundedRectangle(cornerRadius: 12).stroke(Color.purple, lineWidth: 3))
            }.disabled(!(registerUser.isMailValid && registerUser.isPhoneValid && registerUser.isContactValid ))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Field: View {
    
    @Binding var value: String
    var placeholder: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .padding(5)
            TextField(placeholder, text: $value).font(Font.system(size: 20, design: .monospaced))
                .foregroundColor(.pink)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.purple, lineWidth: 4)).padding()
    }
}

struct Validator: View {
    var icon: String
    var color: Color
    var message: String
    
    var body: some View {
        HStack{
            Image(systemName: icon).foregroundColor(color)
                .font(.title)
            Text(message).font(.title).foregroundColor(.red)
        }
    }
}
