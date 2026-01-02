import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratmandu/core/error/failures.dart';
import 'package:pratmandu/core/usecases/app_usecases.dart';
import 'package:pratmandu/features/batch/data/repositories/batch_repository.dart';
import 'package:pratmandu/features/batch/domain/entities/batch_entity.dart';
import 'package:pratmandu/features/batch/domain/repositories/batch_repository.dart';

// Create Provider
final getAllBatchUsecaseProvider = Provider<GetAllBatchUsecase>((ref) {
  final batchRepository = ref.read(batchRepositoryProvider);
  return GetAllBatchUsecase(batchRepository: batchRepository);
});

class GetAllBatchUsecase implements UsecaseWithoutParms<List<BatchEntity>> {
  final IBatchRepository _batchRepository;

  GetAllBatchUsecase({required IBatchRepository batchRepository})
      : _batchRepository = batchRepository;

  @override
  Future<Either<Failure, List<BatchEntity>>> call() {
    return _batchRepository.getAllBatches();
  }
}
