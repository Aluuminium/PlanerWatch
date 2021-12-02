USE [18ip49]
GO
/****** Object:  Table [dbo].[Должность]    Script Date: 01.12.2021 15:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должность](
	[ID должности] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Должность] PRIMARY KEY CLUSTERED 
(
	[ID должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Задача]    Script Date: 01.12.2021 15:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Задача](
	[ID задачи] [int] IDENTITY(1,1) NOT NULL,
	[Срок выполнения] [date] NOT NULL,
	[Комментарий] [nvarchar](max) NOT NULL,
	[Файл] [nvarchar](max) NULL,
	[ID сотрудника] [int] NOT NULL,
	[ID статуса] [int] NOT NULL,
 CONSTRAINT [PK_Задача] PRIMARY KEY CLUSTERED 
(
	[ID задачи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Задачи по сотрудникам]    Script Date: 01.12.2021 15:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Задачи по сотрудникам](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID сотрудника] [int] NOT NULL,
	[ID задачи] [int] NOT NULL,
 CONSTRAINT [PK_Задачи по сотрудникам] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[История изменений статуса]    Script Date: 01.12.2021 15:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[История изменений статуса](
	[ID изменения] [int] IDENTITY(1,1) NOT NULL,
	[ID статуса] [int] NOT NULL,
	[ID задачи] [int] NOT NULL,
	[Дата/время Изменения] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_История изменений статуса] PRIMARY KEY CLUSTERED 
(
	[ID изменения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отдел]    Script Date: 01.12.2021 15:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отдел](
	[ID отдела] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Начальник отдела] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Отдел] PRIMARY KEY CLUSTERED 
(
	[ID отдела] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 01.12.2021 15:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[ID сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](max) NOT NULL,
	[Телефон] [nvarchar](50) NOT NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[Паспорт] [nvarchar](max) NOT NULL,
	[ID отдела] [int] NOT NULL,
	[ID должности] [int] NOT NULL,
 CONSTRAINT [PK_Сотрудник] PRIMARY KEY CLUSTERED 
(
	[ID сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус задачи]    Script Date: 01.12.2021 15:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус задачи](
	[ID статуса] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Статус задачи] PRIMARY KEY CLUSTERED 
(
	[ID статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Задача]  WITH CHECK ADD  CONSTRAINT [FK_Задача_Сотрудник] FOREIGN KEY([ID сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID сотрудника])
GO
ALTER TABLE [dbo].[Задача] CHECK CONSTRAINT [FK_Задача_Сотрудник]
GO
ALTER TABLE [dbo].[Задача]  WITH CHECK ADD  CONSTRAINT [FK_Задача_Статус задачи] FOREIGN KEY([ID статуса])
REFERENCES [dbo].[Статус задачи] ([ID статуса])
GO
ALTER TABLE [dbo].[Задача] CHECK CONSTRAINT [FK_Задача_Статус задачи]
GO
ALTER TABLE [dbo].[Задачи по сотрудникам]  WITH CHECK ADD  CONSTRAINT [FK_Задачи по сотрудникам_Задача] FOREIGN KEY([ID задачи])
REFERENCES [dbo].[Задача] ([ID задачи])
GO
ALTER TABLE [dbo].[Задачи по сотрудникам] CHECK CONSTRAINT [FK_Задачи по сотрудникам_Задача]
GO
ALTER TABLE [dbo].[Задачи по сотрудникам]  WITH CHECK ADD  CONSTRAINT [FK_Задачи по сотрудникам_Сотрудник] FOREIGN KEY([ID сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID сотрудника])
GO
ALTER TABLE [dbo].[Задачи по сотрудникам] CHECK CONSTRAINT [FK_Задачи по сотрудникам_Сотрудник]
GO
ALTER TABLE [dbo].[История изменений статуса]  WITH CHECK ADD  CONSTRAINT [FK_История изменений статуса_Статус задачи] FOREIGN KEY([ID статуса])
REFERENCES [dbo].[Статус задачи] ([ID статуса])
GO
ALTER TABLE [dbo].[История изменений статуса] CHECK CONSTRAINT [FK_История изменений статуса_Статус задачи]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Должность] FOREIGN KEY([ID должности])
REFERENCES [dbo].[Должность] ([ID должности])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Должность]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Отдел] FOREIGN KEY([ID отдела])
REFERENCES [dbo].[Отдел] ([ID отдела])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Отдел]
GO
