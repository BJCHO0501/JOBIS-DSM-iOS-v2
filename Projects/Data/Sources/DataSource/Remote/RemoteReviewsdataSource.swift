import RxSwift
import Domain

protocol RemoteReviewsdataSource{
    func fetchReviewDetail(id: String) -> Single<[QnaEntity]>
    func fetchReviewList(id: String) -> Single<[ReviewEntity]>
    func postReview(req: PostReviewRequestQuery) -> Completable
}

final class RemoteReviewsdataSourceImpl: RemoteBaseDataSource<ReviewsAPI>, RemoteReviewsdataSource {
    func fetchReviewDetail(id: String) -> Single<[QnaEntity]> {
        request(.fetchReviewDetail(id: id))
            .map(ReviewDetailResponseDTO.self)
            .map { $0.toDomain()}
    }

    func fetchReviewList(id: String) -> Single<[ReviewEntity]> {
        request(.fetchReviewList(id: id))
            .map(ReviewListResponseDTO.self)
            .map { $0.toDomain() }
    }

    func postReview(req: PostReviewRequestQuery) -> Completable {
        request(.postReview(req))
            .asCompletable()
    }
}
