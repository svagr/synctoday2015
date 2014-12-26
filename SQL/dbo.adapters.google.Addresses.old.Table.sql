USE [SyncToday2015]
GO
/****** Object:  Table [dbo].[adapters.google.Addresses.old]    Script Date: 26. 12. 2014 11:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adapters.google.Addresses.old](
	[AddressId] [int] NOT NULL,
	[City] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[Region] [nvarchar](max) NULL,
	[Postcode] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Formatted] [nvarchar](max) NULL,
	[Label] [nvarchar](max) NULL,
	[ContactId] [int] NULL,
	[Usage] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
