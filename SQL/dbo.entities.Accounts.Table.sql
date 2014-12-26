USE [SyncToday2015]
GO
/****** Object:  Table [dbo].[entities.Accounts]    Script Date: 26. 12. 2014 11:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entities.Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[ChangedOn] [datetimeoffset](7) NULL,
	[ExternalId] [nvarchar](max) NULL,
	[AdapterId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IC] [nvarchar](max) NULL,
	[DIC] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PrimaryPhonenumber] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[Region] [nvarchar](max) NULL,
	[Postcode] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[FormattedAddress] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Name]    Script Date: 26. 12. 2014 11:55:38 ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[entities.Accounts]
(
	[AccountId] ASC
)
INCLUDE ( 	[Name]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[entities.Accounts]  WITH CHECK ADD FOREIGN KEY([AdapterId])
REFERENCES [dbo].[sync_Adapters] ([AdapterId])
GO
