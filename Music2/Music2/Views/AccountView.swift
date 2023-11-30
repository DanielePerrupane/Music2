//
//  AccountView.swift
//  Music2
//
//  Created by Daniele Perrupane on 29/11/23.
//

import SwiftUI
import UIKit

struct AccountView: View {
    
    var account : Account
    
    var body: some View {
        
        VStack(alignment: .center){
            Circle()
                .frame(width: 250,height: 200)
                .foregroundColor(.red)
                .overlay(
                    Image(account.image)
                        .resizable()
                        .foregroundColor(Color(hue: 1.0, saturation: 0.842, brightness: 0.747))
                        .padding(.top,15)
                    
                    
                )
                .background(Color.clear)
            Grid(alignment: .leading) {
                GridRow{
                    Text(account.name)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                }
                GridRow{
                    Text(account.surname)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                }
                GridRow{
                    Text(account.age)
                        .font(.title2)
                        .foregroundStyle(.gray)
                        .fontWeight(.semibold)
                }
                
            }
            
            //            Text("Punto di Riferimento")
        }
        .position(x: 200,y: 200)
        
        
        
    }
}

#Preview {
    AccountView(account: Account(name: "Daniele", surname: "Perrupane", age: "28", gender: "Maschio", image: "account"))
}
