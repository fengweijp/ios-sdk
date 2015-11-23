//
//  AlchemyLanguageTests.swift
//  AlchemyLanguageTests
//
//  Created by Ruslan Ardashev on 11/4/15.
//  Copyright © 2015 ibm.mil. All rights reserved.
//

import XCTest
@testable import WatsonSDK

class AlchemyLanguageTests: XCTestCase {
    
    // timing
    private let timeout: NSTimeInterval = 60.0
    
    // main instance
    let instance = AlchemyLanguage()
    var apiKeyNotSet: Bool { return instance._apiKey == nil }
    
    // test strings
    var test_html_no_author = "<html><head><title>The best SDK Test | AlchemyAPI</title></head><body><h1>Hello World!</h1><p>My favorite language is Javascript</p></body></html>"
    
    var test_html_charles_dickens = "<img alt=\"\" src=\"//upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg/244px-Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg\" width=\"244\" height=\"211\" class=\"thumbimage\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg/366px-Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg/488px-Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg 2x\" data-file-width=\"2699\" data-file-height=\"2330\" /></a><div class=\"thumbcaption\"><div class=\"magnify\"><a href=\"/wiki/File:Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne,_1859.jpg\" class=\"internal\" title=\"Enlarge\"></a></div>It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair…</div></div></div>"
    
    // no escape characters
    //<img alt="" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg/244px-Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg" width="244" height="211" class="thumbimage" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg/366px-Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg/488px-Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne%2C_1859.jpg 2x" data-file-width="2699" data-file-height="2330" /></a><div class="thumbcaption"><div class="magnify"><a href="/wiki/File:Charles_Dickens-_A_Tale_of_Two_Cities-With_Illustrations_by_H_K_Browne,_1859.jpg" class="internal" title="Enlarge"></a></div>It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair…</div></div></div>
    
    var anotherString = "The semantic text mining Alchemy API is now a member of the API Billionaires Club. The service, which makes sense of raw unstructured data, averages 65-75 million requests per day, according to Alchemy's Elliot Turner. That brings the monthly count above 2 billion API requests. Of the calls to Alchemy, 95% are from paying customers, according to Turner. The biggest category of customers is social media monitoring firms. Other areas with significant users are vertical search, real-time discovery, content recommendation, influencer trackers and ad networks. There are a number of different ways Alchemy can make sense of text: extract categories, concepts, terms and entities, as well as receive sentiment analysis. The API can also perform content scraping to extract data from or clean up a web page. The latter is similar to the Diffbot Article API, which we called a great democratizer for its ability to make content available to anyone. Alchemy and Diffbot are two of 76 semantic APIs in our directory. The most popular is the MusicBrainz API for accessing music metadata. Even Google uses it for displaying more advanced music search results."
    
    var test_url_0 = "http://www.programmableweb.com/news/new-api-billionaire-text-extractor-alchemy/2011/09/16"
    
    var test_get_entities_text_valid = "Vladimir Vladimirovich Putin (/ˈpuːtɪn/; Russian: Влади́мир Влади́мирович Пу́тин; IPA: [vlɐˈdʲimʲɪr vlɐˈdʲimʲɪrəvʲɪtɕ ˈputʲɪn] ( listen), born 7 October 1952) has been the President of Russia since 7 May 2012, succeeding Dmitry Medvedev. Putin previously served as President from 2000 to 2008, and as Prime Minister of Russia from 1999 to 2000 and again from 2008 to 2012. During his last term as Prime Minister, he was also the Chairman of United Russia, the ruling party.\n\nFor 16 years Putin was an officer in the KGB, rising to the rank of Lieutenant Colonel before he retired to enter politics in his native Saint Petersburg in 1991. He moved to Moscow in 1996 and joined President Boris Yeltsin's administration where he rose quickly, becoming Acting President on 31 December 1999 when Yeltsin unexpectedly resigned. Putin won the subsequent 2000 presidential election, despite widespread accusations of vote-rigging,[3] and was reelected in 2004. Because of constitutionally mandated term limits, Putin was ineligible to run for a third consecutive presidential term in 2008. Dmitry Medvedev won the 2008 presidential election and appointed Putin as Prime Minister, beginning a period of so-called \"tandemocracy\".[4] In September 2011, following a change in the law extending the presidential term from four years to six,[5] Putin announced that he would seek a third, non-consecutive term as President in the 2012 presidential election, an announcement which led to large-scale protests in many Russian cities. In March 2012 he won the election, which was criticized for procedural irregularities, and is serving a six-year term.[6][7]\n\nDuring Putin's first premiership and presidency (1999–2008) real incomes in Russia rose by a factor of 2.5, while real wages more than tripled; unemployment and poverty more than halved. Russians' self-assessed life satisfaction also rose significantly.[8] Putin's first presidency was marked by high economic growth: the Russian economy grew for eight straight years, seeing GDP increase by 72% in PPP (as for nominal GDP, 600%).[8][9][10][11][12] This growth was a combined result of the 2000s commodities boom, high oil prices, as well as prudent economic and fiscal policies.[13][14]\n\nAs Russia's president, Putin and the Federal Assembly passed into law a flat income tax of 13%, a reduced profits tax, and new land and legal codes.[15][16] As Prime Minister, Putin oversaw large-scale military and police reform. His energy policy has affirmed Russia's position as an energy superpower.[17][18] Putin supported high-tech industries such as the nuclear and defence industries. A rise in foreign investment[19] contributed to a boom in such sectors as the automotive industry.\n\nMany of Putin's actions are regarded by the domestic opposition and foreign observers as undemocratic.[20] The 2011 Democracy Index stated that Russia was in \"a long process of regression [that] culminated in a move from a hybrid to an authoritarian regime\" in view of Putin's candidacy and flawed parliamentary elections.[21] In 2014, Russia was suspended from the G8 group as a result of its annexation of Crimea.[22][23]"
    
    var test_get_entities_text_invalid = "Hello hello hello hello hello hello!!"
    
    var test_get_text_sentiment_invalid = ""
    
    private func htmlDocumentFromURLString(url: String) -> String {
        
        var returnString = ""
        
        if let myURL = NSURL(string: url) {
            
            do { returnString = try NSString(contentsOfURL: myURL, encoding: NSUTF8StringEncoding) as String } catch { }
            
        }
        
        return returnString
        
    }
    
    private func htmlDocumentAsStringFromTitle(title: String) -> String {
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            
            let path = dir.stringByAppendingPathComponent("\(title).html")
            
            do {
                
                let textAsString = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                return textAsString as String
                
            } catch { }
            
        } else { }
        
        return ""
        
    }
    
    
    // setup, teardown
    override func setUp() {
        
        super.setUp()
        
        let bundle = NSBundle(forClass: self.dynamicType)
        
        if let url = bundle.pathForResource("Credentials", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: url) as? [String : String]
            where apiKeyNotSet {
                
                instance._apiKey = dict["AlchemyAPIKey"]!
                
        }
        
    }
    
    // called after the invocation of each test method in the class
    override func tearDown() { super.tearDown() }
    
    
    // tests
    func testHTMLGetEntities() {
        
        let validExpectation = expectationWithDescription("valid")
        
        let html = htmlDocumentFromURLString("http://en.wikipedia.org/wiki/Vladimir_Putin")
        
        instance.getEntities(requestType: .HTML,
            html: html,
            url: nil,
            text: nil) {
                
                (error, entities) in
                
                let ents = entities.entities
                
                XCTAssertNotNil(ents)
                
                if let entities = entities.entities {
                    
                    XCTAssertTrue(entities.count > 0)
                    
                    var countryTypeFound = false
                    var cityTypeFound = false
                    var personTypeFound = false
                    
                    for entity in entities {
                        
                        XCTAssertNotNil(entity.type)
                        
                        let unwrappedType = entity.type!
                        
                        switch unwrappedType {
                        case "Country": countryTypeFound = true
                        case "City": cityTypeFound = true
                        case "Person" : personTypeFound = true
                        default: func nothing(){}; nothing()
                        }
                        
                    }
                    
                    XCTAssertTrue(countryTypeFound && cityTypeFound && personTypeFound)
                    
                    validExpectation.fulfill()
                    
                }
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testInvalidHTMLGetEntities() {
        
        let invalidExpectation = expectationWithDescription("invalid")
        
        let html = htmlDocumentFromURLString("http://www.nooooooooooooooo.com/")
        
        instance.getEntities(requestType: .HTML,
            html: html,
            url: nil,
            text: nil) {
                
                (error, entities) in
                
                let ents = entities.entities
                
                XCTAssertNotNil(ents)
                
                if let entities = entities.entities {
                    
                    XCTAssertTrue(ents!.count > 0)
                    
                    let unwrappedEntities = ents!
                    
                    var countryTypeFound = false
                    var cityTypeFound = false
                    var personTypeFound = false
                    
                    for entity in unwrappedEntities {
                        
                        XCTAssertNotNil(entity.type)
                        
                        let unwrappedType = entity.type!
                        
                        switch unwrappedType {
                        case "Country": countryTypeFound = true
                        case "City": cityTypeFound = true
                        case "Person" : personTypeFound = true
                        default: func nothing(){}; nothing()
                        }
                        
                    }
                    
                    XCTAssertFalse(countryTypeFound || cityTypeFound)
                    
                    invalidExpectation.fulfill()
                    
                }
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testURLGetEntities() {
        
        let validExpectation = expectationWithDescription("valid")
        
        instance.getEntities(requestType: .URL,
            html: nil,
            url: "http://en.wikipedia.org/wiki/Vladimir_Putin",
            text: nil) {
                
                (error, entities) in
                
                let ents = entities.entities
                
                XCTAssertNotNil(ents)
                
                if let entities = entities.entities {
                    
                    XCTAssertTrue(entities.count > 0)
                    
                    var countryTypeFound = false
                    var cityTypeFound = false
                    var personTypeFound = false
                    
                    for entity in entities {
                        
                        XCTAssertNotNil(entity.type)
                        
                        let unwrappedType = entity.type!
                        
                        switch unwrappedType {
                        case "Country": countryTypeFound = true
                        case "City": cityTypeFound = true
                        case "Person" : personTypeFound = true
                        default: func nothing(){}; nothing()
                        }
                        
                    }
                    
                    XCTAssertTrue(countryTypeFound && cityTypeFound && personTypeFound)
                    
                    validExpectation.fulfill()
                    
                }
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testInvalidURLGetEntities() {
        
        let validExpectation = expectationWithDescription("valid")
        
        instance.getEntities(requestType: .URL,
            html: nil,
            url: "http://www.nooooooooooooooo.com/",
            text: nil) {
                
                (error, entities) in
                
                let ents = entities.entities
                
                XCTAssertNotNil(ents)
                
                if let entities = entities.entities {
                    
                    XCTAssertTrue(entities.count > 0)
                    
                    var countryTypeFound = false
                    var cityTypeFound = false
                    var personTypeFound = false
                    
                    for entity in entities {
                        
                        XCTAssertNotNil(entity.type)
                        
                        let unwrappedType = entity.type!
                        
                        switch unwrappedType {
                        case "Country": countryTypeFound = true
                        case "City": cityTypeFound = true
                        case "Person" : personTypeFound = true
                        default: func nothing(){}; nothing()
                        }
                        
                    }
                    
                    XCTAssertFalse(countryTypeFound || cityTypeFound)
                    
                    validExpectation.fulfill()
                    
                }
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testTextGetEntities() {
        
        let validExpectation = expectationWithDescription("valid")
        
        instance.getEntities(requestType: .Text,
            html: nil,
            url: nil,
            text: test_get_entities_text_valid) {
                
                (error, entities) in
                
                let ents = entities.entities
                
                XCTAssertNotNil(ents)
                
                if let entities = entities.entities {
                    
                    XCTAssertTrue(entities.count > 0)
                    
                    var countryTypeFound = false
                    var cityTypeFound = false
                    var personTypeFound = false
                    
                    for entity in entities {
                        
                        XCTAssertNotNil(entity.type)
                        
                        let unwrappedType = entity.type!
                        
                        switch unwrappedType {
                        case "Country": countryTypeFound = true
                        case "City": cityTypeFound = true
                        case "Person" : personTypeFound = true
                        default: func nothing(){}; nothing()
                        }
                        
                    }
                    
                    XCTAssertTrue(countryTypeFound && cityTypeFound && personTypeFound)
                    
                    validExpectation.fulfill()
                    
                }
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testInvalidTextGetEntities() {
        
        let invalidExpectation = expectationWithDescription("invalid")
        
        instance.getEntities(requestType: .Text,
            html: nil,
            url: nil,
            text: test_get_entities_text_invalid) {
                
                (error, entities) in
                
                XCTAssertNil(entities.entities)
                invalidExpectation.fulfill()
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testHTMLGetTextSentiment() {
        
        let validExpectation = expectationWithDescription("valid")
        
        let html = htmlDocumentFromURLString("http://en.wikipedia.org/wiki/Vladimir_Putin")
        
        instance.getSentiment(requestType: .HTML,
            html: html,
            url: nil,
            text: nil) {
                
                (error, sentiment) in
                
                XCTAssertNotNil(sentiment.docSentiment)
                
                if let docSentiment = sentiment.docSentiment {
                    
                    let sentimentMixed = docSentiment.mixed
                    let sentimentType = docSentiment.type
                    
                    XCTAssertEqual(sentimentMixed, "1")
                    XCTAssertEqual(sentimentType, "negative")
                    
                    validExpectation.fulfill()
                    
                }

        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testInvalidHTMLGetTextSentiment() {
        
        let invalidExpectation = expectationWithDescription("invalid")
        
        let html = htmlDocumentFromURLString("http://www.sentimentAnalysisDotComShouldNotExist.com")
        
        instance.getSentiment(requestType: .HTML,
            html: html,
            url: nil,
            text: nil) {
                
                (error, sentiment) in
                
                let language = sentiment.language
                
                XCTAssertEqual(language, "unknown")
                XCTAssertNil(sentiment.docSentiment)
                
                invalidExpectation.fulfill()
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testURLGetTextSentiment() {
    
        let validExpectation = expectationWithDescription("valid")
        
        instance.getSentiment(requestType: .URL,
            html: nil,
            url: "http://en.wikipedia.org/wiki/Vladimir_Putin",
            text: nil) {
                
                (error, sentiment) in
                
                XCTAssertNotNil(sentiment.docSentiment)
                
                if let docSentiment = sentiment.docSentiment {
                    
                    let sentimentMixed = docSentiment.mixed
                    let sentimentType = docSentiment.type
                    
                    XCTAssertEqual(sentimentMixed, "1")
                    XCTAssertEqual(sentimentType, "negative")
                    
                    validExpectation.fulfill()
                    
                }
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testInvalidURLGetTextSentiment() {
        
        let invalidExpectation = expectationWithDescription("invalid")
        
        instance.getSentiment(requestType: .URL,
            html: nil,
            url: "http://www.sentimentAnalysisDotComShouldNotExist.com",
            text: nil) {
                
                (error, sentiment) in
                
                let language = sentiment.language
                
                XCTAssertEqual(language, "unknown")
                XCTAssertNil(sentiment.docSentiment)
                
                invalidExpectation.fulfill()
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testTextGetTextSentiment() {
        
        let validExpectation = expectationWithDescription("valid")
        
        instance.getSentiment(requestType: .Text,
            html: nil,
            url: nil,
            text: test_get_entities_text_valid) {
                
                (error, sentiment) in
                
                XCTAssertNotNil(sentiment.docSentiment)
                
                if let docSentiment = sentiment.docSentiment {
                    
                    let sentimentMixed = docSentiment.mixed
                    let sentimentType = docSentiment.type
                    
                    XCTAssertEqual(sentimentMixed, "1")
                    XCTAssertEqual(sentimentType, "negative")
                    
                    validExpectation.fulfill()
                    
                }
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testInvalidTextGetTextSentiment() {
        
        let invalidExpectation = expectationWithDescription("invalid")
        
        instance.getSentiment(requestType: .Text,
            html: nil,
            url: nil,
            text: test_get_text_sentiment_invalid) {
                
                (error, sentiment) in
                
                let language = sentiment.language
                
                XCTAssertEqual(language, "unknown")
                XCTAssertNil(sentiment.docSentiment)
                
                invalidExpectation.fulfill()
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testHTMLGetTargetedSentiment() {
        
        let validExpectation = expectationWithDescription("valid")
        
        let html = htmlDocumentFromURLString("http://en.wikipedia.org/wiki/Vladimir_Putin")
        
        var parameters = AlchemyLanguage.GetSentimentParameters()
        
        parameters.targets = "Putin"
        
        instance.getSentiment(requestType: .HTML,
            html: html,
            url: nil,
            text: nil,
            sentimentType: AlchemyLanguageConstants.SentimentType.Targeted,
            sentimentParameters: parameters) {
                
                (error, sentiment) in
                
                XCTAssertNotNil(sentiment.docSentiment)
                
                if let docSentiment = sentiment.docSentiment {
                    
                    let sentimentMixed = docSentiment.mixed
                    let sentimentType = docSentiment.type
                    
                    XCTAssertEqual(sentimentMixed, "1")
                    XCTAssertEqual(sentimentType, "negative")
                    
                    validExpectation.fulfill()
                    
                }
                
        }
        
        waitForExpectationsWithTimeout(timeout, handler: { error in XCTAssertNil(error, "Timeout") })
        
    }
    
    func testInvalidHTMLGetTargetedSentiment() {
        
        
        
    }
    
    func testURLGetTargetedSentiment() {
        

        
    }
    
    func testInvalidURLGetTargetedSentiment() {
        
        
        
    }
    
    func testTextGetTargetedSentiment() {
        

        
    }
    
    func testInvalidTextGetTargetedSentiment() {
        
        
        
    }
    
    // MARK: Keyword Extraction
    
    // MARK: Concept Tagging
    
    // MARK: Relation Extraction
    
    // MARK: Taxonomy Classification
    
    // MARK: Author Extraction
    
    // MARK: Language Detection
    
    // MARK: Text Extraction
    
    // MARK: Microformats Parsing
    
    // MARK: Feed Detection
    func testHTMLGetAuthors() {
        

        
    }
    
    func testInvalidHTMLGetAuthors() {
        

        
    }
    
    func testURLGetAuthors() {
        
        
        
    }
    
    func testInvalidURLGetAuthors() {
        
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
