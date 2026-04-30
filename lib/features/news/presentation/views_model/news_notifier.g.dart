// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsNotifierHash() => r'2f2359f5c817ecf9c9d47daa9ff0db07b3890242';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NewsNotifier extends BuildlessAutoDisposeNotifier<NewsState> {
  late final String? categoryId;

  NewsState build(String? categoryId);
}

/// See also [NewsNotifier].
@ProviderFor(NewsNotifier)
const newsNotifierProvider = NewsNotifierFamily();

/// See also [NewsNotifier].
class NewsNotifierFamily extends Family<NewsState> {
  /// See also [NewsNotifier].
  const NewsNotifierFamily();

  /// See also [NewsNotifier].
  NewsNotifierProvider call(String? categoryId) {
    return NewsNotifierProvider(categoryId);
  }

  @override
  NewsNotifierProvider getProviderOverride(
    covariant NewsNotifierProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newsNotifierProvider';
}

/// See also [NewsNotifier].
class NewsNotifierProvider
    extends AutoDisposeNotifierProviderImpl<NewsNotifier, NewsState> {
  /// See also [NewsNotifier].
  NewsNotifierProvider(String? categoryId)
    : this._internal(
        () => NewsNotifier()..categoryId = categoryId,
        from: newsNotifierProvider,
        name: r'newsNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$newsNotifierHash,
        dependencies: NewsNotifierFamily._dependencies,
        allTransitiveDependencies:
            NewsNotifierFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  NewsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String? categoryId;

  @override
  NewsState runNotifierBuild(covariant NewsNotifier notifier) {
    return notifier.build(categoryId);
  }

  @override
  Override overrideWith(NewsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewsNotifierProvider._internal(
        () => create()..categoryId = categoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NewsNotifier, NewsState> createElement() {
    return _NewsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsNotifierProvider && other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NewsNotifierRef on AutoDisposeNotifierProviderRef<NewsState> {
  /// The parameter `categoryId` of this provider.
  String? get categoryId;
}

class _NewsNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<NewsNotifier, NewsState>
    with NewsNotifierRef {
  _NewsNotifierProviderElement(super.provider);

  @override
  String? get categoryId => (origin as NewsNotifierProvider).categoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
