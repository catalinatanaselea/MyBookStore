USE [PersonalDB]
GO
CREATE TABLE [comanda].[comanda_client](
	[id] [smallint] NOT NULL,
	[id_comanda] [smallint] NOT NULL,
	[id_client] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [comanda].[comanda_client]  WITH CHECK ADD FOREIGN KEY([id_client])
REFERENCES [clienti].[clienti] ([id])
GO

ALTER TABLE [comanda].[comanda_client]  WITH CHECK ADD FOREIGN KEY([id_comanda])
REFERENCES [comanda].[comanda] ([id])
GO

