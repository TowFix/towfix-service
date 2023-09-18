// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceRequestHash() => r'87a5e66a81ef927fdafb4532a48e4f2d0c772b37';

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

/// See also [serviceRequest].
@ProviderFor(serviceRequest)
const serviceRequestProvider = ServiceRequestFamily();

/// See also [serviceRequest].
class ServiceRequestFamily
    extends Family<AsyncValue<Either<Failure, ServiceRequest>>> {
  /// See also [serviceRequest].
  const ServiceRequestFamily();

  /// See also [serviceRequest].
  ServiceRequestProvider call(
    String id,
  ) {
    return ServiceRequestProvider(
      id,
    );
  }

  @override
  ServiceRequestProvider getProviderOverride(
    covariant ServiceRequestProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'serviceRequestProvider';
}

/// See also [serviceRequest].
class ServiceRequestProvider
    extends AutoDisposeStreamProvider<Either<Failure, ServiceRequest>> {
  /// See also [serviceRequest].
  ServiceRequestProvider(
    String id,
  ) : this._internal(
          (ref) => serviceRequest(
            ref as ServiceRequestRef,
            id,
          ),
          from: serviceRequestProvider,
          name: r'serviceRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$serviceRequestHash,
          dependencies: ServiceRequestFamily._dependencies,
          allTransitiveDependencies:
              ServiceRequestFamily._allTransitiveDependencies,
          id: id,
        );

  ServiceRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<Either<Failure, ServiceRequest>> Function(ServiceRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ServiceRequestProvider._internal(
        (ref) => create(ref as ServiceRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Either<Failure, ServiceRequest>>
      createElement() {
    return _ServiceRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceRequestProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ServiceRequestRef
    on AutoDisposeStreamProviderRef<Either<Failure, ServiceRequest>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ServiceRequestProviderElement
    extends AutoDisposeStreamProviderElement<Either<Failure, ServiceRequest>>
    with ServiceRequestRef {
  _ServiceRequestProviderElement(super.provider);

  @override
  String get id => (origin as ServiceRequestProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
