CREATE TABLE [dbo].[attendence] 
(
	[id] BIGINT PRIMARY KEY IDENTITY(1,1),
    [students_reg_id]   VARCHAR (50)  NOT NULL,
    [classid]   VARCHAR (50)  NOT NULL,
    [session]   VARCHAR (4)  NOT NULL,
    [date]   DATETIME  NOT NULL,
    [attendence_check]   VARCHAR(1)  NOT NULL,
    CONSTRAINT [FK_attendence_to_students] FOREIGN KEY ([students_reg_id]) REFERENCES [dbo].[students] ([students_reg_id]),
    CONSTRAINT [FK_attendence_to_class] FOREIGN KEY ([classid]) REFERENCES [dbo].[class] ([classid]),
);
