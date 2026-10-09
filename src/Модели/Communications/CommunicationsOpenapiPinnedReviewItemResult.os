#Использовать jason

// CommunicationsOpenapiPinnedReviewItemResult
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// changeStateAt - Строка - Дата и время закрепления или открепления
&Сериализуемое("changeStateAt")
&Тип("Строка")
Перем changeStateAt Экспорт;

// imtId - Число - ID для [объединённых](https://dev.wildberries.ru/knowledge-base/articles/019d49a4-1320-71bb-9dac-8ba07e7177ce/rabota-s-tovarami#obuedinenie-i-razuedinenie-karto…
&Сериализуемое("imtId")
&Тип("Число")
Перем imtId Экспорт;

// nmId - Число - Артикул WB
&Сериализуемое("nmId")
&Тип("Число")
Перем nmId Экспорт;

// pinId - Число - ID операции закрепления отзыва
&Сериализуемое("pinId")
&Тип("Число")
Перем pinId Экспорт;

// pinMethod - CommunicationsDomainReviewPinMethod - Метод закрепления: - `subscription` — подписка Джем - `tariff` — тарифная опция
&Сериализуемое("pinMethod")
&Тип("CommunicationsDomainReviewPinMethod")
Перем pinMethod Экспорт;

// pinOn - CommunicationsDomainReviewPinOn - Место закрепления отзыва: - `nm` — карточка товара - `imt` — группа [объединённых](https://dev.wildberries.ru/knowledge-base/articles/019d49a4-1320-71bb-9dac-8b…
&Сериализуемое("pinOn")
&Тип("CommunicationsDomainReviewPinOn")
Перем pinOn Экспорт;

// feedbackId - Строка - ID отзыва
&Сериализуемое("feedbackId")
&Тип("Строка")
Перем feedbackId Экспорт;

// state - CommunicationsDomainReviewState - Закреплён ли отзыв: - `pinned` — да - `unpinned` — нет
&Сериализуемое("state")
&Тип("CommunicationsDomainReviewState")
Перем state Экспорт;

// unpinnedCause - Строка - Причина открепления отзыва: - `sysTariffUnpinned` — закончилась подписка или тарифная опция - `sysLimitReached` — закончился общий лимит по подписке - `sysNorat…
&Сериализуемое("unpinnedCause")
&Тип("Строка")
Перем unpinnedCause Экспорт;

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

