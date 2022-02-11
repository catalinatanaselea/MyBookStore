USE [PersonalDB]
GO

/****** Object:  Table [carti].[carti]    Script Date: 11/02/2022 13:18:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [carti].[carti](
	[id] [smallint] NOT NULL,
	[id_categ] [smallint] NOT NULL,
	[id_subcateg] [smallint] NULL,
	[titlu_carte] [varchar](80) NOT NULL,
	[id_editura] [smallint] NULL,
	[an] [char](4) NULL,
	[pret] [decimal](5, 2) NULL,
	[id_dispo] [tinyint] NULL,
	[id_limba] [tinyint] NULL,
	[id_coperta] [tinyint] NULL,
	[nrpagini] [smallint] NULL,
	[ISBN] [char](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [carti].[carti]  WITH CHECK ADD FOREIGN KEY([id_categ])
REFERENCES [carti].[categorii] ([id])
GO

ALTER TABLE [carti].[carti]  WITH CHECK ADD FOREIGN KEY([id_coperta])
REFERENCES [carti].[coperta] ([id])
GO

ALTER TABLE [carti].[carti]  WITH CHECK ADD FOREIGN KEY([id_dispo])
REFERENCES [carti].[disponibilitate] ([id])
GO

ALTER TABLE [carti].[carti]  WITH CHECK ADD FOREIGN KEY([id_editura])
REFERENCES [carti].[editura] ([id])
GO

ALTER TABLE [carti].[carti]  WITH CHECK ADD FOREIGN KEY([id_limba])
REFERENCES [carti].[limba] ([id])
GO

ALTER TABLE [carti].[carti]  WITH CHECK ADD FOREIGN KEY([id_subcateg])
REFERENCES [carti].[subcategorii] ([id])
GO


