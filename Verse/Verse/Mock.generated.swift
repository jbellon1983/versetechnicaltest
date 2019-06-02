// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//swiftlint:disable force_cast
//swiftlint:disable function_body_length
//swiftlint:disable line_length
//swiftlint:disable vertical_whitespace

#if MockyCustom
import SwiftyMocky
import RxSwift
import RxCocoa
@testable import Verse

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
import RxSwift
import RxCocoa
@testable import Verse

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif


// MARK: - MovieListViewModelProtocol
open class MovieListViewModelProtocolMock: MovieListViewModelProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var searchText: BehaviorRelay<String> {
		get {	invocations.append(.p_searchText_get); return __p_searchText ?? givenGetterValue(.p_searchText_get, "MovieListViewModelProtocolMock - stub value for searchText was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_searchText = newValue }
	}
	private var __p_searchText: (BehaviorRelay<String>)?

    public var movies: BehaviorRelay<[Movie]> {
		get {	invocations.append(.p_movies_get); return __p_movies ?? givenGetterValue(.p_movies_get, "MovieListViewModelProtocolMock - stub value for movies was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_movies = newValue }
	}
	private var __p_movies: (BehaviorRelay<[Movie]>)?





    open func loadNewSearchMovies(query: String) {
        addInvocation(.m_loadNewSearchMovies__query_query(Parameter<String>.value(`query`)))
		let perform = methodPerformValue(.m_loadNewSearchMovies__query_query(Parameter<String>.value(`query`))) as? (String) -> Void
		perform?(`query`)
    }

    open func loadMoreMovies() {
        addInvocation(.m_loadMoreMovies)
		let perform = methodPerformValue(.m_loadMoreMovies) as? () -> Void
		perform?()
    }

    open func resetMovies() {
        addInvocation(.m_resetMovies)
		let perform = methodPerformValue(.m_resetMovies) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_loadNewSearchMovies__query_query(Parameter<String>)
        case m_loadMoreMovies
        case m_resetMovies
        case p_searchText_get
        case p_movies_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_loadNewSearchMovies__query_query(let lhsQuery), .m_loadNewSearchMovies__query_query(let rhsQuery)):
                guard Parameter.compare(lhs: lhsQuery, rhs: rhsQuery, with: matcher) else { return false } 
                return true 
            case (.m_loadMoreMovies, .m_loadMoreMovies):
                return true 
            case (.m_resetMovies, .m_resetMovies):
                return true 
            case (.p_searchText_get,.p_searchText_get): return true
            case (.p_movies_get,.p_movies_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_loadNewSearchMovies__query_query(p0): return p0.intValue
            case .m_loadMoreMovies: return 0
            case .m_resetMovies: return 0
            case .p_searchText_get: return 0
            case .p_movies_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func searchText(getter defaultValue: BehaviorRelay<String>...) -> PropertyStub {
            return Given(method: .p_searchText_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func movies(getter defaultValue: BehaviorRelay<[Movie]>...) -> PropertyStub {
            return Given(method: .p_movies_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func loadNewSearchMovies(query: Parameter<String>) -> Verify { return Verify(method: .m_loadNewSearchMovies__query_query(`query`))}
        public static func loadMoreMovies() -> Verify { return Verify(method: .m_loadMoreMovies)}
        public static func resetMovies() -> Verify { return Verify(method: .m_resetMovies)}
        public static var searchText: Verify { return Verify(method: .p_searchText_get) }
        public static var movies: Verify { return Verify(method: .p_movies_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func loadNewSearchMovies(query: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_loadNewSearchMovies__query_query(`query`), performs: perform)
        }
        public static func loadMoreMovies(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_loadMoreMovies, performs: perform)
        }
        public static func resetMovies(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_resetMovies, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - MovieProfileViewModelProtocol
open class MovieProfileViewModelProtocolMock: MovieProfileViewModelProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var movie: Movie {
		get {	invocations.append(.p_movie_get); return __p_movie ?? givenGetterValue(.p_movie_get, "MovieProfileViewModelProtocolMock - stub value for movie was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_movie = newValue }
	}
	private var __p_movie: (Movie)?






    fileprivate enum MethodType {
        case p_movie_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_movie_get,.p_movie_get): return true
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_movie_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func movie(getter defaultValue: Movie...) -> PropertyStub {
            return Given(method: .p_movie_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var movie: Verify { return Verify(method: .p_movie_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - MovieProviderProtocol
open class MovieProviderProtocolMock: MovieProviderProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func getMovies(query: String, page: Int, onSuccess: @escaping (([Movie]) -> Void), onError: @escaping (() -> Void) ) {
        addInvocation(.m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(Parameter<String>.value(`query`), Parameter<Int>.value(`page`), Parameter<([Movie]) -> Void>.value(`onSuccess`), Parameter<() -> Void>.value(`onError`)))
		let perform = methodPerformValue(.m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(Parameter<String>.value(`query`), Parameter<Int>.value(`page`), Parameter<([Movie]) -> Void>.value(`onSuccess`), Parameter<() -> Void>.value(`onError`))) as? (String, Int, @escaping (([Movie]) -> Void), @escaping (() -> Void)) -> Void
		perform?(`query`, `page`, `onSuccess`, `onError`)
    }


    fileprivate enum MethodType {
        case m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(Parameter<String>, Parameter<Int>, Parameter<([Movie]) -> Void>, Parameter<() -> Void>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(let lhsQuery, let lhsPage, let lhsOnsuccess, let lhsOnerror), .m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(let rhsQuery, let rhsPage, let rhsOnsuccess, let rhsOnerror)):
                guard Parameter.compare(lhs: lhsQuery, rhs: rhsQuery, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPage, rhs: rhsPage, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOnsuccess, rhs: rhsOnsuccess, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOnerror, rhs: rhsOnerror, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(p0, p1, p2, p3): return p0.intValue + p1.intValue + p2.intValue + p3.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getMovies(query: Parameter<String>, page: Parameter<Int>, onSuccess: Parameter<([Movie]) -> Void>, onError: Parameter<() -> Void>) -> Verify { return Verify(method: .m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(`query`, `page`, `onSuccess`, `onError`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getMovies(query: Parameter<String>, page: Parameter<Int>, onSuccess: Parameter<([Movie]) -> Void>, onError: Parameter<() -> Void>, perform: @escaping (String, Int, @escaping (([Movie]) -> Void), @escaping (() -> Void)) -> Void) -> Perform {
            return Perform(method: .m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(`query`, `page`, `onSuccess`, `onError`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - MovieServiceProtocol
open class MovieServiceProtocolMock: MovieServiceProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func getMovies(query: String, page: Int, onSuccess: @escaping (([MovieDto]) -> Void), onError: @escaping (() -> Void) ) {
        addInvocation(.m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(Parameter<String>.value(`query`), Parameter<Int>.value(`page`), Parameter<([MovieDto]) -> Void>.value(`onSuccess`), Parameter<() -> Void>.value(`onError`)))
		let perform = methodPerformValue(.m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(Parameter<String>.value(`query`), Parameter<Int>.value(`page`), Parameter<([MovieDto]) -> Void>.value(`onSuccess`), Parameter<() -> Void>.value(`onError`))) as? (String, Int, @escaping (([MovieDto]) -> Void), @escaping (() -> Void)) -> Void
		perform?(`query`, `page`, `onSuccess`, `onError`)
    }


    fileprivate enum MethodType {
        case m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(Parameter<String>, Parameter<Int>, Parameter<([MovieDto]) -> Void>, Parameter<() -> Void>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(let lhsQuery, let lhsPage, let lhsOnsuccess, let lhsOnerror), .m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(let rhsQuery, let rhsPage, let rhsOnsuccess, let rhsOnerror)):
                guard Parameter.compare(lhs: lhsQuery, rhs: rhsQuery, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPage, rhs: rhsPage, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOnsuccess, rhs: rhsOnsuccess, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOnerror, rhs: rhsOnerror, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(p0, p1, p2, p3): return p0.intValue + p1.intValue + p2.intValue + p3.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getMovies(query: Parameter<String>, page: Parameter<Int>, onSuccess: Parameter<([MovieDto]) -> Void>, onError: Parameter<() -> Void>) -> Verify { return Verify(method: .m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(`query`, `page`, `onSuccess`, `onError`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getMovies(query: Parameter<String>, page: Parameter<Int>, onSuccess: Parameter<([MovieDto]) -> Void>, onError: Parameter<() -> Void>, perform: @escaping (String, Int, @escaping (([MovieDto]) -> Void), @escaping (() -> Void)) -> Void) -> Perform {
            return Perform(method: .m_getMovies__query_querypage_pageonSuccess_onSuccessonError_onError(`query`, `page`, `onSuccess`, `onError`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

