USE [PersonalDB]
GO

/****** Object:  Table [clienti].[clienti]    Script Date: 22/01/2022 18:19:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [clienti].[clienti](
	[id] [tinyint] NOT NULL,
	[prenume] [varchar](25) NOT NULL,
	[nume] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[telefon] [int] NOT NULL,
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

