// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mealService)
const mealServiceProvider = MealServiceProvider._();

final class MealServiceProvider
    extends $FunctionalProvider<MealService, MealService, MealService>
    with $Provider<MealService> {
  const MealServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealServiceHash();

  @$internal
  @override
  $ProviderElement<MealService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MealService create(Ref ref) {
    return mealService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MealService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MealService>(value),
    );
  }
}

String _$mealServiceHash() => r'295a309eb327231e94b3d99852fa8fc2aa1c6b2d';
