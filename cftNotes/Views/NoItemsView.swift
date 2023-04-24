//
//  NoItemsView.swift
//  cftNotes
//
//  Created by Вадим Эфис on 31.01.2023.
//

import SwiftUI


struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("secondaryAccentColor")
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("У Тебя нет Заметок")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Напиши и добавь пару заметок) Будь добр.")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Добавить что нибудь.👈")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0,
                            y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0 )
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
   }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
        }
        }
        
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("ToDoList")
        }
    }
}
