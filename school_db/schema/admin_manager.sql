CREATE TABLE [dbo].[admin_manager] (
	[id] int IDENTITY(1,1),
    [userid]              VARCHAR (50)  NOT NULL,
    [password]            VARCHAR (50)  NOT NULL,
    [user_role]           VARCHAR (50)  NOT NULL,
    [user_security_level] VARCHAR (50)  NOT NULL,
    [user_name]           VARCHAR (MAX) NOT NULL,
    [user_address]        VARCHAR (MAX) NOT NULL,
    [user_contact_no]     VARCHAR (20)  NOT NULL,
    [user_contact_no2]    VARCHAR (20)  NOT NULL,
    [user_emailid]        VARCHAR (MAX) NOT NULL,
    [update_time]         DATETIME      NULL,
    [updated_by]          VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([userid] ASC),
    CONSTRAINT [FK_admin_manager_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [dbo].[admin_manager] ([userid])
);