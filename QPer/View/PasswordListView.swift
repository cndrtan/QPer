//
//  PasswordListView.swift
//  QPer
//
//  Created by Candra Winardi on 23/09/22.
//

import SwiftUI

struct PasswordListView: View {
    @State private var searchPass = ""
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading){
                    Text("Welcome,").font(.title).fontWeight(.semibold)
                    Text("John Doe").font(.largeTitle).fontWeight(.semibold)
                }.padding(.leading)
                Spacer()
                Image(systemName: "gearshape").font(.title).padding(.trailing)
            }.foregroundColor(Color("PrimaryColor"))
            
            //SEARCH BAR
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(Color("PrimaryColor"))
                TextField("Search Password..", text: $searchPass)
                Spacer()
            }.padding().overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("PrimaryColor"), lineWidth: 1)
            ).padding(.leading).padding(.trailing)
            
            HStack{
                Text("Passwords")
                Spacer()
            }.foregroundColor(Color("PrimaryColor")).font(.title2).fontWeight(.semibold).padding(.leading).padding(.top)
            
            Spacer()
            
            //BUTTON ADD NEW
            Button{
                //action button
            }label: {
                Text("Add New Password")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color("PrimaryColor"))
                    .cornerRadius(15)
            }.padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
        }
    }
}

struct PasswordListView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordListView()
    }
}
