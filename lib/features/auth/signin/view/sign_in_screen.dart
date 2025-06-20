import 'package:eshop/common/widgets/form_divider.dart';
import 'package:eshop/utils/snackbar/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/styles/spacing_style.dart';
import '../../../../providers/features/auth/auth_provider.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(signInViewModelProvider);
    final dark = EshopHelperFunctions.isDarkMode(context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EshopSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title và Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(dark ? EshopImages.appLogo : EshopImages.appLogo),
                  ),
                  Text(
                    EshopTexts.signInTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: EshopSizes.sm),
                  Text(
                    EshopTexts.signInSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              /// Form
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: EshopSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      /// Username
                      TextFormField(
                        controller: vm.usernameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.user, color: dark ? EshopColors.white : EshopColors.dark),
                          labelText: EshopTexts.username,
                          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
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
                        controller: vm.passwordController,
                        obscureText: !vm.isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check, color: dark ? EshopColors.white : EshopColors.dark),
                          labelText: EshopTexts.password,
                          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
                          suffixIcon: IconButton(
                            icon: Icon(
                              vm.isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
                              color: dark ? EshopColors.white : EshopColors.dark,
                            ),
                            onPressed: vm.togglePasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password!';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: EshopSizes.spaceBtwSections),

                      /// Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: vm.isLoading
                              ? null
                              : () async {
                            if (formKey.currentState!.validate()) {
                              final result = await vm.signIn();
                              result.fold(
                                    (error) => SnackBarUtils.showError(context, error),
                                    (success) => SnackBarUtils.showSuccess(context, success)
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
                              : Text(
                            EshopTexts.signIn,
                            style: Theme.of(context).textTheme.bodyMedium!.apply(color: EshopColors.white).copyWith(fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),

                      const SizedBox(height: EshopSizes.spaceBtwSections),

                      const EshopFormDivider(dividerText: EshopTexts.orSignInWith),

                      const SizedBox(height: EshopSizes.spaceBtwSections),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(border: Border.all(color: EshopColors.grey), borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              onPressed: () {
                                SnackBarUtils.showInfo(context, "This feature has not yet implemented!");
                              },
                              icon: const Image(
                                width: EshopSizes.iconMd,
                                height: EshopSizes.iconMd,
                                image: AssetImage(EshopImages.google),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: EshopSizes.spaceBtwSections),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: EshopSizes.defaultSpace),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont have account?',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            TextButton(
                              onPressed: () {
                                vm.router.push('/signup');
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
                                EshopTexts.createAcccount,
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}