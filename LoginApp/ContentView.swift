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
    
    @State var authenticationDidFail = false
    @State var authenticationDidSucceed = false
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        ZStack {
            VStack {
                WelcomeText()
                UserImage()
                UsernameTextField(username: $username)
                PasswordTextField(password: $password)
                if authenticationDidFail {
                    Text("Information not correct. Try again")
                        .foregroundColor(.red)
                }
                GreenButton(title: "LOGIN", action: loginTapped).padding(.top, 20)
                Spacer()
            }.padding()
            if authenticationDidSucceed {
                Text("Login successful!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(Animation.easeIn(duration: 1.2))
            }
        }.offset(y: -keyboardResponder.currentHeight * 0.4)
    }
    
    fileprivate func loginTapped() {
        if(username.isEmpty || password.isEmpty) {
            authenticationDidFail = true
            authenticationDidSucceed = false
        } else {
            authenticationDidFail = false
            authenticationDidSucceed = true
        }
        
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
        TextField("Username", text: $username)
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
            .padding()
    }
}
