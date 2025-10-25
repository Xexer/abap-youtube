@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header'
@VDM.viewType: #BASIC
define view entity ZBS_I_YTBHeader
  as select from ZBS_B_YTBHeader
  association of one       to one ZBS_I_YTBPartner    as _Partner  on _Partner.PartnerId = $projection.PartnerId
  association of one       to many ZBS_I_YTBPosition  as _Position on _Position.DocumentId = $projection.DocumentId
  association of exact one to one I_BusinessUserBasic as _User     on _User.UserID = $projection.Clerk
{
  key DocumentId,
      DocumentDescription,
      @ObjectModel.foreignKey.association: '_Partner'
      PartnerId,
      CreationDate,
      PaymentDate,
      @ObjectModel.foreignKey.association: '_User'
      Clerk,
      _Partner,
      _Position,
      _User
}
