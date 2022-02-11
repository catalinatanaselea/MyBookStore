USE [PersonalDB]
GO
CREATE TABLE [clienti].[adresa](
	[id] [tinyint] NOT NULL,
	[strada] [varchar](50) NOT NULL,
	[nr_strada] [smallint] NOT NULL,
	[id_localitate] [tinyint] NOT NULL,
	[id_judet] [tinyint] NOT NULL,
	[id_tara] [tinyint] NOT NULL,
	[cod_postal] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [clienti].[adresa]  WITH CHECK ADD FOREIGN KEY([id_judet])
REFERENCES [adresa].[judet] ([id])
GO

ALTER TABLE [clienti].[adresa]  WITH CHECK ADD FOREIGN KEY([id_localitate])
REFERENCES [adresa].[localitate] ([id])
GO

ALTER TABLE [clienti].[adresa]  WITH CHECK ADD FOREIGN KEY([id_tara])
REFERENCES [adresa].[tara] ([id])
GO


