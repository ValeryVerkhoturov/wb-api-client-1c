#Использовать jason

// OrdersFbsSupplySpotDataResponseSuppliesInner
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// id - Строка - ID поставки
&Сериализуемое("id")
&Тип("Строка")
Перем id Экспорт;

// spot - OrdersFbsSupplySpotDataResponseSuppliesInnerSpot
&Сериализуемое("spot")
&Тип("OrdersFbsSupplySpotDataResponseSuppliesInnerSpot")
Перем spot Экспорт;

// error - OrdersFbsSupplySpotDataResponseSuppliesInnerError
&Сериализуемое("error")
&Тип("OrdersFbsSupplySpotDataResponseSuppliesInnerError")
Перем error Экспорт;

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

