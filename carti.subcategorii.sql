USE [PersonalDB]
GO
CREATE TABLE [carti].[subcategorii](
	[id] [smallint] NOT NULL,
	[id_categ] [smallint] NOT NULL,
	[subcategorie] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [carti].[subcategorii]  WITH CHECK ADD FOREIGN KEY([id_categ])
REFERENCES [carti].[categorii] ([id])
GO


