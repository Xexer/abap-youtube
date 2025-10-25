@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product'
@VDM.viewType: #BASIC
@VDM.private: true
define view entity ZBS_B_YTBProduct
  as select from zbs_ytb_product
{
  key product_id       as ProductId,
      product_unit     as ProductUnit,
      product_currency as ProductCurrency
}
