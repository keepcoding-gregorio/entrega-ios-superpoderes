//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 16/11/2023.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var characters: [CharacterModel]?
    @Published var state = AppState.none
    
    var suscriptors = Set<AnyCancellable>()
    var interactor : CharactersInteractorProtocol

    init(isTestEnvironment: Bool = false, interactor : CharactersInteractorProtocol = CharactersInteractor()){
        self.interactor = interactor
        !isTestEnvironment ? getCharacters(filter: "") : getCharactersTestMode()
    }
    
    
    func getCharacters(filter: String){
        self.state = .loading
        interactor.getCharacters(filter: filter)
            .sink {
                switch $0 {
                case .failure:
                    self.state = .error(error: "Error buscando heroes")
                case .finished:
                    self.state = .loaded //Success
                }
            } receiveValue: {
                self.characters = $0
            }
            .store(in: &suscriptors)
    }
    
    //for Testing and UI Development
    func getCharactersTestMode(){
        self.state = .loading
        self.characters =  getMockedCharacters()
        self.state = .loaded
    }
    
    
    //solo nos vale para Live Preview
    func getMockedCharacters() -> [CharacterModel]{
        let character1 = CharacterModel(id: UUID(), name: "Goku", description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300", favorite: true)
        
        let character2 = CharacterModel(id: UUID(), name: "Vegeta", description: "Vegeta es todo lo contrario. Es arrogante, cruel y despreciable. Quiere conseguir las bolas de Dragón y se enfrenta a todos los protagonistas, matando a Yamcha, Ten Shin Han, Piccolo y Chaos. Es despreciable porque no duda en matar a Nappa, quien entonces era su compañero, como castigo por su fracaso. Tras el intenso entrenamiento de Goku, el guerrero se enfrenta a Vegeta y estuvo a punto de morir. Lejos de sobreponerse, Vegeta huye del planeta Tierra sin saber que pronto tendrá que unirse a los que considera sus enemigos.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/vegetita.jpg?width=300", favorite: false)
        
        let character3 = CharacterModel(id: UUID(), name: "Freezer", description: "Freezer es el villano más temido del universo Dragon Ball, es la maldad personificada. Es el responsable de la muerte de los padres de Goku, del Rey Vegeta, de los Saiyan del Planeta Vegeta, donde provocó un genocidio. La serie mostró en varias ocasiones su crueldad, ya que disfruta de la muerte y del sufrimiento de sus víctimas. Y no tiene límites. Freezer es la razón por la que Vegeta termina uniéndose a Goku. Tanto Vegeta como Freezer desean la inmortalidad, así que ambos compiten por reunir las bolas de Dragón. Finalmente todos se enfrentan a él. El propio Piccolo es resucitado y trasladado a Namek para enfrentarse al villano. Pronto revelará que tiene varias transformaciones más poderosas, siendo la forma final la más fuerte de todas. Trunks del Futuro consigue matarle, aunque más tarde será revivido para volver a dar guerra en Dragon Ball Super.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/freezer-dragon-ball-bebe-abj.jpg?width=300", favorite: true)
        
        let character4 = CharacterModel(id: UUID(), name: "Krilin", description: "Krilin lo tiene todo. Cuando aún no existían los 'memes', Krilin ya los protagonizaba. Junto a Yamcha ha sido objeto de burla por sus desafortunadas batallas en Dragon Ball Z. Inicialmente, Krilin era el mejor amigo de Goku siendo sólo dos niños que querían aprender artes marciales. El Maestro Roshi les entrena para ser dos grandes luchadores, pero la diferencia entre ambos cada vez es más evidente. Krilin era ambicioso y se ablanda con el tiempo. Es un personaje que acepta un papel secundario para apoyar el éxito de su mejor amigo Goku de una forma totalmente altruista.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/08/Krilin.jpg?width=300", favorite: false)
        
        return [character1, character2, character3, character4]
        
    }
}
