CREATE TABLE [dbo].[subjects]
(
	[subject_code] VARCHAR(50) NOT NULL PRIMARY KEY,
	[subject_name] VARCHAR(50) NOT NULL,
	[written] DECIMAL(3,2),
	[oral] DECIMAL(3,2),
	[update_time] DATETIME NOT NULL,
    [updated_by]          VARCHAR (50)  NOT NULL,
    CONSTRAINT [FK_subjects_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [dbo].[admin_manager] ([userid])
)