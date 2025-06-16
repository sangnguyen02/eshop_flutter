import 'package:eshop/utils/constants/text_strings.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:eshop/utils/snackbar/snackbar_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/styles/spacing_style.dart';
import '../../../../providers/features/auth/auth_provider.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(signUpViewModelProvider);
    final formKey = GlobalKey<FormState>();
    final dark = EshopHelperFunctions.isDarkMode(context);


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EshopSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(EshopTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: EshopSizes.spaceBtwSections),

              /// Form
              Form(
                child: Column(
                  children: [
                    /// Username
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: EshopTexts.username, prefixIcon: Icon(Iconsax.user_edit, color: dark ? EshopColors.white : EshopColors.dark),
                        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your username!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: EshopSizes.spaceBtwInputField),

                    /// Password
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: EshopTexts.password,
                        prefixIcon: Icon(Iconsax.password_check, color: dark ? EshopColors.white : EshopColors.dark),
                        suffixIcon: Icon(Iconsax.eye_slash, color: dark ? EshopColors.white : EshopColors.dark),
                        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your password!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: EshopSizes.spaceBtwInputField),

                    /// Fullname
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: EshopTexts.fullname, prefixIcon: Icon(Iconsax.user, color: dark ? EshopColors.white : EshopColors.dark),
                        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your fullname!';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: EshopSizes.spaceBtwInputField),


                    /// Phone
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: EshopTexts.phoneNo, prefixIcon: Icon(Iconsax.call, color: dark ? EshopColors.white : EshopColors.dark),
                        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your phone!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: EshopSizes.spaceBtwInputField),

                    /// Email
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: EshopTexts.email, prefixIcon: Icon(Iconsax.direct, color: dark ? EshopColors.white : EshopColors.dark),
                        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: EshopSizes.spaceBtwInputField),

                    /// Role Selection
                    DropdownButtonFormField<String>(
                      value: vm.selectedRole,
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Role',
                        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                        prefixIcon: Icon(Iconsax.user, color: dark ? EshopColors.white : EshopColors.dark),
                      ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                      items: [
                        DropdownMenuItem(
                          value: 'manager',
                          child: Text('Manager', style: TextStyle(color: dark ? EshopColors.white : EshopColors.dark)),
                        ),
                        DropdownMenuItem(
                          value: 'employee',
                          child: Text('Staff', style: TextStyle(color: dark ? EshopColors.white : EshopColors.dark)),
                        ),
                      ],
                      onChanged: (value) {
                        vm.setRole(value);
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please choose your role!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: EshopSizes.spaceBtwInputField),

                    /// Term&Conditions Checkbox
                    Row(
                      children: [
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                                value: true,
                                onChanged: (value) {}
                            )
                        ),
                        const SizedBox(width: EshopSizes.spaceAfterCheckbox),
                        Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(text: '${EshopTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                                  TextSpan(
                                      text: '${EshopTexts.privacyPolicy} ',
                                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                                        color: dark ? EshopColors.white : EshopColors.primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark ? EshopColors.white : EshopColors.primaryColor,
                                      )
                                  ),
                                  TextSpan(text: 'and ', style: Theme.of(context).textTheme.bodySmall),
                                  TextSpan(
                                      text: EshopTexts.termsOfUse,
                                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                                        color: dark ? EshopColors.white : EshopColors.primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark ? EshopColors.white : EshopColors.primaryColor,
                                      )
                                  ),

                                ]
                            )
                        )
                      ],
                    ),
                    const SizedBox(height: EshopSizes.spaceBtwSections),

                    /// Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                          vm.isLoading
                              ? null
                              : () async {
                            if (formKey.currentState!.validate()) {
                              final result = await vm.signUp();
                              result.fold(
                                (error) => SnackBarUtils.showError(context, error),
                                (success) => SnackBarUtils.showSuccess(context, success),
                              );
                            }
                          },
                        child: vm.isLoading

                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )

                              : const Text(
                            EshopTexts.createAcccount,
                            style: TextStyle(
                                fontSize: EshopSizes.fontSizeSm,
                                fontFamily: 'Poppins'
                            ),
                          )
                      ),
                    ),

                    const SizedBox(height: EshopSizes.spaceBtwSections),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: EshopSizes.defaultSpace),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Already have account?',
                              style: Theme.of(context).textTheme.labelMedium),
                          TextButton(
                              onPressed: () {
                                vm.router.pop();
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return Colors.blue.withOpacity(0.2);
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              child: Text(
                                  EshopTexts.backToSignIn,
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blue))
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
