//
//  ContentView.swift
//  UlkeTahminOyunu
//
//  Created by Emrah Yıldırım on 12.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false // Uyarımızın gösterilip gösterilmediğini izleyen bir durum
    
    var body: some View {
        // Stack(yığın) ile görünümleri bri arada gösteririz,ayrıca parantez açıp aşağıdaki gibi özellikler verebiliriz.
        VStack(alignment: .leading, spacing: 20){
            Text("Vstack")
            Text("Vstack")
                .background(Color(red: 1, green: 0.8, blue: 0)) // kendimiz renk verirken
            
            HStack(spacing: 20) {
                Text("Hstack")
                Text("Hstack")
                    .background(Color.primary) //primary cihazınvarsayılan renk
            }
            Group{
                ZStack(alignment: .top) {
                    Text("Zstack")
                    Text("Zstack2")
                }
                ZStack{
                    Color.red.frame(width: 200, height: 200) // Böyle bütün stack'e renk veririz. Frame ile de boyutunu ayarlarız.
                    Text("Renk")
                }
                ZStack {
                    Color.red.edgesIgnoringSafeArea(.all) //güvenli alan için
                    Text("Your content")
                }
            }
            
            
            Group{ // Gradyanlar :
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                
                RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
                
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)

            }
            
            Group{ // Buton İmage
                Button(action: { // Buton Tanımlama
                    print("Button was tapped")
                }) {
                    Text("Tap me!")
                }
                // SwiftUI, Imageuygulamalarınızdaki resimleri işlemek için özel bir türe sahiptir ve bunları oluşturmanın üç ana yolu vardır:
                //Image("pencil") projenize eklediğiniz “Kalem” adlı bir resmi yükleyecektir.
                //Image(decorative: "pencil")aynı görüntüyü yükler, ancak ekran okuyucuyu etkinleştirmiş olan kullanıcılar için okumaz. Bu, ek önemli bilgiler iletmeyen görüntüler için kullanışlıdır.
                //Image(systemName: "pencil")iOS'ta yerleşik olan kalem simgesini yükleyecektir. Bu, Apple'ın SF Symbols simge koleksiyonunu kullanır ve beğendiğiniz simgeleri arayabilirsiniz – tam seti görmek için Apple'ın ücretsiz SF Symbols uygulamasını web'den indirin.
                
                Button(action: {
                    print("Edit button was tapped")
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "pencil")
                            .renderingMode(.original) //swift dokunabilir olduğu için mavi renkte gösteriyor bunu düzeltmek için kullandık.
                        Text("Edit")
                    }
                }
            }
            
            Group { // Alert
                
                Button("Show alert") {
                    self.showingAlert = true // Butona tıklandığında uyarı gösterilecek demiş oluruz.
                }
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("Uyarı"), message: Text("Bu bir hata alert'ıdır"), dismissButton: .default(Text("OK")))
                })
                
            }
            

            
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
