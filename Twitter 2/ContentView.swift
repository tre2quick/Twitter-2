//
//  ContentView.swift
//  Twitter 2
//
//  Created by Bernard Lyons on 12/9/22.
//

//How to make colors dependent on system color

import SwiftUI

struct User: Identifiable{
    var id: Int
    let profile_name, username, message: String
}

struct FeedTweets: Identifiable{
    var id: Int
    let profile_name, username, message: String
}

struct ContentView: View {
    // later, create a varaiable and function that allows users to input and create new tweets
    
    // Intiazlizer that creates tweets in list format.
    let users: [User] = [
        .init(id: 0, profile_name: "Tre 🍾", username: "@__richtre", message: "The apple developer academy is amazing!"),
        .init(id: 1, profile_name: "Tre 🍾", username: "@__richtre", message: "The apple developer academy is amazing!"),
        .init(id: 2, profile_name: "Tre 🍾", username: "@__richtre", message: "The apple developer academy is amazing!"),
        .init(id: 3, profile_name: "Tre 🍾", username: "@__richtre", message: "The apple developer academy is amazing!")

        ]
        
    init (){
        UITableView.appearance().backgroundColor = .gray
    }


    
    var body: some View {
        NavigationView {
           ZStack {
               Color.black
                   .edgesIgnoringSafeArea(.all)
              // List{
               VStack{
                   VStack {
                       Image(uiImage: UIImage(imageLiteralResourceName: "TransformPic"))
                           .resizable()
                           .frame(height:180)
                           .edgesIgnoringSafeArea(.all)
                           .overlay(
                                        //Overlay includes profile pic and edit profile button
                            HStack{
                                Image(uiImage: UIImage(imageLiteralResourceName: "ProfilePic2"))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(.black, lineWidth: 5))
                                    .padding(.top, 100)
                                    .padding(.leading, 30)
                                
                                Spacer()
                                NavigationLink(destination: EditProfileView()){
                                    Text("Edit Profile")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.white)
                                        .bold()
                                        .overlay(Capsule().stroke(.gray, lineWidth: 1)
                                            .padding(.all, -8))
                                        .padding(.top, 140)
                                        .padding(.trailing, 20)
                                }
                                
                            }
                        
                           )
                       
                       // User Profile Pic
                       //Add Image to below var to create picture upload.
                       //var userProfilePic = String()
                       HStack{
                           VStack(alignment: .leading){
                               Text("Tre 🍾")
                                   .font(.system(size: 25))
                                   .foregroundColor(.white)
                                   .bold()
                               //.background(Color.red)
                                   .padding(.leading, 30)
                               
                               //
                               Text("@__richtre")
                                   .foregroundColor(Color.gray)
                                   .font(.system(size: 13))
                               //.background(Color.yellow)
                                   .padding(.leading, 30)
                               
                           }
                           Spacer()
                       }
                       
                   }
                   .background(Color.black)
                   
                   //Profile Head Info
                   VStack(alignment: .leading){
                       //BIO
                       Text("Entrepreneur 💰")
                           .padding(.top, 10)
                           .padding(.leading, 30)
                           .foregroundColor(.white)
                           .font(.system(size: 17))
                       
                       HStack{
                           //Location
                           Text("Detroit, MI")
                               .padding(.leading, 30)
                               .foregroundColor(.gray)
                               .font(.system(size: 13))

                           //Birthdate
                           Text("December 2, 1999")
                               .padding(.leading, 10)
                               .foregroundColor(.gray)
                               .font(.system(size: 13))

                           Spacer()
                       }.padding(.init(top: 0.5, leading: 0, bottom: 0, trailing: 0))
                       
                       HStack{
                           Text("367")
                               .foregroundColor(Color.white)
                               .bold()
                               .padding(.leading, 30)
                           Text("Following")
                               .foregroundColor(Color.gray)

                           Text("602")
                               .foregroundColor(Color.white)
                               .bold()

                           Text("Followers")
                               .foregroundColor(Color.gray)

                           Spacer()
                       }.padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
                   }.padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                   
                   //MENU
                   
                   HStack(spacing: 30){
                       Text("Tweets")
                           .foregroundColor(.white)
                       
                       Text("Tweets & Replies")
                           .foregroundColor(.white)
                       
                       Text("Media")
                           .foregroundColor(.white)
                       
                       Text("Likes")
                           .foregroundColor(.white)
                       
                       
                   }.padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                   
                   Rectangle()
                       .foregroundColor(Color.gray)
                       .frame(height: 1)
                   
                   
                   
               Spacer()
                   
                   
            // Dynamic list/feed
                   
                   //One way to create a dynamic list
//                   List(users) {
//                       Text($0.username)  //  represents one of the users
//                   }.navigationBarTitle(Text("Dynamic List"))
//
                  
                   VStack{
                       List {
                           ForEach(users) { user in
                               // user row
                               
                               HStack{
                                   
                                   VStack {
                                       Image("ProfilePic2")
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 60, height: 60)
                                           .clipShape(Circle())
                                           .padding(.leading, 20)
                                   }.padding(.bottom, 25)
                                       .listRowBackground(Color.black)
                                   
                                   VStack(alignment: .leading){
                                       
                                       HStack{
                                           
                                           Text(user.profile_name)
                                               .font(.headline)
                                           Text(user.username)
                                               .font(.subheadline)
                                       }.padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                                           .listRowBackground(Color.black)
                                       
                                       
                                       Text(user.message)
                                           .padding(.top, -9)
                                           .font(.subheadline)
                                           .lineLimit(nil)
                                           .listRowBackground(Color.black)
                                       
                                       
                                       HStack(spacing: 50){
                                           //Retweet comment and like options
                                           Image(systemName: "message")
                                               .foregroundColor(Color.gray)
                                               .listRowBackground(Color.black)
                                           
                                               .font(.system(size: 17))
                                           Image(systemName: "arrow.2.squarepath")
                                               .foregroundColor(Color.gray)
                                           
                                               .font(.system(size: 17))
                                           Image(systemName: "heart")
                                               .foregroundColor(Color.gray)
                                           
                                               .font(.system(size: 17))
                                           Image(systemName: "arrow.up.square")
                                               .foregroundColor(Color.gray)
                                           
                                               .font(.system(size: 17))
                                       }.padding(.init(.init(top: 2, leading: 0, bottom: 0, trailing: 0)))
                                       
                                       
                                       
                                       
                                   }.padding(.init(top: 0, leading: 5, bottom: 0, trailing: 0))
                                   
                                   
                               }

                               
                               
                           }
                           //.listRowBackground(Color.black) //End of for each
                           
                       }
                       .listStyle(.inset)

                       }

                       
                       
                       
                       
                       HStack(spacing: 40){
                           NavigationLink(destination: FeedPageView()){
                               Image(systemName: "house")
                                   .foregroundColor(Color.white)
                                   .frame(height: 40)
                                   .font(.system(size: 30))
                           }
                           
                           NavigationLink(destination: SearchPageView()){
                               Image(systemName: "magnifyingglass")
                                   .foregroundColor(Color.white)
                                   .frame(height: 40)
                                   .font(.system(size: 30))
                           }
                           
                           NavigationLink(destination: SpacesPageView()){
                               Image(systemName: "mic.circle")
                                   .foregroundColor(Color.white)
                                   .frame(height: 40)
                                   .font(.system(size: 30))
                           }
                           
                           NavigationLink(destination: NotifcationsPageView()){
                               Image(systemName: "bell")
                                   .foregroundColor(Color.white)
                                   .frame(height: 40)
                                   .font(.system(size: 30))
                           }
                           
                           NavigationLink(destination: DmPageView()){
                               Image(systemName: "message")
                                   .foregroundColor(Color.white)
                                   .frame(height: 40)
                                   .font(.system(size: 30))
                           }
                           
                           
                       }
                   
                    }
                }
            }
        }
    }

struct EditProfileView: View {
    var body: some View{
        
        ZStack {
            Text("Edit Profile")
        }
        
        ZStack{
            VStack{
                Spacer()
                HStack(spacing: 40){
                    NavigationLink(destination: FeedPageView()){
                        Image(systemName: "house")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SearchPageView()){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SpacesPageView()){
                        Image(systemName: "mic.circle")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: NotifcationsPageView()){
                        Image(systemName: "bell")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: DmPageView()){
                        Image(systemName: "message")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    
                }
            }
        }
    }
}
struct FeedPageView: View {
    
    let tweets: [FeedTweets] = [
        
        .init(id: 0, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code"),
        .init(id: 1, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code"),
        .init(id: 2, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code"),
        .init(id: 3, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code"),
        .init(id: 4, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code"),
        .init(id: 5, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code"),
        .init(id: 6, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code"),
        .init(id: 7, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code"),
        .init(id: 8, profile_name: "Dev", username: "@appledeveloperacademy", message: "Who's ready to code")
    
    
    ]
    
    var body: some View{
        ZStack{
            VStack{
                List{
                    ForEach(tweets) { tweet in
                        // user row
                        
                        HStack{
                            
                            VStack {
                                Image("Apple")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .padding(.leading, 5)
                            }.padding(.bottom, 25)
                                .listRowBackground(Color.black)
                            
                            VStack(alignment: .leading){
                                
                                HStack{
                                    
                                    Text(tweet.profile_name)
                                        .font(.headline)
                                    Text(tweet.username)
                                        .font(.subheadline)
                                }.padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                                    .listRowBackground(Color.black)
                                
                                
                                Text(tweet.message)
                                    .padding(.top, -9)
                                    .font(.subheadline)
                                    .lineLimit(nil)
                                    .listRowBackground(Color.black)
                                
                                
                                HStack(spacing: 50){
                                    //Retweet comment and like options
                                    Image(systemName: "message")
                                        .foregroundColor(Color.gray)
                                        .listRowBackground(Color.black)
                                    
                                        .font(.system(size: 17))
                                    Image(systemName: "arrow.2.squarepath")
                                        .foregroundColor(Color.gray)
                                    
                                        .font(.system(size: 17))
                                    Image(systemName: "heart")
                                        .foregroundColor(Color.gray)
                                    
                                        .font(.system(size: 17))
                                    Image(systemName: "arrow.up.square")
                                        .foregroundColor(Color.gray)
                                    
                                        .font(.system(size: 17))
                                }.padding(.init(.init(top: 2, leading: 0, bottom: 0, trailing: 0)))
                                
                                
                                
                                
                            }.padding(.init(top: 0, leading: 5, bottom: 0, trailing: 0))
                            
                            
                        }

                        
                        
                    }
                    //.listRowBackground(Color.black) //End of for each
                    
                }
                .listStyle(.inset)
               
                Spacer()
                
                HStack(spacing: 40){
                    NavigationLink(destination: FeedPageView()){
                        Image(systemName: "house")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SearchPageView()){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SpacesPageView()){
                        Image(systemName: "mic.circle")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: NotifcationsPageView()){
                        Image(systemName: "bell")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: DmPageView()){
                        Image(systemName: "message")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    
                }
            }
        }
    }
}
struct SearchPageView: View {
    var body: some View{
        
        ZStack {
            Text("Search Page")
        }
        ZStack{
            VStack{
                Spacer()
                HStack(spacing: 40){
                    NavigationLink(destination: FeedPageView()){
                        Image(systemName: "house")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SearchPageView()){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SpacesPageView()){
                        Image(systemName: "mic.circle")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: NotifcationsPageView()){
                        Image(systemName: "bell")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: DmPageView()){
                        Image(systemName: "message")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    
                }
            }
        }
    }
}
struct SpacesPageView: View {
    var body: some View{
        
        ZStack {
            Text("Spaces Page")
        }
        ZStack{
            VStack{
                Spacer()
                HStack(spacing: 40){
                    NavigationLink(destination: FeedPageView()){
                        Image(systemName: "house")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SearchPageView()){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SpacesPageView()){
                        Image(systemName: "mic.circle")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: NotifcationsPageView()){
                        Image(systemName: "bell")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: DmPageView()){
                        Image(systemName: "message")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    
                }
            }
        }
    }
}
struct NotifcationsPageView: View {
    var body: some View{
        
        ZStack {
            Text("Notifications Page")
        }
        ZStack{
            VStack{
                Spacer()
                HStack(spacing: 40){
                    NavigationLink(destination: FeedPageView()){
                        Image(systemName: "house")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SearchPageView()){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SpacesPageView()){
                        Image(systemName: "mic.circle")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: NotifcationsPageView()){
                        Image(systemName: "bell")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: DmPageView()){
                        Image(systemName: "message")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    
                }
            }
        }
    }
}
struct DmPageView: View {
    var body: some View{
        
        ZStack {
            Text("Direct Messages")
        }
        ZStack{
            VStack{
                Spacer()
                HStack(spacing: 40){
                    NavigationLink(destination: FeedPageView()){
                        Image(systemName: "house")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SearchPageView()){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: SpacesPageView()){
                        Image(systemName: "mic.circle")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: NotifcationsPageView()){
                        Image(systemName: "bell")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    NavigationLink(destination: DmPageView()){
                        Image(systemName: "message")
                            .foregroundColor(Color.white)
                            .frame(height: 40)
                            .font(.system(size: 30))
                    }
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
