import 'package:ecommerce_app/model/category.dart';
import 'package:hive/hive.dart';

class LocalCategoryService {
  late Box<Category> _popularCategoryBox;
  late Box<Category> _categoryCategoryBox;
  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<Category>('PopularCategories');
    _categoryCategoryBox = await Hive.openBox<Category>('Categories');
  }

  Future<void> assignAllPopularCategories(
      {required List<Category> popularCategories}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }


  Future<void> assignAllCategories({required List<Category> categories}) async {
    await _categoryCategoryBox.clear();
    await _categoryCategoryBox.addAll(categories);
  }
  List<Category> getPopularCategories() => _popularCategoryBox.values.toList();
  List<Category> getCategories() => _categoryCategoryBox.values.toList();
}
