/*:
 # Subscriber
 ### Receives values and a completion
 ### Reference type
*/
import Combine

protocol Subscriber {
    associatedtype Input
    associatedtype Failure: Error

    func receive(subscription: Subscription)
    func receive(_ input: Input) -> Subscribers.Demand
    func receive(completion: Subscribers.Completion<Failure>)
}
/*:
 [⬅️ Back](@previous)    [Next ➡️](@next)
 ___
 Source: [Introducing Combine](https://developer.apple.com/videos/play/wwdc2019/722/)
 */
