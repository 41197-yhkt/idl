// idl/user.thrift
namespace go user

// User
struct User {
    1: required i64 id              // 用户 id
    2: required string name         // 昵称
    3: optional i64 follow_count    // 关注总数
    4: optional i64 follower_count  // 粉丝总数
    5: required bool is_follow      // true-已关注，false-未关注
}

// BaseResp
struct BaseResp {
    1: required i32 status_code     // 状态码，0-成功，其他值-失败
    2: optional string status_msg   // 状态描述
}

// User Register Request
struct UserRegisterRequest {
    1: required string username     // 用户名，最长32个字符
    2: required string password     // 密码，最长32个字符
}

// User Register Response
struct UserRegisterResponse {
    1: required BaseResp base_resp
    2: required i64 user_id         // 用户 id
    3: required string token        // 用户鉴权 token
}

// User Login Request
struct UserLoginRequest {
    1: required string username     // 登录用户名
    2: required string password     // 登录密码
}

// User Login Response
struct UserLoginResponse {
    1: required BaseResp base_resp
    2: required i64 user_id         // 用户 id
    3: required string token        // 用户鉴权 token
}

// User Info Request
struct UserInfoRequest {
    1: required i64 user_id         // 用户 id
    2: required string token        // 用户鉴权 token
}

// User Info Response
struct UserInfoResponse {
    1: required BaseResp base_resp
    2: required User user           // 用户信息
}

// User Follow Request, Update User Relation
struct UserFollowRequest {
    1: required i64 follow_from;
    2: required i64 follow_to;
}

// User Follow Response, Update User Relation
struct UserFollowResponse {
    1: required BaseResp base_resp;
}

// User Follow Request, Update User Relation
struct UserUnfollowRequest {
    1: required i64 follow_from;
    2: required i64 follow_to;
}

// User Follow Response, Update User Relation
struct UserUnfollowResponse {
    1: required BaseResp base_resp;
}

service UserService {
    // 用户注册
    UserRegisterResponse UserRegister(1: UserRegisterRequest req)
    // 用户登陆
    UserLoginResponse UserLogin(1: UserLoginRequest req)
    // 获取用户信息
    UserInfoResponse UserInfo(1: UserInfoResponse req)
    // 用户关注，用户点击关注的时候，维护用户的信息
    UserFollowResponse UserFollow(1: UserFollowRequest req)
    // 用户取消关注，用户点击取消关注的时候，维护用户的信息
    UserFollowResponse UserUnfollow(1: UserFollowRequest req)
}