import Model
import SwiftUI
import Styleguide

public struct SmallCard: View {
    enum Const {
        static let margin: CGFloat = 8
        static let cardWidth = (UIScreen.main.bounds.width - Const.margin) / 2
        static let imageViewWidth = Const.cardWidth - (Const.margin * 2) - (ImageView.Const.roundedLineWidth * 2)
    }

    private let title: String
    private let imageURL: URL?
    private let media: Media
    private let date: Date
    private let isFavorited: Bool
    private let tapAction: () -> Void
    private let tapFavoriteAction: () -> Void

    public init(
        title: String,
        imageURL: URL?,
        media: Media,
        date: Date,
        isFavorited: Bool,
        tapAction: @escaping () -> Void,
        tapFavoriteAction: @escaping () -> Void
    ) {
        self.title = title
        self.imageURL = imageURL
        self.media = media
        self.date = date
        self.isFavorited = isFavorited
        self.tapAction = tapAction
        self.tapFavoriteAction = tapFavoriteAction
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ImageView(
                imageURL: imageURL,
                placeholder: .noImage,
                placeholderSize: .small,
                width: Const.imageViewWidth,
                height: Const.imageViewWidth * 114/163
            )

            VStack(alignment: .leading, spacing: 12) {
                Group {
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(AssetColor.Base.primary.color)
                        .lineLimit(3)
                        .frame(maxHeight: .infinity, alignment: .top)

                    Spacer(minLength: 4)

                    Text(date.formatted)
                        .font(.caption)
                        .foregroundColor(AssetColor.Base.tertiary.color)
                }

                HStack(spacing: 8) {
                    Tag(media: media)

                    Spacer()

                    Button(action: tapFavoriteAction, label: {
                        let image = isFavorited ? AssetImage.iconFavorite.image : AssetImage.iconFavoriteOff.image
                        image
                            .renderingMode(.template)
                            .foregroundColor(AssetColor.primary.color)
                    })
                }
            }
        }
        .background(Color.clear)
        .onTapGesture(perform: tapAction)
        .padding(Const.margin)
    }
}

public struct SmallCard_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                SmallCard(
                    title: "タイトルタイトルタイトルタイトルタイタイトルタイトルタイトルタイトルタイト...",
                    imageURL: URL(string: ""),
                    media: .droidKaigiFm,
                    date: Date(timeIntervalSince1970: 0),
                    isFavorited: false,
                    tapAction: {},
                    tapFavoriteAction: {}
                )
                .frame(width: 179, height: 278)
                .background(AssetColor.Background.primary.color)
                .previewDevice(.init(rawValue: "iPhone X"))
                .environment(\.colorScheme, colorScheme)

                SmallCard(
                    title: "タイトルタイトルタイトルタイトルタイタイトルタイトルタイトルタイトルタイト...",
                    imageURL: URL(string: ""),
                    media: .medium,
                    date: Date(timeIntervalSince1970: 0),
                    isFavorited: true,
                    tapAction: {},
                    tapFavoriteAction: {}
                )
                .frame(width: 179, height: 278)
                .background(AssetColor.Background.primary.color)
                .previewDevice(.init(rawValue: "iPhone X"))
                .environment(\.colorScheme, colorScheme)

                SmallCard(
                    title: "タイトル",
                    imageURL: URL(string: ""),
                    media: .youtube,
                    date: Date(timeIntervalSince1970: 0),
                    isFavorited: true,
                    tapAction: {},
                    tapFavoriteAction: {}
                )
                .frame(width: 179, height: 278)
                .background(AssetColor.Background.primary.color)
                .previewDevice(.init(rawValue: "iPhone X"))
                .environment(\.colorScheme, colorScheme)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
