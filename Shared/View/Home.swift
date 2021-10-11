//
//  Home.swift
//  Reels (iOS)
//
//  Created by Jigar on 09/10/21.
//

import SwiftUI

struct Home: View {
    //Hiding Tab Bar
    init ()
    {
        UITabBar.appearance().isHidden = true
    }

    @State var currentTab = "house.fill "
    var body: some View {


        //

        VStack (spacing: 0){


            TabView(selection: $currentTab){
                Text ("Home")
                    .tag("house.fill")
                Text ("Search")
                    .tag("magnifyingglass.fill")

                // Reels View...
                ReelsView()
                    .tag("Reels")

                Text ("Liked")
                    .tag("suit.heart")
                Text ("Profile ")
                    .tag("person.circle")

            }

            HStack(spacing: 0) {

                // simply creating array of images


                ForEach (["house.fill","magnifyingglass","Reels","suit.heart","person.circle"], id: \.self){
                    image in
                    TabBarButton(image: image , isSystemImage: image != "Reels", currentTab: $currentTab)
                }

            }
            .padding(.horizontal)
            .padding(.vertical, 10)

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
        
    }
}

///Tab bar button

struct TabBarButton: View{
    var image: String
    var isSystemImage: Bool
    @Binding var currentTab: String

    var body: some View {

        Button {
            withAnimation {currentTab = image}
        } label: {

            ZStack{
            if isSystemImage{
                Image(systemName: image)
                    .font(.title2)

            }
            else{
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio( contentMode: .fit )
                    .frame(width: 25, height: 25)
            }

        }
        }
        .foregroundColor(currentTab == image ? .primary : . gray)
        .frame(maxWidth: .infinity)

    }
}

