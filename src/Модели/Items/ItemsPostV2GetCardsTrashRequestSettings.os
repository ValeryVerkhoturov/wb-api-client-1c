#Использовать jason

// ItemsPostV2GetCardsTrashRequestSettings
//
// Настройки
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// sort - ItemsPostV2GetCardsTrashRequestSettingsSort
&Сериализуемое("sort")
&Тип("ItemsPostV2GetCardsTrashRequestSettingsSort")
Перем sort Экспорт;

// cursor - ItemsPostV2GetCardsTrashRequestSettingsCursor
&Сериализуемое("cursor")
&Тип("ItemsPostV2GetCardsTrashRequestSettingsCursor")
Перем cursor Экспорт;

// filter - ItemsPostV2GetCardsTrashRequestSettingsFilter
&Сериализуемое("filter")
&Тип("ItemsPostV2GetCardsTrashRequestSettingsFilter")
Перем filter Экспорт;

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

