USE [PersonalDB]
GO
CREATE TABLE [carti].[carti_autor](
	[id] [smallint] NOT NULL,
	[id_carte] [smallint] NOT NULL,
	[id_autor] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [carti].[carti_autor]  WITH CHECK ADD FOREIGN KEY([id_autor])
REFERENCES [carti].[autor] ([id])
GO

ALTER TABLE [carti].[carti_autor]  WITH CHECK ADD FOREIGN KEY([id_carte])
REFERENCES [carti].[carti] ([id])
GO

