@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner'
@VDM.viewType: #BASIC
define view entity ZBS_I_YTBPartner
  as select from ZBS_B_YTBPartner
  association of exact one to one I_Country as _Country on _Country.Country = $projection.Country
{
  key PartnerId,
      FirstName,
      LastName,
      Street,
      HouseNumber,
      ZipCode,
      Town,
      @ObjectModel.foreignKey.association: '_Country'
      Country,
      _Country
}
