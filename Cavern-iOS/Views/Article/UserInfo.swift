//
//  UserInfo.swift
//  Cavern-iOS
//
//  Created by secminhr on 2021/2/22.
//

import SwiftUI

struct UserInfo: View {
    @State var user: User? = nil
    @State var userImage: Image? = nil
    @State var editing: Bool =  false
    @Binding var showing: Bool
    let username: String
    
    var body: some View {
        if user == nil {
            ProgressView()
                .onReceive(
                    userInfoPublisher(username: username),
                    perform: { user = $0 }
                )
        } else {
            NavigationView {
                VStack {
                    if userImage == nil {
                        ProgressView()
                            .onReceive(
                                imagePublisher(hash: user!.hash),
                                perform: {
                                    userImage = $0
                                }
                            )
                    } else {
                        userImage!
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 200, height: 200)
                            .shadow(radius: 7)
                    }
                    Text(user!.name)
                        .font(.title)
                        .padding(.top)
                    Text(user!.username)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Permission")
                                .bold()
                                .padding(.leading)
                            Divider()
                            Text(user!.role)
                        }.fixedSize()
                        Divider()
                        HStack {
                            Text("Number of posts")
                                .bold()
                                .padding(.leading)
                            Divider()
                            Text(String(user!.posts_count))
                        }.fixedSize()
                    }
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Toggle(isOn: $editing, label: {
                        Text("Edit")
                    }).padding()
                    Button(action: {
                        withAnimation { showing = false }
                    }, label: {
                        Text("Done")
                    })
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserInfo(user: sampleUser, showing: .constant(true), username: "")
            UserInfo(user: sampleUser, showing: .constant(true), username: "")
                .previewDevice("iPod touch (7th generation)")
        }
    }
}
