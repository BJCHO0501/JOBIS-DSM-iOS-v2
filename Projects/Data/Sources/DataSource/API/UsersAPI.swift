import Moya
import Domain
import AppNetwork

enum UsersAPI {
    case signin(SigninRequestQuery)
}

extension UsersAPI: JobisAPI {
    typealias ErrorType = JobisError

    var domain: JobisDomain {
        .users
    }

    var urlPath: String {
        switch self {
        case .signin:
            return "/login"
        }
    }

    var method: Method {
        switch self {
        case .signin:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .signin(req):
            return .requestJSONEncodable(req)
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .signin:
            return [:]
        }
    }
}
