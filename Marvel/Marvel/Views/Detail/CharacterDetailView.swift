//
//  CharacterDetailView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    //@ObservedObject var viewModelHeros: viewModelHeros
    
    var body: some View {
        VStack{
            HStack{
                //name
                Text(character.name)
                    .bold()
                    .font(.title)
                Spacer()
                Button(action: {
                    
                }, label: {
//                    if (character.favorite!){
//                        Image(systemName: "heart.circle")
//                            .resizable()
//                            .foregroundColor(.red)
//                            .frame(width: 40, height: 40)
//                            .padding([.leading], 10)
//                        
//                    } else{
//                        Image(systemName: "heart.circle")
//                            .resizable()
//                            .foregroundColor(.gray)
//                            .frame(width: 40, height: 40)
//                            .padding([.leading], 10)
//                    }
                })
                //Me gusta
            }
            .padding([.leading, .trailing], 10)
            
            //Foto del heroe
            AsyncImage(url: URL(string: character.thumbnail.path)) { photo in
                //foto descargada
                photo
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
                    .padding([.leading, .trailing], 10)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            }
            
            //Description
            Text(character.description)
                .foregroundStyle(.gray)
                .font(.caption)
            
            
        }
    }
}

#Preview {
    Group {
        let mockedCharacter = Character(id: 1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg))
        
        CharacterDetailView(character: mockedCharacter)
    }

}
