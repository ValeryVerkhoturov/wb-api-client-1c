#Использовать jason

// ItemsPostV2GetCardsListRequestSettings
//
// Настройки
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// sort - ItemsPostV2GetCardsListRequestSettingsSort
&Сериализуемое("sort")
&Тип("ItemsPostV2GetCardsListRequestSettingsSort")
Перем sort Экспорт;

// filter - ItemsPostV2GetCardsListRequestSettingsFilter
&Сериализуемое("filter")
&Тип("ItemsPostV2GetCardsListRequestSettingsFilter")
Перем filter Экспорт;

// cursor - ItemsPostV2GetCardsListRequestSettingsCursor
&Сериализуемое("cursor")
&Тип("ItemsPostV2GetCardsListRequestSettingsCursor")
Перем cursor Экспорт;

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

