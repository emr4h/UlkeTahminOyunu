//
//  UlkeTahminView.swift
//  UlkeTahminOyunu
//
//  Created by Emrah Yıldırım on 12.09.2021.
//

import SwiftUI

struct UlkeTahminView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled() //Ulke dizisi
    //shuffled()yöntem bizim için dizi sırasını rastgele hale getirmeyi otomatik olarak hallediyor.
    @State private var correctAnswer = Int.random(in: 0...3) // hangi ülke görüntüsünün doğru olduğunu saklayan bir tamsayı 0,1,2 arasından birini oluşturuyor.
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score : Int = 0
    
    var body: some View {
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [Color.blue, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Spacer()
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 4) { x in
                    Button(action: {
                        self.flagTapped(number: x)
                    }) {
                        
                        Image(self.countries[x])
                            .renderingMode(.original)
                            .clipShape(Capsule()) // Swift'de dört yerleşik şekil vardır:rectangle, rounded rectangle, circle, and capsule.
                            .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                            .shadow(color: .white, radius: 2)
                        
                    }
                }
                .alert(isPresented: $showingScore) {
                    Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                        self.askQuestion()
                    })
                }
                Spacer()
                Text("Score : \(score)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    // Bayrağa tıklandığında olacaklar fonksiyonu :
    func flagTapped(number: Int) {
        if number == correctAnswer {
            score = score + 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong ! This flag is \(countries[number])"
            score = 0
        }

        showingScore = true // Alert kontrolü
    }
    func askQuestion() {
        // Yeni soru geçişi için
        countries.shuffle()
        correctAnswer = Int.random(in: 0...3)
    }
}

struct UlkeTahminView_Previews: PreviewProvider {
    static var previews: some View {
        UlkeTahminView()
    }
}
