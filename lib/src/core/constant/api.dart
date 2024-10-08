const baseUrl = "https://nowdots-news.opwarnet.my.id";
const baseUrlApi = "${baseUrl}/api/v1";

//login
const loginApi = "${baseUrlApi}/login";

const logoutApi = "${baseUrlApi}/users/logout";

//register
const createAccountApi = "$baseUrlApi/create-account";
const registerVerificationCodeApi = "$baseUrlApi/verifycation-code";
const registerSetPasswordApi = "$baseUrlApi/set-password";
const registerSetProfilePictureApi = "$baseUrlApi/set-profile-picture";
const registerSetUsernameApi = "$baseUrlApi/set-username";

//forgot password
const forgotPasswordApi = "$baseUrlApi/forgot-password";
const forgotVerificationCodeApi = "$baseUrlApi/verif-forgot-password";
const forgotPasswordSetNewPasswordApi = "$baseUrlApi/set-new-password";

//feeds
const nowdotsAllFeedApi = "$baseUrlApi/feeds/nowdots";
const nowdotsFollowingFeedApi = "$baseUrlApi/feeds/nowdots/followed";

const nowhypeAllFeedApi = "$baseUrlApi/feeds/nowhype";
const nowhypeFollowingFeedApi = "$baseUrlApi/feeds/nowhype/followed";

const nowsportsAllFeedApi = "$baseUrlApi/feeds/nowsports";
const nowsportsFollowingFeedApi = "$baseUrlApi/feeds/nowsports/followed";

const nowplayAllFeedApi = "$baseUrlApi/feeds/nowplay";
const nowplayFollowingFeedApi = "$baseUrlApi/feeds/nowplay/followed";

const nowfoodieAllFeedApi = "$baseUrlApi/feeds/nowfoodie";
const nowfoodieFollowingFeedApi = "$baseUrlApi/feeds/nowfoodie/followed";

const nowherAllFeedApi = "$baseUrlApi/feeds/nowher";
const nowherFollowingFeedApi = "$baseUrlApi/feeds/nowher/followed";

String reactionFeedApi(String feedId) {
  return "$baseUrlApi/feeds/$feedId/like";
}

String reactionDislikeFeedApi(String feedId) {
  return "$baseUrlApi/feeds/$feedId/dislike";
}
