import 'package:dartz/dartz.dart';
import 'package:pratmandu/core/error/failures.dart';
import 'package:pratmandu/features/category/domain/entities/category_entity.dart';

abstract interface class ICategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, CategoryEntity>> getCategoryById(String categoryId);
  Future<Either<Failure, bool>> createCategory(CategoryEntity category);
  Future<Either<Failure, bool>> updateCategory(CategoryEntity category);
  Future<Either<Failure, bool>> deleteCategory(String categoryId);
}
