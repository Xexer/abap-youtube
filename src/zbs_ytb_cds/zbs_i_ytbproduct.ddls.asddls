@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product'
@VDM.viewType: #BASIC
define view entity ZBS_I_YTBProduct
  as select from ZBS_B_YTBProduct
  association of one       to many ZBS_I_YTBProductText as _Text     on _Text.ProductId = $projection.ProductId
  association of exact one to one I_UnitOfMeasure       as _Unit     on _Unit.UnitOfMeasure = $projection.ProductUnit
  association of exact one to one I_Currency            as _Currency on _Currency.Currency = $projection.ProductCurrency
{
      @ObjectModel.text.association: '_Text'
  key ProductId,
      @ObjectModel.foreignKey.association: '_Unit'
      ProductUnit,
      @ObjectModel.foreignKey.association: '_Currency'
      ProductCurrency,
      _Text,
      _Unit,
      _Currency
}
