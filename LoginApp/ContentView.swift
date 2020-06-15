//
//  ContentView.swift
//  LoginApp
//
//  Created by jc on 2020-06-14.
//  Copyright © 2020 jc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            WelcomeText()
            UserImage()
            UsernameTextField(username: $username)
            PasswordTextField(password: $password)
            GreenButton(title: "LOGIN") {
                print("Login clicked")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GreenButton: View {
    
    var title: String
    var action: () -> Void
    
    
    var body: some View {
        
        Text(title)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15)
            .onTapGesture(perform: action)
    }
}


struct PasswordTextField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(10)
    }
}

struct UsernameTextField: View {
    
    @Binding var username: String
    
    var body: some View {
        SecureField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(10)
    }
}


struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}
