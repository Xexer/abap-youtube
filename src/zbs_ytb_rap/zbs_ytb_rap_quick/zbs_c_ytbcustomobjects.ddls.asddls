@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for Custom Objects'
@Metadata.allowExtensions: true
define root view entity ZBS_C_YTBCustomObjects
  provider contract transactional_query
  as projection on ZBS_R_YTBCustomObjects
{
  key ABAPObjectCategory,
  key ABAPObjectType,
  key ABAPObject,
      ABAPObjectResponsibleUser,
      ABAPObjectIsDeleted,
      ABAPPackage,
      ABAPSoftwareComponent,
      _SWC.ABAPSoftwareComponentName as ComponentName
}
