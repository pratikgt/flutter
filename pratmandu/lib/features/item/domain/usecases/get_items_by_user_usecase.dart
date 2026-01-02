import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratmandu/core/error/failures.dart';
import 'package:pratmandu/core/usecases/app_usecases.dart';
import 'package:pratmandu/features/item/data/repositories/item_repository.dart';
import 'package:pratmandu/features/item/domain/entities/item_entity.dart';
import 'package:pratmandu/features/item/domain/repositories/item_repository.dart';

class GetItemsByUserParams extends Equatable {
  final String userId;

  const GetItemsByUserParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}

final getItemsByUserUsecaseProvider = Provider<GetItemsByUserUsecase>((ref) {
  final itemRepository = ref.read(itemRepositoryProvider);
  return GetItemsByUserUsecase(itemRepository: itemRepository);
});

class GetItemsByUserUsecase
    implements UsecaseWithParms<List<ItemEntity>, GetItemsByUserParams> {
  final IItemRepository _itemRepository;

  GetItemsByUserUsecase({required IItemRepository itemRepository})
      : _itemRepository = itemRepository;

  @override
  Future<Either<Failure, List<ItemEntity>>> call(GetItemsByUserParams params) {
    return _itemRepository.getItemsByUser(params.userId);
  }
}
