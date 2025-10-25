@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product text'
@VDM.viewType: #BASIC
@VDM.private: true
define view entity ZBS_B_YTBProductText
  as select from zbs_ytb_productt
{
  key language     as Language,
  key product_id   as ProductId,
      product_text as ProductText
}
