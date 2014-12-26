USE [SyncToday2015]
GO
/****** Object:  Table [dbo].[adapters.google.Contacts]    Script Date: 26. 12. 2014 11:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adapters.google.Contacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[ChangedOn] [datetimeoffset](7) NULL,
	[ExternalId] [nvarchar](max) NULL,
	[AdapterId] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[GivenName] [nvarchar](max) NULL,
	[FamilyName] [nvarchar](max) NULL,
	[OrgDepartment] [nvarchar](max) NULL,
	[OrgJobDescription] [nvarchar](max) NULL,
	[OrgName] [nvarchar](max) NULL,
	[OrgTitle] [nvarchar](max) NULL,
	[PrimaryPhonenumber] [nvarchar](max) NULL,
	[postalAddressCity] [nvarchar](max) NULL,
	[postalAddressStreet] [nvarchar](max) NULL,
	[postalAddressRegion] [nvarchar](max) NULL,
	[postalAddressPostcode] [nvarchar](max) NULL,
	[postalAddressCountry] [nvarchar](max) NULL,
	[postalAddressFormattedAddress] [nvarchar](max) NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_AccountId]    Script Date: 26. 12. 2014 11:55:38 ******/
CREATE NONCLUSTERED INDEX [IX_AccountId] ON [dbo].[adapters.google.Contacts]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AdapterId]    Script Date: 26. 12. 2014 11:55:38 ******/
CREATE NONCLUSTERED INDEX [IX_AdapterId] ON [dbo].[adapters.google.Contacts]
(
	[AdapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ExternalId]    Script Date: 26. 12. 2014 11:55:38 ******/
CREATE NONCLUSTERED INDEX [IX_ExternalId] ON [dbo].[adapters.google.Contacts]
(
	[ContactId] ASC
)
INCLUDE ( 	[ExternalId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Name]    Script Date: 26. 12. 2014 11:55:38 ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[adapters.google.Contacts]
(
	[ContactId] ASC
)
INCLUDE ( 	[OrgName]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OrgName]    Script Date: 26. 12. 2014 11:55:38 ******/
CREATE NONCLUSTERED INDEX [IX_OrgName] ON [dbo].[adapters.google.Contacts]
(
	[ContactId] ASC
)
INCLUDE ( 	[OrgName]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[adapters.google.Contacts]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[entities.Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[adapters.google.Contacts]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[entities.Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[adapters.google.Contacts]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[entities.Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[adapters.google.Contacts]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[entities.Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[adapters.google.Contacts]  WITH CHECK ADD FOREIGN KEY([AdapterId])
REFERENCES [dbo].[sync_Adapters] ([AdapterId])
GO
ALTER TABLE [dbo].[adapters.google.Contacts]  WITH CHECK ADD FOREIGN KEY([AdapterId])
REFERENCES [dbo].[sync_Adapters] ([AdapterId])
GO
ALTER TABLE [dbo].[adapters.google.Contacts]  WITH CHECK ADD FOREIGN KEY([AdapterId])
REFERENCES [dbo].[sync_Adapters] ([AdapterId])
GO
ALTER TABLE [dbo].[adapters.google.Contacts]  WITH CHECK ADD FOREIGN KEY([AdapterId])
REFERENCES [dbo].[sync_Adapters] ([AdapterId])
GO
