@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Text'
@VDM.viewType: #BASIC
define view entity ZBS_I_YTBProductText
  as select from ZBS_B_YTBProductText
  association of exact one to one I_Language as _Language on _Language.Language = $projection.Language
{
      @ObjectModel.foreignKey.association: '_Language'
      @Semantics.language: true
  key Language,
  key ProductId,
      @Semantics.text: true
      ProductText,
      _Language
}
