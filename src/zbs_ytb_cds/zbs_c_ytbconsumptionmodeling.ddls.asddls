@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Modeling'
@VDM.viewType: #CONSUMPTION
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBS_C_YTBConsumptionModeling
  as select from ZBS_I_YTBPosition
{
  key DocumentId,
  key PositionNo,
      _Header.PartnerId,
      concat_with_space( _Header._Partner.FirstName, _Header._Partner.LastName, 1 ) as PartnerName,
      ProductId,
      _Product._Text[ Language = $session.system_language ].ProductText,
      @Semantics.amount.currencyCode: 'Currency'
      Price                                                                         as PositionPrice,
      ProductCurrency                                                               as Currency,
      case when Quantity >= 5 then 'High'
           when Quantity >= 2 then 'Medium'
           else 'Low'
      end                                                                           as PerformerRank,
      $session.system_date                                                          as ExecutionDate
}
