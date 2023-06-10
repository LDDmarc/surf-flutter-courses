import 'package:surf_dart_courses_template/surf_dart_courses_template.dart' as surf_dart_courses_template;

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
      this.areaInHectare,
      this.crops,
      this.machineries,
      );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
      this.id,
      this.releaseDate,
      );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

List<AgriculturalMachinery> getSortedAgriculturalMachineries() {
  Set<AgriculturalMachinery> agriculturalMachinerySet = {};
  agriculturalMachinerySet.addAll(getMachineries(mapBefore2010));
  agriculturalMachinerySet.addAll(getMachineries(mapAfter2010));

  List<AgriculturalMachinery> agriculturalMachineryList = agriculturalMachinerySet.toList(growable: false);
  agriculturalMachineryList.sort((lhs, rhs) => lhs.releaseDate.year.compareTo(rhs.releaseDate.year));
  return agriculturalMachineryList;
}

List<AgriculturalMachinery> getMachineries(Map<Countries, List<Territory>> givenMap) {
  return givenMap.entries.map((entry) => entry.value.expand((territory) => territory.machineries)).expand((machinery) => machinery).toList();
}

int getAverageReleaseYear(Iterable<AgriculturalMachinery> list) {
  return (list.map((machinery) => machinery.releaseDate.year).reduce((lhs, rhs) => lhs + rhs) / list.length).truncate();
}

void main(List<String> arguments) {
  final allSortedMachineries = getSortedAgriculturalMachineries();
  final averageReleaseYear = getAverageReleaseYear(allSortedMachineries);

  final oldestMachineriesCount = (allSortedMachineries.length / 2).truncate();
  final averageOldReleaseYear = getAverageReleaseYear(allSortedMachineries.take(oldestMachineriesCount));

  DateTime now = DateTime.now();
  print('Total average age is ${now.year - averageReleaseYear} years');
  print('Total average age of the oldest 50% machineries is ${now.year - averageOldReleaseYear} years');
}
