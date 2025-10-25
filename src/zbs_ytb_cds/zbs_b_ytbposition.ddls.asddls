@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Position'
@VDM.viewType: #BASIC
@VDM.private: true
define view entity ZBS_B_YTBPosition
  as select from zbs_ytb_position
  association of one to one ZBS_B_YTBProduct as _Product on _Product.ProductId = $projection.ProductId
{
  key document_id as DocumentId,
  key position_no as PositionNo,
      product_id  as ProductId,
      @Semantics.quantity.unitOfMeasure: 'ProductUnit'
      quantity    as Quantity,
      _Product.ProductUnit,
      @Semantics.amount.currencyCode: 'ProductCurrency'
      price       as Price,
      _Product.ProductCurrency
}
