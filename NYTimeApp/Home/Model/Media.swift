

import Foundation
struct Media : Codable,Equatable {
	let type : String?
	let media_metadata : [Media_metadata]?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case media_metadata = "media-metadata"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		media_metadata = try values.decodeIfPresent([Media_metadata].self, forKey: .media_metadata)
	}

}
