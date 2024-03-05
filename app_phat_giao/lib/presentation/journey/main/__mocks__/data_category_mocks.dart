import 'package:app_phat_giao/commons/constants/icon_constants.dart';
import 'package:app_phat_giao/data/model/category.dart';

final dataCategoriesMock = [
  Category(
      categoryId: '13453',
      categoryName: 'Đức Phật',
      slug: 'duc-phat',
      img: IconConstants.icDucPhat,
      children: [
        Category(
          categoryId: '13437',
          categoryName: 'Nhân vật phật giáo',
          slug: 'nhan-vat-phat-giao',
        )
      ]),
  Category(
    categoryId: '',
    categoryName: 'Từ điển',
    slug: '',
    img: IconConstants.icTuDien,
  ),
  Category(
      categoryId: '13368',
      categoryName: 'Giáo hội',
      slug: 'giao-hoi',
      img: IconConstants.icGiaoHoi,
      children: [
        Category(
          categoryId: '13369',
          categoryName: 'Các kỳ đại hội',
          slug: 'cac-ky-dai-hoi',
        ),
        Category(
          categoryId: '13369',
          categoryName: 'Các kỳ đại hội',
          slug: 'cac-ky-dai-hoi',
        ),
        Category(
          categoryId: '13371',
          categoryName: 'Hệ thống tổ chức',
          slug: 'he-thong-to-chuc',
        ),
        Category(
          categoryId: '13408',
          categoryName: 'Văn bản',
          slug: 'van-ban',
        ),
        Category(
          categoryId: '13459',
          categoryName: 'VESAK 2019',
          slug: 'vesak-2019',
        ),
        Category(
          categoryId: '13500',
          categoryName: '40 năm Giáo hội',
          slug: '40-nam-giao-hoi',
        ),
      ]),
  Category(
      categoryId: '13356',
      categoryName: 'Chùa',
      slug: 'chua-viet',
      img: IconConstants.icChua),
  Category(
      categoryId: '13361',
      categoryName: 'Sách',
      slug: 'sach-phat-giao',
      img: IconConstants.icSach),
  Category(
      categoryId: '13456',
      categoryName: 'Tăng sĩ',
      slug: 'tang-si',
      img: IconConstants.icTangSi),
];
