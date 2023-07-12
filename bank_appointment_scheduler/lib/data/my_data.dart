import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class MyData {
  final Map<String, List<String>> oblast = {
    'Баткен': [
      'Баткен',
      'Кызыл-Кия',
      'Раззаков',
      'Кадамжай',
    ],
    'Чуй': [
      'Ленинский',
      'Октябрьский',
      'Первомайский',
      'Свердловский',
    ],
    'Жала-Абад': [
      'Кочкор-Ата',
      'Жалал-Абад',
      'Кербен',
    ],
    'Нарын': [
      'Нарын',
      'Баетово',
    ],
    'Ош': [
      'Ош',
      'Озгон',
      'Кара-Суу',
    ],
    'Талас': [
      'Талас',
    ],
    'Ысык-Көл': [
      'Балыкчы',
      'Каракол',
      'Кызыл-Суу',
      'Чолпон-Ата',
    ],
  };
  final Map<String, String> address = {
    'Выездная касса №033-02-В6 (МТО "Бизнес-Транс-Сервис")':
        'г. Бишкек, ул.Кожевенная, 74',
    'Выездная касса №033-02-В7 (Таможня "Манас")':
        'г. Бишкек, в здании ЗАО "Компания Манас Менеджмент"',
    'Выездная касса №033-50-В5 (УГНС по Первомайскому району)':
        'г. Бишкек, ул. Киевская, 96 Б',
    'Выездная касса №033-51-В10 (на таможенном посту "Аламедин")':
        'г.Бишкек, ул.Чолпон-Атинская, 2 А',
    'Выездная касса в здании Бишкекводоканала (Филиал “Мурас”)':
        'г. Бишкек, 10 мкр., 35',
    'Выездная касса в здании МЮ КР': 'г.Бишкек, ул.Сагымбая Манасчы, 123',
    'Выездная касса ГУ УНАА': 'г. Бишкек, ул. Ч.Валиханова, 2',
    'Выездная касса на ТРК "Алкан Базары "': 'г. Бишкек, ул. Кожевенная, 74',
    'Филиал "Илбирс"': 'г. Бишкек, ул. Киевская, 77',
    'Филиал "Мурас"': 'г. Бишкек, пр. Чуй, 48',
    'Филиал "Ырыскы"': 'г. Бишкек, ул. Молодая Гвардия, 38 А',
  };

  final Map<String, List<String>> categories = {
    LocaleKeys.fiz_litso.tr(): [
      'Интернет-банкинг',
      LocaleKeys.mastercard.tr(),
      LocaleKeys.real_gold.tr(),
      'Срочные депозиты',
      'Тарифы',
      'Перевозка ценностей',
      LocaleKeys.islamic_finc.tr(),
      'Кредитование',
      'Денежные переводы',
      'Сейфовые ячейки',
      'Дисконтный клуб',
      'Операция с ценными бумагами',
      LocaleKeys.google_pay.tr(),
      LocaleKeys.vs.tr(),
    ],
    LocaleKeys.yur_litso.tr(): [
      'Интернет-банкинг',
      LocaleKeys.credit.tr(),
      LocaleKeys.perevozka.tr(),
      LocaleKeys.depo_srochno.tr(),
      LocaleKeys.tarif.tr(),
      LocaleKeys.contract.tr(),
      'Расчетно кассовое обслуживание',
      'Документарные операции',
      LocaleKeys.operation_bum.tr(),
      'Pos-терминалы ККМ-онлайн',
      LocaleKeys.islamic_finc.tr(),
      LocaleKeys.vs.tr(),
    ],
  };
}
