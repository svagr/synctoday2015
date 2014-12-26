USE [SyncToday2015]
GO
/****** Object:  StoredProcedure [dbo].[adapters.google.Accounts]    Script Date: 26. 12. 2014 11:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[adapters.google.Accounts] 
AS
BEGIN
	Declare @affected int

	Select @affected = 0

INSERT INTO [dbo].[entities.Accounts]
           ([ChangedOn]
           ,[ExternalId]
           ,[AdapterId]
           ,[Name]
           ,[IC]
           ,[DIC]
           ,[Email]
           ,[PrimaryPhonenumber]
           ,[City]
           ,[Street]
           ,[Region]
           ,[Postcode]
           ,[Country]
           ,[FormattedAddress]
           ,[Note])

SELECT 
	[ChangedOn],
[adapters.google.Contacts].[ExternalId],
[adapters.google.Contacts].[AdapterId],
RTRIM(LTRIM(ISNULL([adapters.google.Contacts].GivenName, '') + ' ' + ISNULL([adapters.google.Contacts].FamilyName, '' ))),
NULL,
NULL,
[Email],
[PrimaryPhonenumber],
[postalAddressCity],
[postalAddressStreet],
[postalAddressRegion],
[postalAddressPostcode],
[postalAddressCountry],
[postalAddressFormattedAddress],
[Content]
  FROM [dbo].[adapters.google.Contacts]
inner join [dbo].[changesets.Accounts] on [changesets.Accounts].ExternalId = [adapters.google.Contacts].ExternalId
where LEN(RTRIM(LTRIM(ISNULL([adapters.google.Contacts].GivenName, '') + ' ' + ISNULL([adapters.google.Contacts].FamilyName, '' )))) > 0
and [adapters.google.Contacts].AccountId is null
and not exists(
	select AccountId from [entities.Accounts] A1 where A1.ExternalId = [adapters.google.Contacts].[ExternalId] )

	select @affected = @affected + @@ROWCOUNT


INSERT INTO [dbo].[entities.Accounts]
           ([ChangedOn]
           ,[ExternalId]
           ,[AdapterId]
           ,[Name]
           ,[IC]
           ,[DIC]
           ,[Email]
           ,[PrimaryPhonenumber]
           ,[City]
           ,[Street]
           ,[Region]
           ,[Postcode]
           ,[Country]
           ,[FormattedAddress]
           ,[Note])

SELECT 
	[ChangedOn],
[adapters.google.Contacts].[ExternalId],
[adapters.google.Contacts].[AdapterId],
[OrgName],
NULL,
NULL,
[Email],
[PrimaryPhonenumber],
[postalAddressCity],
[postalAddressStreet],
[postalAddressRegion],
[postalAddressPostcode],
[postalAddressCountry],
[postalAddressFormattedAddress],
[Content]
  FROM [dbo].[adapters.google.Contacts]
inner join [dbo].[changesets.Accounts] on [changesets.Accounts].ExternalId = [adapters.google.Contacts].ExternalId
where 
[adapters.google.Contacts].AccountId is null and 
[OrgName] is not null and LEN([OrgName])>0
and not exists(
	select AccountId from [entities.Accounts] A1 where A1.ExternalId = [adapters.google.Contacts].[ExternalId] )


	select @affected = @affected + @@ROWCOUNT

END



GO
