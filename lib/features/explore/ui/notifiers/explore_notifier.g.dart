// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExploreScreenNotifier)
const exploreScreenProvider = ExploreScreenNotifierProvider._();

final class ExploreScreenNotifierProvider
    extends $NotifierProvider<ExploreScreenNotifier, ExploreState> {
  const ExploreScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exploreScreenNotifierHash();

  @$internal
  @override
  ExploreScreenNotifier create() => ExploreScreenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExploreState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExploreState>(value),
    );
  }
}

String _$exploreScreenNotifierHash() =>
    r'd048e8f4b4ef243739d9eca744642c034b6864ed';

abstract class _$ExploreScreenNotifier extends $Notifier<ExploreState> {
  ExploreState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ExploreState, ExploreState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExploreState, ExploreState>,
              ExploreState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(exploreCategories)
const exploreCategoriesProvider = ExploreCategoriesProvider._();

final class ExploreCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          FutureOr<List<Category>>
        >
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  const ExploreCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exploreCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    return exploreCategories(ref);
  }
}

String _$exploreCategoriesHash() => r'14fb3b3b1752f15365376af3214bfb52cebf3d57';

@ProviderFor(exploreMeals)
const exploreMealsProvider = ExploreMealsProvider._();

final class ExploreMealsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Meal>>,
          List<Meal>,
          FutureOr<List<Meal>>
        >
    with $FutureModifier<List<Meal>>, $FutureProvider<List<Meal>> {
  const ExploreMealsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreMealsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exploreMealsHash();

  @$internal
  @override
  $FutureProviderElement<List<Meal>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Meal>> create(Ref ref) {
    return exploreMeals(ref);
  }
}

String _$exploreMealsHash() => r'0c65d421c3bd284ac50d17c496f8b3563b0aa8fb';

@ProviderFor(exploreCuisines)
const exploreCuisinesProvider = ExploreCuisinesProvider._();

final class ExploreCuisinesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  const ExploreCuisinesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreCuisinesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exploreCuisinesHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return exploreCuisines(ref);
  }
}

String _$exploreCuisinesHash() => r'1b22ad2a122ea46c824256e3eda72e60f7d3769f';
