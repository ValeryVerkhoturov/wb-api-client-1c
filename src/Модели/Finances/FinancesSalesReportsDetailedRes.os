#Использовать jason

// FinancesSalesReportsDetailedRes
//
// Детализации к отчётам реализации
//
// Класс сформирован автоматически (onescript) из спецификации OpenAPI.
// Правки будут потеряны при следующей генерации.
//
// Форма свойства описана аннотациями: jason берёт из `&Сериализуемое` имя поля
// в JSON, а из `&Тип` и `&ДляКаждого` — класс, в который разбирать значение,
// поэтому вложенные модели и массивы моделей восстанавливаются сами собой.

// reportId - Число - ID отчёта
&Сериализуемое("reportId")
&Тип("Число")
Перем reportId Экспорт;

// dateFrom - Строка - Дата начала отчётного периода
&Сериализуемое("dateFrom")
&Тип("Строка")
Перем dateFrom Экспорт;

// dateTo - Строка - Дата конца отчётного периода
&Сериализуемое("dateTo")
&Тип("Строка")
Перем dateTo Экспорт;

// createDate - Строка - Дата формирования отчёта
&Сериализуемое("createDate")
&Тип("Строка")
Перем createDate Экспорт;

// currency - Строка - Валюта отчёта
&Сериализуемое("currency")
&Тип("Строка")
Перем currency Экспорт;

// reportType - Число - Тип отчёта: - `1` — основной - `2` — по выкупам
&Сериализуемое("reportType")
&Тип("Число")
Перем reportType Экспорт;

// rrdId - Число - ID строки
&Сериализуемое("rrdId")
&Тип("Число")
Перем rrdId Экспорт;

// giId - Число - ID поставки
&Сериализуемое("giId")
&Тип("Число")
Перем giId Экспорт;

// dlvPrc - Число - Фиксированный коэффициент склада по поставке
&Сериализуемое("dlvPrc")
&Тип("Число")
Перем dlvPrc Экспорт;

// fixTariffDateFrom - Строка - Дата начала действия фиксации
&Сериализуемое("fixTariffDateFrom")
&Тип("Строка")
Перем fixTariffDateFrom Экспорт;

// fixTariffDateTo - Строка - Дата конца действия фиксации
&Сериализуемое("fixTariffDateTo")
&Тип("Строка")
Перем fixTariffDateTo Экспорт;

// subjectName - Строка - Предмет
&Сериализуемое("subjectName")
&Тип("Строка")
Перем subjectName Экспорт;

// nmId - Число - Артикул WB
&Сериализуемое("nmId")
&Тип("Число")
Перем nmId Экспорт;

// brandName - Строка - Бренд
&Сериализуемое("brandName")
&Тип("Строка")
Перем brandName Экспорт;

// vendorCode - Строка - Артикул продавца
&Сериализуемое("vendorCode")
&Тип("Строка")
Перем vendorCode Экспорт;

// title - Строка - Название товара
&Сериализуемое("title")
&Тип("Строка")
Перем title Экспорт;

// techSize - Строка - Размер
&Сериализуемое("techSize")
&Тип("Строка")
Перем techSize Экспорт;

// sku - Строка - Баркод
&Сериализуемое("sku")
&Тип("Строка")
Перем sku Экспорт;

// docTypeName - Строка - Тип документа
&Сериализуемое("docTypeName")
&Тип("Строка")
Перем docTypeName Экспорт;

// quantity - Число - Количество
&Сериализуемое("quantity")
&Тип("Число")
Перем quantity Экспорт;

// retailPrice - Строка - Цена розничная
&Сериализуемое("retailPrice")
&Тип("Строка")
Перем retailPrice Экспорт;

// retailAmount - Строка - Wildberries реализовал Товар (Пр)
&Сериализуемое("retailAmount")
&Тип("Строка")
Перем retailAmount Экспорт;

// salePercent - Число - Согласованный продуктовый дисконт, %
&Сериализуемое("salePercent")
&Тип("Число")
Перем salePercent Экспорт;

// commissionPercent - Число - Размер кВВ, %
&Сериализуемое("commissionPercent")
&Тип("Число")
Перем commissionPercent Экспорт;

// officeName - Строка - Склад
&Сериализуемое("officeName")
&Тип("Строка")
Перем officeName Экспорт;

// sellerOperName - Строка - Обоснование для оплаты
&Сериализуемое("sellerOperName")
&Тип("Строка")
Перем sellerOperName Экспорт;

// orderDt - Строка - Дата и время заказа
&Сериализуемое("orderDt")
&Тип("Строка")
Перем orderDt Экспорт;

// saleDt - Строка - Дата и время продажи
&Сериализуемое("saleDt")
&Тип("Строка")
Перем saleDt Экспорт;

// rrDate - Строка - Дата операции
&Сериализуемое("rrDate")
&Тип("Строка")
Перем rrDate Экспорт;

// shkId - Число - Штрихкод
&Сериализуемое("shkId")
&Тип("Число")
Перем shkId Экспорт;

// retailPriceWithDisc - Строка - Цена розничная с учётом согласованной скидки
&Сериализуемое("retailPriceWithDisc")
&Тип("Строка")
Перем retailPriceWithDisc Экспорт;

// deliveryAmount - Число - Количество доставок
&Сериализуемое("deliveryAmount")
&Тип("Число")
Перем deliveryAmount Экспорт;

// returnAmount - Число - Количество возврата
&Сериализуемое("returnAmount")
&Тип("Число")
Перем returnAmount Экспорт;

// deliveryService - Строка - Услуги по доставке товара покупателю
&Сериализуемое("deliveryService")
&Тип("Строка")
Перем deliveryService Экспорт;

// giBoxTypeName - Строка - Тип коробов
&Сериализуемое("giBoxTypeName")
&Тип("Строка")
Перем giBoxTypeName Экспорт;

// productDiscountForReport - Число - Итоговая согласованная скидка, %
&Сериализуемое("productDiscountForReport")
&Тип("Число")
Перем productDiscountForReport Экспорт;

// sellerPromo - Число - Промокод, %
&Сериализуемое("sellerPromo")
&Тип("Число")
Перем sellerPromo Экспорт;

// spp - Число - Платформенные скидки, %
&Сериализуемое("spp")
&Тип("Число")
Перем spp Экспорт;

// kvwBase - Число - Размер кВВ без НДС, % базовый
&Сериализуемое("kvwBase")
&Тип("Число")
Перем kvwBase Экспорт;

// kvw - Число - Итоговый кВВ без НДС, %
&Сериализуемое("kvw")
&Тип("Число")
Перем kvw Экспорт;

// supRatingUp - Число - Размер снижения кВВ из-за рейтинга, %
&Сериализуемое("supRatingUp")
&Тип("Число")
Перем supRatingUp Экспорт;

// isKgvpV2 - Число - Размер снижения кВВ из-за акции, %
&Сериализуемое("isKgvpV2")
&Тип("Число")
Перем isKgvpV2 Экспорт;

// ppvzSalesCommission - Строка - Вознаграждение с продаж до вычета услуг поверенного, без НДС
&Сериализуемое("ppvzSalesCommission")
&Тип("Строка")
Перем ppvzSalesCommission Экспорт;

// forPay - Строка - К перечислению продавцу за реализованный товар
&Сериализуемое("forPay")
&Тип("Строка")
Перем forPay Экспорт;

// ppvzReward - Строка - Возмещение за выдачу и возврат товаров на ПВЗ
&Сериализуемое("ppvzReward")
&Тип("Строка")
Перем ppvzReward Экспорт;

// acquiringFee - Строка - Компенсация платёжных услуг/комиссия за интеграцию платёжных сервисов
&Сериализуемое("acquiringFee")
&Тип("Строка")
Перем acquiringFee Экспорт;

// acquiringPercent - Число - Размер компенсации платёжных услуг/комиссии за интеграцию платёжных сервисов
&Сериализуемое("acquiringPercent")
&Тип("Число")
Перем acquiringPercent Экспорт;

// paymentProcessing - Строка - Тип платежа: компенсация платёжных услуг/комиссия за интеграцию платёжных сервисов
&Сериализуемое("paymentProcessing")
&Тип("Строка")
Перем paymentProcessing Экспорт;

// acquiringBank - Строка - Наименование банка-эквайера
&Сериализуемое("acquiringBank")
&Тип("Строка")
Перем acquiringBank Экспорт;

// vw - Строка - Вознаграждение Wildberries (ВВ), без НДС
&Сериализуемое("vw")
&Тип("Строка")
Перем vw Экспорт;

// vwNds - Строка - НДС с вознаграждения Wildberries
&Сериализуемое("vwNds")
&Тип("Строка")
Перем vwNds Экспорт;

// ppvzOfficeName - Строка - Наименование офиса доставки
&Сериализуемое("ppvzOfficeName")
&Тип("Строка")
Перем ppvzOfficeName Экспорт;

// ppvzOfficeId - Число - ID офиса доставки
&Сериализуемое("ppvzOfficeId")
&Тип("Число")
Перем ppvzOfficeId Экспорт;

// ppvzSupplierName - Строка - Партнёр
&Сериализуемое("ppvzSupplierName")
&Тип("Строка")
Перем ppvzSupplierName Экспорт;

// ppvzSupplierInn - Строка - ИНН партнёра
&Сериализуемое("ppvzSupplierInn")
&Тип("Строка")
Перем ppvzSupplierInn Экспорт;

// declarationNumber - Строка - Номер таможенной декларации
&Сериализуемое("declarationNumber")
&Тип("Строка")
Перем declarationNumber Экспорт;

// bonusTypeName - Строка - Виды доставок, штрафов и корректировок ВВ
&Сериализуемое("bonusTypeName")
&Тип("Строка")
Перем bonusTypeName Экспорт;

// stickerId - Строка - Стикер МП
&Сериализуемое("stickerId")
&Тип("Строка")
Перем stickerId Экспорт;

// country - Строка - Страна продажи
&Сериализуемое("country")
&Тип("Строка")
Перем country Экспорт;

// srvDbs - Булево - Признак услуги платной доставки
&Сериализуемое("srvDbs")
&Тип("Булево")
Перем srvDbs Экспорт;

// penalty - Строка - Общая сумма штрафов
&Сериализуемое("penalty")
&Тип("Строка")
Перем penalty Экспорт;

// additionalPayment - Строка - Корректировка Вознаграждения Wildberries (ВВ)
&Сериализуемое("additionalPayment")
&Тип("Строка")
Перем additionalPayment Экспорт;

// rebillLogisticCost - Строка - Возмещение издержек по перемещению и операционной обработке товара
&Сериализуемое("rebillLogisticCost")
&Тип("Строка")
Перем rebillLogisticCost Экспорт;

// rebillLogisticOrg - Строка - Организатор перевозки
&Сериализуемое("rebillLogisticOrg")
&Тип("Строка")
Перем rebillLogisticOrg Экспорт;

// paidStorage - Строка - Хранение
&Сериализуемое("paidStorage")
&Тип("Строка")
Перем paidStorage Экспорт;

// deduction - Строка - Удержания
&Сериализуемое("deduction")
&Тип("Строка")
Перем deduction Экспорт;

// paidAcceptance - Строка - Операции на приёмке
&Сериализуемое("paidAcceptance")
&Тип("Строка")
Перем paidAcceptance Экспорт;

// orderId - Число - ID сборочного задания
&Сериализуемое("orderId")
&Тип("Число")
Перем orderId Экспорт;

// kiz - Строка - Код маркировки [Честного знака](https://честныйзнак.рф)
&Сериализуемое("kiz")
&Тип("Строка")
Перем kiz Экспорт;

// isB2b - Булево - Признак B2B-продажи
&Сериализуемое("isB2b")
&Тип("Булево")
Перем isB2b Экспорт;

// trbxId - Строка - ID короба для обработки товара
&Сериализуемое("trbxId")
&Тип("Строка")
Перем trbxId Экспорт;

// installmentCofinancingAmount - Строка - Скидка по программе софинансирования
&Сериализуемое("installmentCofinancingAmount")
&Тип("Строка")
Перем installmentCofinancingAmount Экспорт;

// wibesDiscountPercent - Число - Скидка Wibes, %
&Сериализуемое("wibesDiscountPercent")
&Тип("Число")
Перем wibesDiscountPercent Экспорт;

// cashbackAmount - Строка - Сумма баллов, удержанных по программе лояльности
&Сериализуемое("cashbackAmount")
&Тип("Строка")
Перем cashbackAmount Экспорт;

// cashbackDiscount - Строка - Компенсация скидки по программе лояльности
&Сериализуемое("cashbackDiscount")
&Тип("Строка")
Перем cashbackDiscount Экспорт;

// cashbackCommissionChange - Строка - Стоимость участия в программе лояльности
&Сериализуемое("cashbackCommissionChange")
&Тип("Строка")
Перем cashbackCommissionChange Экспорт;

// paymentSchedule - Строка - Разовое изменение срока перечисления денежных средств
&Сериализуемое("paymentSchedule")
&Тип("Строка")
Перем paymentSchedule Экспорт;

// deliveryMethod - Строка - Способ продажи и тип товара
&Сериализуемое("deliveryMethod")
&Тип("Строка")
Перем deliveryMethod Экспорт;

// sellerPromoId - Число - ID собственной акции продавца с дополнительной скидкой
&Сериализуемое("sellerPromoId")
&Тип("Число")
Перем sellerPromoId Экспорт;

// sellerPromoDiscount - Число - Размер дополнительной скидки по собственной акции продавца, %
&Сериализуемое("sellerPromoDiscount")
&Тип("Число")
Перем sellerPromoDiscount Экспорт;

// loyaltyId - Число - ID скидки лояльности от продавца
&Сериализуемое("loyaltyId")
&Тип("Число")
Перем loyaltyId Экспорт;

// loyaltyDiscount - Число - Размер скидки лояльности от продавца, %
&Сериализуемое("loyaltyDiscount")
&Тип("Число")
Перем loyaltyDiscount Экспорт;

// uuidPromocode - Строка - ID промокода
&Сериализуемое("uuidPromocode")
&Тип("Строка")
Перем uuidPromocode Экспорт;

// salePricePromocodeDiscountPrc - Число - Скидка за промокод, %
&Сериализуемое("salePricePromocodeDiscountPrc")
&Тип("Число")
Перем salePricePromocodeDiscountPrc Экспорт;

// articleSubstitution - Строка - ID подменного артикула
&Сериализуемое("articleSubstitution")
&Тип("Строка")
Перем articleSubstitution Экспорт;

// salePriceAffiliatedDiscountPrc - Число - Скидка по подменному артикулу, %
&Сериализуемое("salePriceAffiliatedDiscountPrc")
&Тип("Число")
Перем salePriceAffiliatedDiscountPrc Экспорт;

// agencyVat - Число - Удержание Агентского НДС, %. Только для продавцов из Кыргызстана
&Сериализуемое("agencyVat")
&Тип("Число")
Перем agencyVat Экспорт;

// salePriceWholesaleDiscountPrc - Число - Оптовая скидка для бизнеса, %
&Сериализуемое("salePriceWholesaleDiscountPrc")
&Тип("Число")
Перем salePriceWholesaleDiscountPrc Экспорт;

// b2bCustomerTin - Строка - ИНН B2B-покупателя
&Сериализуемое("b2bCustomerTin")
&Тип("Строка")
Перем b2bCustomerTin Экспорт;

// paidWithSocialCertificate - Булево - Оплата социальным сертификатом
&Сериализуемое("paidWithSocialCertificate")
&Тип("Булево")
Перем paidWithSocialCertificate Экспорт;

// warehouseLogisticsCoeff - Число - Коэффициент доставки
&Сериализуемое("warehouseLogisticsCoeff")
&Тип("Число")
Перем warehouseLogisticsCoeff Экспорт;

// buyerTaxRegistrationReasonCode - Строка - КПП B2B-покупателя
&Сериализуемое("buyerTaxRegistrationReasonCode")
&Тип("Строка")
Перем buyerTaxRegistrationReasonCode Экспорт;

// utdUcdNumber - Строка - Номер УПД или УКД
&Сериализуемое("utdUcdNumber")
&Тип("Строка")
Перем utdUcdNumber Экспорт;

// utdUcdDate - Строка - Дата УПД или УКД
&Сериализуемое("utdUcdDate")
&Тип("Строка")
Перем utdUcdDate Экспорт;

// orderUid - Строка - ID корзины заказа — транзакции. Заказы в одной корзине покупателя будут иметь одинаковый `orderUid`
&Сериализуемое("orderUid")
&Тип("Строка")
Перем orderUid Экспорт;

// srid - Строка - ID заказа. В ответах методов сборочных заданий [FBS](./orders-fbs#tag/fbsAssemblyOrders), [DBW](./orders-dbw#tag/dbwAssemblyOrders), [DBS](./dbs#tag/dbsAssembly…
&Сериализуемое("srid")
&Тип("Строка")
Перем srid Экспорт;

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

