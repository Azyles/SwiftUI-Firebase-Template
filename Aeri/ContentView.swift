//
//  ContentView.swift
//  Aeri
//
//  Created by Kushagra Singh on 4/26/20.
//  Copyright © 2020 Azyles. All rights reserved.
//

// @EnvironmentObject var userInfo: UserInfo
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                Text("Welcome Back User")
                Button(action: session.signOut) {
                    Text("Sign Out")
                }
            } else {
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}

/*
 Group{
     if userInfo.isUserAuthenticated == .undefined{
         Text("Loading...") 
     } else if userInfo.isUserAuthenticated == .signedOut{
         LoginView()
     } else {
         HomeView()
     }
 }.onAppear{self.userInfo.configureFirebaseStateDidChange()}
 */
