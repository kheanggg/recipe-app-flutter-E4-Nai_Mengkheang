// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedCategoryNotifier)
const selectedCategoryProvider = SelectedCategoryNotifierProvider._();

final class SelectedCategoryNotifierProvider
    extends $NotifierProvider<SelectedCategoryNotifier, int?> {
  const SelectedCategoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryNotifierHash();

  @$internal
  @override
  SelectedCategoryNotifier create() => SelectedCategoryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedCategoryNotifierHash() =>
    r'5eb6acdffef438514854d06f828efa31ce0e129b';

abstract class _$SelectedCategoryNotifier extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(homeCategories)
const homeCategoriesProvider = HomeCategoriesProvider._();

final class HomeCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          FutureOr<List<Category>>
        >
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  const HomeCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    return homeCategories(ref);
  }
}

String _$homeCategoriesHash() => r'b24ad5e65202076bea90c97db306a1af91bfd642';

@ProviderFor(homeMeals)
const homeMealsProvider = HomeMealsFamily._();

final class HomeMealsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Meal>>,
          List<Meal>,
          FutureOr<List<Meal>>
        >
    with $FutureModifier<List<Meal>>, $FutureProvider<List<Meal>> {
  const HomeMealsProvider._({
    required HomeMealsFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'homeMealsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$homeMealsHash();

  @override
  String toString() {
    return r'homeMealsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Meal>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Meal>> create(Ref ref) {
    final argument = this.argument as String?;
    return homeMeals(ref, category: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeMealsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$homeMealsHash() => r'25a5dd3d3524363ea641f01cd3204fd0aac14779';

final class HomeMealsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Meal>>, String?> {
  const HomeMealsFamily._()
    : super(
        retry: null,
        name: r'homeMealsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HomeMealsProvider call({String? category}) =>
      HomeMealsProvider._(argument: category, from: this);

  @override
  String toString() => r'homeMealsProvider';
}
