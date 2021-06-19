import DroidKaigiMPP

public struct DIContainer {
    let koin: Koin_coreKoin

    public init(authenticator: Authenticator) {
        let koinApplication = IosModuleKt.doInitKoin(authenticator: authenticator)
        self.koin = koinApplication.koin
    }

    public func get<TypeProtocol, ReturnType>(type: TypeProtocol) -> ReturnType where TypeProtocol: Protocol {
        guard let object = koin.get(objCProtocol: type) as? ReturnType else { fatalError("Not found instance for \(type)") }
        return object
    }
}
