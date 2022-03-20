import 'package:epump/model/login_resp.dart';
import 'package:epump/module/auth/viewModel/login_vm.dart';
import 'package:epump/widget/view_more.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widget/current_balance.dart';
import '../../widget/wallet_card.dart';

class DPage extends StatelessWidget {
  const DPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userName;
    parseAuthData(LoginViewModel loginViewModel) {
      try {
        if (loginViewModel.userLoginTag != null) {
          final userData = UserLoginResp.fromJson(loginViewModel.userLoginTag);
          userName = userData.fullName ?? '';
        }
      } catch (e) {
        if (kDebugMode) {
          print('Server Auth Error');
        }
      }
    }

    var size = MediaQuery.of(context).size;
    List<dynamic> transactionList = [
      '+ 3,000',
      '- 2,700',
      '+ 4,000',
      '+ 1,290',
      '- 8,570 '
    ];
    return Consumer<LoginViewModel>(builder: (context, loginViewModel, child) {
      parseAuthData(loginViewModel);
      return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 20),
            child: Text(
              'Wallet',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500, fontSize: 28.sp),
            ),
          ),
          WalletCard(
            cardName: userName,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          BalanceCurrent(
            currentBalance: '200,000',
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          ViewMore(
            onTap: () {},
          ),
          Column(
              children: transactionList
                  .asMap()
                  .entries
                  .map(
                    (e) => TransactionContainer(amount: e.value),
                  )
                  .toList())
        ],
      );
    });
  }
}

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({
    Key key,
    this.amount,
  }) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(
        //   color: Colors.grey.withOpacity(0.14),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            PhosphorIcons.bandaids_light,
            size: 18,
          ),
          Text(
            'Fund Your Account',
            style: GoogleFonts.nunito(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          Text(
            amount ?? '',
            style: GoogleFonts.nunito(
                fontSize: 10.sp, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
