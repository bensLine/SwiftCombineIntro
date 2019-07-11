/*:
 # Publisher
 ### Defines how values and errors are produced
 ### Value type
 ### Allows registration of a Subscriber
 */
import Combine

protocol Publisher {
    associatedtype Output
    associatedtype Failure: Error

    func subscribe<S: Subscriber>(_ subscriber: S)
        where S.Input == Output, S.Failure == Failure
}
/*:
 [⬅️ Back](@previous)    [Next ➡️](@next)
 ___
 Source: [Introducing Combine](https://developer.apple.com/videos/play/wwdc2019/722/)
 */
