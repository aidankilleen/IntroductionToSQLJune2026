SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ak_UserPurchases](
	[PurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PurchaseDate] [date] NULL,
	[Amount] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ak_UserPurchases] ADD  CONSTRAINT [PK_ak_UserPurchases] PRIMARY KEY CLUSTERED 
(
	[PurchaseId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ak_UserPurchases]  WITH CHECK ADD  CONSTRAINT [FK_ak_UserPurchases_ak_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[ak_Users] ([Id])
GO
ALTER TABLE [dbo].[ak_UserPurchases] CHECK CONSTRAINT [FK_ak_UserPurchases_ak_Users]
GO
