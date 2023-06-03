//  /*
//
//  Project: Neumorphic 
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 02.06.2023
//
//  */

import SwiftUI

struct ContentView: View {
    
    @State private var selectedItem: String = ""
    
    let textArray = ["1. Antractica", "2. Europe", "3. Asia", "4. Africa", "5. South America"]
    
    var body: some View {
        
        ZStack {
            //Color(red: 101, green: 101, blue: 101)
            
            Color.gray.opacity(0.5)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 15)
            
                .fill(
                    Color.gray.opacity(0.5)
                        .shadow(.inner(color: .white.opacity(0.3),
                                       radius: 5, x: -5, y: -5))
                        .shadow(.inner(color: .gray.opacity(0.3),
                                       radius: 5, x: 5, y: 5))
                )
                .frame(width: 300, height: 300)
                .overlay {
                    
                    VStack(spacing: 20) {
                        ForEach(textArray.indices, id: \.self) { index in
                            HStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.5))
                                    .frame(width: 35, height: 35)
                                    .shadow(color: .white, radius: 5, x: -5, y: -5)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                                    .overlay(content: {
                                        Group {
                                            
                                            if selectedItem == textArray[index] {
                                                
                                                Circle()
                                                    .fill(Color.gray.opacity(0.5))
                                                    .frame(width: 28, height: 28)
                                                    .shadow(color: .gray.opacity(0.14), radius: 1, x: -2, y: -2)
                                                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                                                
                                            } else {
                                                
                                                Circle()
                                                    .fill(Color.gray.opacity(0.5))
                                                    .frame(width: 28, height: 28)
                                                    .shadow(color: .white, radius: 2, x: -2, y: -2)
                                                    .shadow(color: .gray.opacity(0.5), radius: 2, x: 2, y: 2)
                                                
                                            }
                                        }
                                    })
                                    .onTapGesture {
                                        withAnimation {
                                            selectedItem = textArray[index]
                                        }
                                    }
                                
                                Text(textArray[index])
                                    .foregroundColor(selectedItem == textArray[index] ? Color.black : Color.gray)
                                    .font(selectedItem == textArray[index] ? .system(.title3)
                                        .bold() :
                                            .system(.title3))
                                    .padding(.leading, selectedItem == textArray[index] ? 20 : 10)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
