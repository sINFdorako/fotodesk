import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/domain/usecases/get_countryflag_based_on_country_code.dart';
import 'package:fotodesk/core/features/ui/presentation/cubit/ui_cubit.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/global_font_size.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PhoneNumberInput extends StatefulWidget {
  final bool isMobilePhone;
  final TextEditingController countryCodeController;
  final TextEditingController controller;
  final String hintText;
  final IconData iconData;

  const PhoneNumberInput({
    Key? key,
    required this.controller,
    required this.isMobilePhone,
    this.hintText = '',
    required this.iconData,
    required this.countryCodeController,
  }) : super(key: key);

  @override
  PhoneNumberInputState createState() => PhoneNumberInputState();
}

class PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  void initState() {
    super.initState();
    widget.isMobilePhone == true
        ? widget.countryCodeController
            .addListener(_onCountryCodeChangedMobilePhone)
        : widget.countryCodeController
            .addListener(_onCountryCodeChangedLandline);
  }

  _onCountryCodeChangedMobilePhone() {
    context.read<UiCubit>().updateCountryCodeMobilePhone(
        int.tryParse(widget.countryCodeController.text.trim()) ?? 0);
  }

  _onCountryCodeChangedLandline() {
    context.read<UiCubit>().updateCountryCodeLandLine(
        int.tryParse(widget.countryCodeController.text.trim()) ?? 0);
  }

  @override
  void dispose() {
    widget.countryCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiCubit, UiState>(
      builder: (context, state) {
        String flagUrl = widget.isMobilePhone
            ? getFlagUrlFromDialCode(state.countryCodeMobilePhone)
            : getFlagUrlFromDialCode(state.countryCodeLandline);
        return ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 110.w,
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 35,
                      child: flagUrl != ''
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.network(
                                  flagUrl,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 35,
                                  height: 30,
                                  // Adjust opacity as needed
                                ),
                              ],
                            )
                          : const Icon(Icons.map_outlined),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextField(
                          controller: widget.countryCodeController,
                          keyboardType: TextInputType.number,
                          decoration: getInputDecoration(
                              context: context, iconData: Icons.add)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: TextField(
                      controller: widget.controller,
                      keyboardType: TextInputType.number,
                      decoration: getInputDecoration(
                          context: context, hintText: widget.hintText)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InputDecoration getInputDecoration({
    required BuildContext context,
    String? hintText,
    IconData? iconData,
  }) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 13.w, horizontal: 10.w),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontUtil.hint,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
      ),
      hintText: hintText,
      prefixIcon: iconData != null
          ? Icon(
              iconData,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2.w,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
        ),
      ),
    );
  }
}
