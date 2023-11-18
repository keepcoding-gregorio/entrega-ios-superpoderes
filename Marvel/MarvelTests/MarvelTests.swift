//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Gonzalo Gregorio on 13/11/2023.
//

import XCTest

final class MarvelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

//    func testModelos() throws {
//        let model = Heros(id: UUID(), name: "JOSE", description: "", photo: "", favorite: true)
//        XCTAssertNotNil(model)
//        XCTAssertEqual(model.name, "JOSE")
//        XCTAssertEqual(model.getFullName(), "BB JOSE")
//        
//        let modelRequest = HerosFilter(name: "GOKU")
//        XCTAssertNotNil(modelRequest)
//        XCTAssertEqual(modelRequest.name, "GOKU")
//        
//    }
//
//    func testUIViews() throws {
//        let view = ErrorView(error: "TESTING")
//            .environmentObject(RootViewModel(testing: true))
//            
//        XCTAssertNotNil(view)
//        
//        let numItems = try view.inspect().count
//        XCTAssertEqual(numItems, 1)
//        
//        //Imagen
//        let img = try view.inspect().find(viewWithId: 0)
//        XCTAssertNotNil(img)
//        
//        //Texto
//        let text = try view.inspect().find(viewWithId: 1)
//        XCTAssertNotNil(text)
//        
//        let texto = try text.text().string()
//        XCTAssertEqual(texto, "TESTING")
//        
//        
//        //boton
//        let boton = try view.inspect().find(viewWithId: 2)
//        XCTAssertNotNil(boton)
//        
//        //ejecutar el boton TAP
//        try boton.button().tap() //ejecuto el boton
//        
//        
//        
//    }
//    
//    func testViewModelBootCamps() throws {
//        let expectation = self.expectation(description: "Descarga de bootcamps")
//        var suscriptor = Set<AnyCancellable>()
//        
//        //instancio el view model
//        let vm = RootViewModel(testing: true)
//        XCTAssertNotNil(vm)
//        
//        //Creo el observador
//        vm.bootcamps.publisher
//            .sink { completion in
//                switch completion{
//                case .finished:
//                    XCTAssertEqual(1, 1) //test OK
//                    expectation.fulfill()
//                case .failure:
//                    XCTAssertEqual(1, 2) //genero el fallo
//                    expectation.fulfill()
//                }
//            } receiveValue: { data in
//                XCTAssertEqual(1, 1) //test OK
//            }
//            .store(in: &suscriptor)
//
//        //lanzmaos la load
//        vm.loadBootcampsTesting()
//        
//        //esperamos los X segundos
//        self.waitForExpectations(timeout: 10)
//        
//    }
//    
//    
//    
//    func testViewModelHeros() throws {
//        let expectation = self.expectation(description: "Descarga de Heros")
//        var suscriptor = Set<AnyCancellable>()
//        
//       let vm = viewModelHeros(interactor: HerosInteractorFake2())
//        XCTAssertNotNil(vm)
//        
//        //Creo el observador
//        vm.heros.publisher
//            .sink { completion in
//                switch completion{
//                case .finished:
//                    //OK
//                    print("OK temrinado la carga de heros...")
//                   
//                case .failure:
//                    XCTAssertEqual(1, 2) //genero el fallo
//                    expectation.fulfill()
//                }
//            } receiveValue: { heros in
//                XCTAssertEqual(heros.count, 4) //test OK
//                expectation.fulfill()
//            }
//            .store(in: &suscriptor)
//
//        //esperamos los X segundos
//        self.waitForExpectations(timeout: 10)
//        
//    }
}
