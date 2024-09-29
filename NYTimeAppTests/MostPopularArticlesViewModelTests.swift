//
//  MostPopularArticlesViewModelTests.swift
//  NYTimeAppTests
//
//  Created by EZAZ AHAMD on 27/09/24.
//

import XCTest
@testable import NYTimeApp

final class MostPopularArticlesViewModelTests: XCTestCase {
  
    private var networkingMock: MockNetworkingManager!
    private var vm : MostPopularArticlesViewModel!
    
    
    override func setUp() {
        super.setUp()
        networkingMock = MockNetworkingManager()
        vm = MostPopularArticlesViewModel(networkingMock)
        
    }
    
    override func tearDown() {
        networkingMock = nil
        vm = nil
        super.tearDown()
        
    }
    
    func test_FetchArticalesSuccess() async {
        //Given
        networkingMock.resultState = .success
        let mockArticale = Article(title: "Test Article")
        networkingMock.mockArticles = [mockArticale]
        
        // When
       await vm.fetchArtical()
        
        //Then
        
        XCTAssertEqual(vm.articles.count, 1)
        XCTAssertEqual(vm.articles.first?.title, "Test Article")
        XCTAssertNil(vm.error)
        
        
    }
    
    
    
    func test_FetchArticalesWhenResultsAreNil() async {
        //Given
        
      
        networkingMock.resultState = .nilResults
        //When
        await vm.fetchArtical()
        
        
        //Then
        
        XCTAssertEqual(vm.articles.count, 0)
        XCTAssertFalse(vm.hasError)
        
    }
   
    
    func test_FetchArticalesFailureCase_failedToDecode() async{
        //Give
        networkingMock.resultState = .error(.failedToDecode)
        
        //When
        await vm.fetchArtical()
        
        //Then
        XCTAssertEqual(vm.articles.count, 0)
        XCTAssertNotNil(vm.error)
        XCTAssertEqual(vm.error?.errorDescription, "Failed to decode the data.")
        
    }
    
    
    
    
    func test_FetchArticalesFailureCase_invalidUrl() async{
        //Give
        networkingMock.resultState = .error(.invalidUrl)
        
        //When
        await vm.fetchArtical()
        
        //Then
        XCTAssertEqual(vm.articles.count, 0)
        XCTAssertNotNil(vm.error)
        XCTAssertEqual(vm.error?.errorDescription, "The URL is invalid.")
        
    }
    
    func test_FetchArticalesFailureCase_invalidStatusCode() async{
        //Give
        let invalidStatusCode = 404
        networkingMock.resultState = .error(.invalidStatusCode(status: invalidStatusCode))
        
        //When
        await vm.fetchArtical()
        
        //Then
        XCTAssertEqual(vm.articles.count, 0)
        XCTAssertNotNil(vm.error)
        XCTAssertEqual(vm.error?.errorDescription, "The server returned an invalid status code \(invalidStatusCode).")
        
    }
    
    
    func test_FetchArticalesFailureCase_invalidData() async{
        //Give
        networkingMock.resultState = .error(.invalidData)
        
        //When
        await vm.fetchArtical()
        
        //Then
        XCTAssertEqual(vm.articles.count, 0)
        XCTAssertNotNil(vm.error)
        XCTAssertEqual(vm.error?.errorDescription, "The response data is invalid.")
        
    }
    
    
    func test_FetchArticalesCustomError() async {
        // Given
        networkingMock.resultState = .customError(NSError(domain: "CustomErrorDomain", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Something went wrong."]))

           // When
           await vm.fetchArtical()

           // Then
           XCTAssertEqual(vm.error?.errorDescription, "Something went wrong: Something went wrong.")
           XCTAssertTrue(vm.hasError)
    }
    
    
    func test_FetchArticalesFailureCase_invalidStatusCodeAPIKeyMissing() async{
        //Give
        let invalidStatusCode = 401
        networkingMock.resultState = .error(.invalidStatusCode(status:invalidStatusCode))
        
        //When
        await vm.fetchArtical()
        
        //Then
        XCTAssertEqual(vm.articles.count, 0)
        XCTAssertNotNil(vm.error)
        XCTAssertEqual(vm.error?.errorDescription, "The server returned an invalid status code 401. Api key missing.")
        
    }
    
}
