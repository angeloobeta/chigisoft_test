// base url
const String baseUrl = "https://phplaravel-779602-2789902.cloudwaysapps.com/";

// authentication urls
const String registerUrl = baseUrl + "api/register";
const String loginUrl = baseUrl + "api/login";
String loginUserUrl = '/api/v1/auth/sign-in';
const String logoutUrl = baseUrl + "api/logout";
const String verifyPhoneNumberUrl = baseUrl + "api/verify-phone-number";
const String sendOtpUrl = baseUrl + "api/user/send-otp";
const String verifyOtpUrl = baseUrl + "api/user/verify-otp";
const String forgotPasswordUrl = baseUrl + "api/forgot-password";
const String changePasswordUrl = baseUrl + "api/change-password";
const String photoUrl = baseUrl + "storage/";
const String sendOtpWithoutTokenUrl = baseUrl + "api/send-otp";
const String veriftyOtpWithoutTokenUrl = baseUrl + "api/verify-otp";
const String loginWithFaceIdUrl = baseUrl + "api/login-face-id";

//verify identity url
const String verifyBvnUrl = baseUrl + "api/user/verify-bvn";
const String sendOtpToBvnPhoneUrl = baseUrl + "api/user/send-otp";
const String verifyBvnPhoneUrl = baseUrl + "api/user/verify-otp";
const String uploadSelfieUrl = baseUrl + "api/user/upload-selfie";
const String createPasswordAndPinUrl = baseUrl + "api/user/secure-account";

// circle api url
const String createCircleUrl = baseUrl + "api/circle/create";
const String joinCircleUrl = baseUrl + "api/circle/join";
const String allCircleUrl = baseUrl + "api/circle";
const String circleCategoryUrl = baseUrl + "api/circle/category";
const String rateUrl = baseUrl + "api/payment/get-roi";
const String topUpUrl = baseUrl + "api/circle/topup";
const String circleHistoryUrl = baseUrl + "api/circle/transaction-history";
const String getCircleByCategoryUrl = baseUrl + "api/circle/cat-circle/";
const String getUserCircleUrl = baseUrl + "api/circle/user";
const String getFxCircleUrl = baseUrl + "api/circle/fx-circle";
const String reportCircleUrl = baseUrl + "api/report-circle";
const String exitCircleUrl = baseUrl + "api/circle/exit-circle";
const String requestJoinCirclePermissionUrl =
    baseUrl + "api/circle/requestPermission";
const String fetchSingleCircleUrl = baseUrl + "api/circle/single-circle/";
const String profileDataUrl = baseUrl + "api/user/get-user-info/";

// circle permission
const String requestCirclePermissionUrl =
    baseUrl + "api/circle/requestPermission";

// fx circle api
const String fxExchangeUSDUrl = baseUrl + 'api/deposit/fx-rate/USD';
const String convertFxToNairaUrl = baseUrl + "api/payment/convert-fx";
const String liquidateFxtToNairaUrl = baseUrl + "api/payment/liquidate-Fx";

// wallet api url
const String walletBalanceUrl = baseUrl + "api/payment/wallet-balance";
const String walletBalanceUSDUrl = baseUrl + "api/payment/wallet-usd-balance";
const String topUpWalletUrl = baseUrl + "api/payment/add-to-wallet";
const String autoDepositUrl = baseUrl + "api/payment/auto-deposit";
const String walletWithdrawalUrl = baseUrl + "api/payment/withdraw-from-wallet";
const String walletBankListUrl = baseUrl + "api/payment/bank-list";

// user api url
const String userDataUrl = baseUrl + "api/user";
const String homeInfoUrl = baseUrl + "api/user/home";
const String homePageHistoryUrl = baseUrl + "api/payment/transaction-history";

// security url
const String checkPinUrl = baseUrl + "api/security/check-pin";

// payment url
const String getVirtualAccountUrl = baseUrl + "api/payment/virtual-account";
const String ussdPaymentUrl = baseUrl + "api/payment/fund-wallet-ussd";
const String ussdBankListUrl = baseUrl + "api/payment/ussd/get-bank-list";
const String beneficiaryListUrl = baseUrl + "api/user/get-beneficary";
const String beneficiaryListSearchUrl = baseUrl + "api/user/get-beneficary/";
const String nairaTransferUrl = baseUrl + "api/payment/transfer/ng";
const String usdTransferUrl = baseUrl + "api/payment/transfer/usd";

// flutter wave url
const String flutterWaveBaseUrl = "https://api.flutterwave.com/";
const String listOfBankUrl = baseUrl + "api/payment/bank-list";

// url for bank api
const String userBankAccountListUrl = baseUrl + "api/user/get-bank-accounts";
const String userBankAccountNameUrl =
    baseUrl + "api/payment/get-bank-account-name";
const String addBankUrl = baseUrl + "api/user/save-bank-account";

// profile page url
const String privacyManagementUrl =
    baseUrl + "api/user/change-privacy-settings";
const String profilePrivacyUrl = baseUrl + "api/user/update-profile-status";
const String referralStatsUrl = baseUrl + "api/user/referralStats";
const String userPasswordUrl = baseUrl + "api/user/change-password";

// pin management url
const String changePinUrl = baseUrl + "api/user/change-pin";
const String resetPinUrl = baseUrl + "api/reset/pin";
const String sendResetPinOtpUrl = baseUrl + "api/reset/send-otp";
const String validateResetPinOtpUrl = baseUrl + "api/reset/verify-otp";
// preference url
const String addBioUrl = baseUrl + "api/user/add-bio";
const String faceIdUrl = baseUrl + "api/user/set-face-id";
const String privacyModeUrl = baseUrl + "api/user/change-privacy-settings";
const String socialMediaUrl = baseUrl + "api/user/add-socials";

// chats url
const String allCircleChatListUrl = baseUrl + "api/chat/get-circle-chats";
const String privateChatListUrl = baseUrl + "api/chat/get-private-chats";
const String createNewPrivateChatUrl = baseUrl + "api/chat/create-private-chat";
const String sendChatMessageUrl = baseUrl + "api/chat/send-message";
const String singleChatAndMessagesUrl = baseUrl + "api/chat/get-chat-messages/";
const String singleCircleChatAndMessageUrl =
    baseUrl + "api/chat/get-circle-chat-messages/";

// notification url
const String homePageNotificationUrl = baseUrl + "api/user/notifications";
const String notificationAsReadUrl =
    baseUrl + "api/user/notifications/mark-as-read/";

// socket url
const String socketUrl = 'https://mycircle-chat-server.onrender.com/';

// investment url
const String allActiveInvestmentUrl = baseUrl + "api/investments";
const String singleActiveInvestmentUrl =
    baseUrl + "api/investment/single-investment/";
const String joinInvestmentUrl = baseUrl + "api/investment/join-investment";
const String topUpInvestmentUrl = baseUrl + "api/investment/topup";
const String liquidateInvestmentUrl =
    baseUrl + "api/investment/joined-investment/liquidate";
const String myActiveInvestmentUrl =
    baseUrl + "api/investment/joined-investments";
const String mySingleActiveInvestmentUrl =
    baseUrl + "api/investment/joined-investment/";
