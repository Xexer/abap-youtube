@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner'
@VDM.viewType: #BASIC
@VDM.private: true
define view entity ZBS_B_YTBPartner
  as select from zbs_ytb_partner
{
  key partner_id   as PartnerId,
      first_name   as FirstName,
      last_name    as LastName,
      street       as Street,
      house_number as HouseNumber,
      zip_code     as ZipCode,
      town         as Town,
      country      as Country
}
