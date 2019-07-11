/*:
 # Subject
 ### A publisher that exposes a method for outside callers to publish elements.
 */
import Combine

public protocol Subject : AnyObject, Publisher {

    func send(_ value: Self.Output)
    func send(completion: Subscribers.Completion<Self.Failure>)
}
/*:
 Source: [Introducing Combine](https://developer.apple.com/videos/play/wwdc2019/722/)
 ___
*/
/*:
 ### Swift provides two implementations
 - `PassthroughSubject`
 - `CurrentValueSubject`

 */
let passthroughSubject = PassthroughSubject<String, Never>()

let passthroughSubscription = passthroughSubject.sink {
    print("passthroughSubject: \($0)")
}

passthroughSubject.send("Turtle Rock")
/*:
 -----
 */
let currentValueSubject = CurrentValueSubject<String, Never>("initialValue")

let currentValueSubscription = currentValueSubject.sink {
    print("currentValueSubject: \($0)")
}

currentValueSubject.send("Turtle Rock")


print("currentValueSubject: \(currentValueSubject.value)^2")
currentValueSubject.value = "Black Valley"
/*:
 [⬅️ Back](@previous)    [Next ➡️](@next)
 */
