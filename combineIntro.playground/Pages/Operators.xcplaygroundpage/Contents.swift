/*:
 # Operator
 ### - Adopts Publisher
 ### - Describes a behavior for changing values
 ### - Subscribes to a Publisher (“upstream”)
 ### - Sends result to a Subscriber (“downstream”)
 ### - Value type
 */
extension Publishers {
    struct Map<Upstream: Publisher, Output>: Publisher {
        typealias Failure = Upstream.Failure

        let upstream: Upstream
        let transform: (Upstream.Output) -> Output
    }
}
/*:
 [⬅️ Back](@previous)    [Next ➡️](@next)
 ___
 Source: [Introducing Combine](https://developer.apple.com/videos/play/wwdc2019/722/)
 */
