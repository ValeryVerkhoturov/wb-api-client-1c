#Использовать jason

// CommunicationsGetV1FeedbacksResponse200DataFeedbacksInner
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// id - Строка - ID отзыва
&Сериализуемое("id")
&Тип("Строка")
Перем id Экспорт;

// text - Строка - Текст отзыва
&Сериализуемое("text")
&Тип("Строка")
Перем text Экспорт;

// pros - Строка - Достоинства товара
&Сериализуемое("pros")
&Тип("Строка")
Перем pros Экспорт;

// cons - Строка - Недостатки товара
&Сериализуемое("cons")
&Тип("Строка")
Перем cons Экспорт;

// productValuation - Число - Оценка товара
&Сериализуемое("productValuation")
&Тип("Число")
Перем productValuation Экспорт;

// createdDate - Строка - Дата и время создания отзыва
&Сериализуемое("createdDate")
&Тип("Строка")
Перем createdDate Экспорт;

// answer - CommunicationsGetV1FeedbacksResponse200DataFeedbacksInnerAnswer
&Сериализуемое("answer")
&Тип("CommunicationsGetV1FeedbacksResponse200DataFeedbacksInnerAnswer")
Перем answer Экспорт;

// state - Строка - Статус отзыва: - `none` - не обработан (новый) - `wbRu` - обработан
&Сериализуемое("state")
&Тип("Строка")
Перем state Экспорт;

// productDetails - CommunicationsGetV1FeedbacksResponse200DataFeedbacksInnerProductDetails
&Сериализуемое("productDetails")
&Тип("CommunicationsGetV1FeedbacksResponse200DataFeedbacksInnerProductDetails")
Перем productDetails Экспорт;

// photoLinks - Массив - Массив структур фотографий
&Сериализуемое("photoLinks")
&Тип("Массив")
&ДляКаждого
&Тип("CommunicationsGetV1FeedbacksResponse200DataFeedbacksInnerPhotoLinksInner")
Перем photoLinks Экспорт;

// video - CommunicationsGetV1FeedbacksResponse200DataFeedbacksInnerVideo
&Сериализуемое("video")
&Тип("CommunicationsGetV1FeedbacksResponse200DataFeedbacksInnerVideo")
Перем video Экспорт;

// wasViewed - Булево - Просмотрен ли отзыв
&Сериализуемое("wasViewed")
&Тип("Булево")
Перем wasViewed Экспорт;

// userName - Строка - Имя автора отзыва
&Сериализуемое("userName")
&Тип("Строка")
Перем userName Экспорт;

// orderStatus - Строка - Статус заказа. Возможные значения: - `buyout` — выкуплен - `rejected` — отказались - `returned` — возврат - `notSpecified` — статус не присвоен
&Сериализуемое("orderStatus")
&Тип("Строка")
Перем orderStatus Экспорт;

// matchingSize - Строка - Соответствие заявленного размера реальному. Возможные значения: - ` ` — для безразмерных товаров - `ок` — соответствует размеру - `smaller` — маломерит - `bigge…
&Сериализуемое("matchingSize")
&Тип("Строка")
Перем matchingSize Экспорт;

// isAbleSupplierFeedbackValuation - Булево - Доступна ли продавцу возможность оставить жалобу на отзыв (`true` — доступна, `false` — не доступна)
&Сериализуемое("isAbleSupplierFeedbackValuation")
&Тип("Булево")
Перем isAbleSupplierFeedbackValuation Экспорт;

// supplierFeedbackValuation - Число - Ключ причины жалобы на отзыв
&Сериализуемое("supplierFeedbackValuation")
&Тип("Число")
Перем supplierFeedbackValuation Экспорт;

// isAbleSupplierProductValuation - Булево - Доступна ли продавцу возможность сообщить о проблеме с товаром: - `true` — да - `false` — нет
&Сериализуемое("isAbleSupplierProductValuation")
&Тип("Булево")
Перем isAbleSupplierProductValuation Экспорт;

// supplierProductValuation - Число - Ключ проблемы с товаром
&Сериализуемое("supplierProductValuation")
&Тип("Число")
Перем supplierProductValuation Экспорт;

// isAbleReturnProductOrders - Булево - Опция возврата товара: - `true` — доступна - `false` — недоступна
&Сериализуемое("isAbleReturnProductOrders")
&Тип("Булево")
Перем isAbleReturnProductOrders Экспорт;

// returnProductOrdersDate - Строка - Дата и время, когда на запрос возврата был получен ответ со статус-кодом 200.
&Сериализуемое("returnProductOrdersDate")
&Тип("Строка")
Перем returnProductOrdersDate Экспорт;

// bables - Массив - Список тегов покупателя
&Сериализуемое("bables")
&Тип("Массив")
&ДляКаждого
&Тип("Строка")
Перем bables Экспорт;

// lastOrderShkId - Число - Штрихкод единицы товара
&Сериализуемое("lastOrderShkId")
&Тип("Число")
Перем lastOrderShkId Экспорт;

// lastOrderCreatedAt - Строка - Дата покупки
&Сериализуемое("lastOrderCreatedAt")
&Тип("Строка")
Перем lastOrderCreatedAt Экспорт;

// color - Строка - Цвет товара
&Сериализуемое("color")
&Тип("Строка")
Перем color Экспорт;

// subjectId - Число - ID предмета
&Сериализуемое("subjectId")
&Тип("Число")
Перем subjectId Экспорт;

// subjectName - Строка - Название предмета
&Сериализуемое("subjectName")
&Тип("Строка")
Перем subjectName Экспорт;

// parentFeedbackId - Строка - ID начального отзыва (`null`, если этот отзыв начальный)
&Сериализуемое("parentFeedbackId")
&Тип("Строка")
Перем parentFeedbackId Экспорт;

// childFeedbackId - Строка - ID дополненного отзыва (`null`, если этот отзыв дополненный)
&Сериализуемое("childFeedbackId")
&Тип("Строка")
Перем childFeedbackId Экспорт;

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

