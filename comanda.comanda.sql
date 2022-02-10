USE [PersonalDB]
GO

/****** Object:  Table [comanda].[comanda]    Script Date: 10/02/2022 02:06:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [comanda].[comanda](
	[id] [smallint] NOT NULL,
	[data_comanda] [date] NOT NULL,
	[numar_comanda] [char](8) NOT NULL,
	[id_carte] [smallint] NOT NULL,
	[cant_carti] [tinyint] NOT NULL,
	[pret] [decimal](5, 2) NOT NULL,
	[id_adresa] [tinyint] NOT NULL,
	[id_livrare] [tinyint] NOT NULL,
	[id_plata] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [comanda].[comanda]  WITH CHECK ADD FOREIGN KEY([id_adresa])
REFERENCES [clienti].[adresa] ([id])
GO

ALTER TABLE [comanda].[comanda]  WITH CHECK ADD FOREIGN KEY([id_carte])
REFERENCES [carti].[carti] ([id])
GO

ALTER TABLE [comanda].[comanda]  WITH CHECK ADD FOREIGN KEY([id_livrare])
REFERENCES [comanda].[livrare] ([id])
GO

ALTER TABLE [comanda].[comanda]  WITH CHECK ADD FOREIGN KEY([id_plata])
REFERENCES [comanda].[plata] ([id])
GO


