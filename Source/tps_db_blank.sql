USE [tpsonline]
GO
ALTER TABLE [tpsonline].[staff] DROP CONSTRAINT [FK_staff_user]
GO
ALTER TABLE [tpsonline].[request] DROP CONSTRAINT [FK_request_user]
GO
ALTER TABLE [tpsonline].[request] DROP CONSTRAINT [FK_request_contract]
GO
ALTER TABLE [tpsonline].[contract] DROP CONSTRAINT [FK_contract_user]
GO
ALTER TABLE [tpsonline].[client] DROP CONSTRAINT [FK_client_user]
GO
ALTER TABLE [tpsonline].[user] DROP CONSTRAINT [IX_user]
GO
DROP TABLE [tpsonline].[user]
GO
DROP TABLE [tpsonline].[staff]
GO
DROP TABLE [tpsonline].[request]
GO
DROP TABLE [tpsonline].[contract]
GO
DROP TABLE [tpsonline].[client]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tpsonline].[client](
	[userid] [bigint] NOT NULL,
	[company] [varchar](60) NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tpsonline].[contract](
	[contractid] [bigint] IDENTITY(1,1) NOT NULL,
	[userid] [bigint] NOT NULL,
	[cname] [varchar](60) NULL,
	[description] [text] NULL,
	[field] [varchar](60) NULL,
	[zip] [bigint] NULL,
	[sal] [int] NULL,
	[exp] [int] NULL,
	[edu] [int] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_contract] PRIMARY KEY CLUSTERED 
(
	[contractid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tpsonline].[request](
	[requestid] [bigint] IDENTITY(1,1) NOT NULL,
	[contractid] [bigint] NOT NULL,
	[userid] [bigint] NOT NULL,
	[approval] [int] NOT NULL,
 CONSTRAINT [PK_request] PRIMARY KEY CLUSTERED 
(
	[requestid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tpsonline].[staff](
	[userid] [bigint] NOT NULL,
	[pic] [varchar](100) NULL,
	[zip] [bigint] NULL,
	[field] [varchar](60) NULL,
	[exp] [int] NULL,
	[edu] [int] NULL,
	[sal] [int] NULL,
	[resume] [text] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_staff_1] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tpsonline].[user](
	[userid] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](60) NOT NULL,
	[pwd] [varchar](90) NOT NULL,
	[salt] [bigint] NOT NULL,
	[account] [int] NOT NULL,
	[fname] [varchar](60) NULL,
	[lname] [varchar](60) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](90) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
ALTER TABLE [tpsonline].[user] ADD  CONSTRAINT [IX_user] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [tpsonline].[client]  WITH CHECK ADD  CONSTRAINT [FK_client_user] FOREIGN KEY([userid])
REFERENCES [tpsonline].[user] ([userid])
GO
ALTER TABLE [tpsonline].[client] CHECK CONSTRAINT [FK_client_user]
GO
ALTER TABLE [tpsonline].[contract]  WITH CHECK ADD  CONSTRAINT [FK_contract_user] FOREIGN KEY([userid])
REFERENCES [tpsonline].[user] ([userid])
GO
ALTER TABLE [tpsonline].[contract] CHECK CONSTRAINT [FK_contract_user]
GO
ALTER TABLE [tpsonline].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_contract] FOREIGN KEY([contractid])
REFERENCES [tpsonline].[contract] ([contractid])
GO
ALTER TABLE [tpsonline].[request] CHECK CONSTRAINT [FK_request_contract]
GO
ALTER TABLE [tpsonline].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_user] FOREIGN KEY([userid])
REFERENCES [tpsonline].[user] ([userid])
GO
ALTER TABLE [tpsonline].[request] CHECK CONSTRAINT [FK_request_user]
GO
ALTER TABLE [tpsonline].[staff]  WITH CHECK ADD  CONSTRAINT [FK_staff_user] FOREIGN KEY([userid])
REFERENCES [tpsonline].[user] ([userid])
GO
ALTER TABLE [tpsonline].[staff] CHECK CONSTRAINT [FK_staff_user]
GO
