USE [PersonalDB]
GO
CREATE TABLE [clienti].[clienti](
	[id] [smallint] NOT NULL,
	[prenume] [varchar](50) NULL,
	[nume] [varchar](40) NULL,
	[email] [varchar](50) NOT NULL,
	[telefon] [char](9) NOT NULL,
	[data_de_nastere] [date] NOT NULL,
	[id_adresa] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [clienti].[clienti]  WITH CHECK ADD FOREIGN KEY([id_adresa])
REFERENCES [clienti].[adresa] ([id])
GO


