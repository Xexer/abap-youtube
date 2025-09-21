@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header'
@VDM.viewType: #BASIC
define view entity ZBS_B_YTBHeader
  as select from zbs_ytb_header as Header
{
  key document_id   as DocumentId,
      description   as DocumentDescription,
      partner_id    as PartnerId,
      creation_date as CreationDate,
      payment_date  as PaymentDate,
      clerk         as Clerk
}
