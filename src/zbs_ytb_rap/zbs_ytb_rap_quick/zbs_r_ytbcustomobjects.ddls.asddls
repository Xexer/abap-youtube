@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Objects'
define root view entity ZBS_R_YTBCustomObjects
  as select from I_CustABAPObjDirectoryEntry
  association of exact one to one I_CustABAPSoftwareComponentTxt as _SWC on  _SWC.ABAPSoftwareComponent = $projection.ABAPSoftwareComponent
                                                                         and _SWC.Language              = $session.system_language
{
  key ABAPObjectCategory,
  key ABAPObjectType,
  key ABAPObject,
      ABAPObjectResponsibleUser,
      ABAPObjectIsDeleted,
      ABAPPackage,
      ABAPSoftwareComponent,
      _SWC
}
where
  ABAPObjectResponsibleUser = $session.user
