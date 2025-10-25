@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Position'
@VDM.viewType: #BASIC
define view entity ZBS_I_YTBPosition
  as select from ZBS_B_YTBPosition
  association of exact one to one ZBS_I_YTBHeader  as _Header  on _Header.DocumentId = $projection.DocumentId
  association of exact one to one ZBS_I_YTBProduct as _Product on _Product.ProductId = $projection.ProductId
{
      @ObjectModel.foreignKey.association: '_Header'
  key DocumentId,
  key PositionNo,
      @ObjectModel.foreignKey.association: '_Product'
      ProductId,
      Quantity,
      ProductUnit,
      Price,
      ProductCurrency,
      _Header,
      _Product
}
