USE [SyncToday2015]
GO
/****** Object:  StoredProcedure [dbo].[adapters.google.old.Accounts]    Script Date: 26. 12. 2014 11:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[adapters.google.old.Accounts]
AS
BEGIN

delete [dbo].[adapters.google.Contacts.old]

INSERT INTO [dbo].[adapters.google.Contacts.old]
           ([ContactId]
           ,[ChangedOn]
           ,[ExternalId]
           ,[AdapterId]
           ,[Content]
           ,[Title]
           ,[Email]
           ,[GivenName]
           ,[FamilyName]
           ,[OrgDepartment]
           ,[OrgJobDescription]
           ,[OrgName]
           ,[OrgTitle]
           ,[GroupId]
           ,[PrimaryPhonenumber]
           ,[postalAddressCity]
           ,[postalAddressStreet]
           ,[postalAddressRegion]
           ,[postalAddressPostcode]
           ,[postalAddressCountry]
           ,[postalAddressFormattedAddress]
           ,[AccountId])
select * from [dbo].[adapters.google.Contacts]


delete [adapters.google.Groups.old]
INSERT INTO [dbo].[adapters.google.Groups.old]
           ([GroupId]
           ,[ChangedOn]
           ,[ExternalId]
           ,[AdapterId]
           ,[Title])
	select * from [adapters.google.Groups]




END


GO
