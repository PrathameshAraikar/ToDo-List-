//
//  NoItemView.swift
//  ToDo-SwiftUI
//
//  Created by Prathamesh Araikar on 15/01/22.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items! 😢")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Dayyyumn you don't look a productive person at all, Goddamn add some items in your ToDo List and get your lazy ass working 🤬")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView()) {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                
                .scaleEffect(animate ? 1.15 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        if !animate {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
            }
        } else {
            return
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("ToDo List 📝")
        }
    }
}
