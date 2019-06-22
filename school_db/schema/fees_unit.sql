CREATE TABLE [dbo].[fees_unit]
(
	[unit_id] VARCHAR(50) NOT NULL PRIMARY KEY,
	[unit_name] VARCHAR(50) NOT NULL,
	[unit_price] DECIMAL(10,2) NOT NULL,
	[update_time] DATETIME NOT NULL,
    [updated_by]          VARCHAR (50)  NOT NULL,
    CONSTRAINT [FK_fees_unit_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [dbo].[admin_manager] ([userid])
)