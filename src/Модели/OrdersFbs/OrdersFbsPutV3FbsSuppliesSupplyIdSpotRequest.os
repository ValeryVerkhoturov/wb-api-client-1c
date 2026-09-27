#Использовать jason

// OrdersFbsPutV3FbsSuppliesSupplyIdSpotRequest
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// carrierName - Строка - Наименование перевозчика
&Сериализуемое("carrierName")
&Тип("Строка")
Перем carrierName Экспорт;

// carrierTaxNumber - Строка - ИНН перевозчика
&Сериализуемое("carrierTaxNumber")
&Тип("Строка")
Перем carrierTaxNumber Экспорт;

// carrierCountryCode - Строка - Код страны перевозчика по [ОКСМ](./orders-fbs#tag/fbsSupplies/operation/getV3FbsDictionariesCountriesOksm)
&Сериализуемое("carrierCountryCode")
&Тип("Строка")
Перем carrierCountryCode Экспорт;

// vehicleRegistrationNumber - Строка - Регистрационный номер транспортного средства
&Сериализуемое("vehicleRegistrationNumber")
&Тип("Строка")
Перем vehicleRegistrationNumber Экспорт;

// trailerRegistrationNumber - Строка - Регистрационный номер прицепа
&Сериализуемое("trailerRegistrationNumber")
&Тип("Строка")
Перем trailerRegistrationNumber Экспорт;

// Возвращает JSON-представление модели.
//
// Незаполненные свойства пропускаются, поэтому в теле запроса не появится
// null там, где сервис ожидает отсутствие поля.
//
// Возвращаемое значение:
//   Строка
//
Функция ВJson() Экспорт
	Возврат Новый СериализаторJson().Сериализовать(ЭтотОбъект);
КонецФункции

