import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';

class SignUpPageThreeScreen extends StatelessWidget {
  const SignUpPageThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 42.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 32.h, right: 41.h, bottom: 27.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 7.v),
                                                  child: Text("Káon",
                                                      style: theme.textTheme
                                                          .displayMedium)),
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgClose,
                                                  height: 20.adaptSize,
                                                  width: 20.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      left: 86.h, bottom: 47.v),
                                                  onTap: () {
                                                    onTapCloseTermsAndConditions(
                                                        context);
                                                  })
                                            ])),
                                    SizedBox(height: 21.v),
                                    Text("Terms and Conditions",
                                        style: theme.textTheme.headlineSmall),
                                    SizedBox(height: 20.v),
                                    Container(
                                        width: 306.h,
                                        margin: EdgeInsets.only(right: 9.h),
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "Please read these terms and conditions carefully before using our Services. \n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text: "INTERPRETATION\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "\nThe words of which the initial letter is capitalize have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural. \n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text: "ACKNOWLEDGEMENT\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "\nThese are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.\n\nYour access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.\n\nBy accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.\n\nYou represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.\n\nYour access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text:
                                                      "LINKS TO OTHER WEBSITES\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.\n\nThe Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.\n\nWe strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text: "TERMINATION\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "\nWe may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.\n\nUpon termination, Your right to use the Service will cease immediately.\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text:
                                                      "LIMITATION OF LIABILITY\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven't purchased anything through the Service.\n\nTo the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.\n\nSome states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party's liability will be limited to the greatest extent permitted by law.\n\nWithout limiting the foregoing, neither the Company nor any of the company's provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, time bombs or other harmful components.\n\nSome jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text: "GOVERNING LAW\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text:
                                                      "DISPUTES RESOLUTIONS\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text:
                                                      "For European Union (EU) Users\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "\nIf You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text:
                                                      "Changes to These Terms and Conditions\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600),
                                              TextSpan(
                                                  text:
                                                      "We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.\n\nBy continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.\n\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600_1),
                                              TextSpan(
                                                  text:
                                                      "Contact Us\n\nIf you have any questions about these Terms and Conditions, You can contact us:\n\nBy email: sprawl_talk.0j@icloud.com\n",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratGray600)
                                            ]),
                                            textAlign: TextAlign.justify))
                                  ]))))
                ]))));
  }

  /// Navigates to the signUpPageTwoScreen when the action is triggered.
  onTapCloseTermsAndConditions(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpPageTwoScreen);
  }
}
