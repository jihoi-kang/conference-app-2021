import DroidKaigiMPP

public struct Contributor: Equatable, Identifiable {
    public var id: String
    public var imageURLString: String
    public var name: String
    public var urlString: String

    public init(
        id: String,
        imageURLString: String,
        name: String,
        urlString: String
    ) {
        self.id = id
        self.imageURLString = imageURLString
        self.name = name
        self.urlString = urlString
    }

    public init(from model: DroidKaigiMPP.Contributor) {
        self.id = model.id
        self.imageURLString = model.image
        self.name = model.name
        self.urlString = model.url
    }
}

#if DEBUG
public extension Contributor {
    static func mock(
        id: String = UUID().uuidString,
        imageURLString: String = "https://example.com",
        name: String = "dummy name",
        urlString: String = "https://github.com"
    ) -> Self {
        .init(
            id: id,
            imageURLString: imageURLString,
            name: name,
            urlString: urlString
        )
    }
}

#endif
