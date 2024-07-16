import '../../../../common/widget/app_bar/app_bar.dart';
import '../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../common/widget/form_field/text_form_field.dart';
import '../../../../common/widget/texts/section_heading.dart';
import '../../model/cubit/basket_cubit/basket_cubit.dart';
import 'widget/billing_payment_section.dart';
import '../../../../navigation_menu.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var nameController = TextEditingController();

  var streetController = TextEditingController();

  var cityController = TextEditingController();

  var postalController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  // void initState() {
  //   super.initState();
  //   // Set initial values if needed
  //   nameController.text = "John Doe"; // Example static value
  //   streetController.text = "123 Main St";
  //   cityController.text = "Sample City";
  //   postalController.text = "12345";
  // }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackArrow: true,
          title: Text('Oreder Review',
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            children: [
              const SectionHeading(title: 'Address', showActionButton: false),
              const SizedBox(height: MySize.spaceBtwInputFields),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     prefixIcon: Icon(Iconsax.user),
              //     label: Text('Name'),
              //   ),
              // ),
              const SizedBox(height: MySize.spaceBtwInputFields),
              CustomTextFromField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  } else {
                    return null;
                  }
                },
                prefixIcon: const Icon(Iconsax.user),
                textInputType: TextInputType.name,
                controller: nameController,
                labelText: 'Name',
              ),
              const SizedBox(height: MySize.spaceBtwInputFields),
              CustomTextFromField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Address is required';
                  } else {
                    return null;
                  }
                },
                prefixIcon: const Icon(Iconsax.buildings_2),
                textInputType: TextInputType.name,
                controller: streetController,
                labelText: 'Street Adreess',
              ),
              const SizedBox(height: MySize.spaceBtwInputFields),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFromField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'City is required';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(Iconsax.building_31),
                      textInputType: TextInputType.name,
                      controller: cityController,
                      labelText: 'City',
                    ),
                  ),
                  const SizedBox(width: MySize.spaceBtwInputFields),
                  Expanded(
                    child: CustomTextFromField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Zip code is required';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(Iconsax.code),
                      textInputType: TextInputType.number,
                      controller: postalController,
                      labelText: 'Postal code',
                    ),
                  ),
                ],
              ),
              //const CartItems(),
              const SizedBox(height: MySize.defaultSpace),
              RoundedContainer(
                showBorder: true,
                backgroundColor: dark ? MyColors.dark : MyColors.white,
                padding: const EdgeInsets.all(MySize.md),
                child: Column(
                  children: [
                    const BillingPaymentSection(),
                    const SizedBox(height: MySize.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: MySize.spaceBtwItems),
                    Column(
                      children: [
                        const SectionHeading(
                          title: 'Payment Method',
                          showActionButton: false,
                        ),
                        const SizedBox(height: MySize.spaceBtwItems * 3),
                        Row(
                          children: [
                            RoundedContainer(
                              width: 60,
                              height: 35,
                              backgroundColor: dark
                                  ? MyColors.white
                                  : MyColors.white.withOpacity(0.5),
                              padding: const EdgeInsets.all(MySize.sm),
                              child: const Image(
                                image: AssetImage(MyImages.cash),
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: MySize.spaceBtwItems / 2),
                            Text('Cash on delivery',
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: MySize.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Order'),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20.0)),
                        ),
                        builder: (context) => const PaymentSuccessBottomSheet(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentSuccessBottomSheet extends StatelessWidget {
  const PaymentSuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20.0),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80.0,
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Payment Successful!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<BasketCubit, BasketState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    BlocProvider.of<BasketCubit>(context).clearBasket();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigationMenu()));
                  },
                  child: const Text(
                    'Continue ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
