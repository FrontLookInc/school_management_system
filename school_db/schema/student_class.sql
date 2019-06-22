CREATE TABLE [dbo].[student_class]
(
	[student_classid] VARCHAR(50) NOT NULL PRIMARY KEY,
	[students_reg_id] VARCHAR(50) NOT NULL,
	[classid] VARCHAR (50) NOT NULL,
	[attendence] VARCHAR (1) NOT NULL,
	[promotion_check] VARCHAR (1) NOT NULL,
	[session] VARCHAR (4) NOT NULL,
	[update_time] DATETIME NOT NULL,
    [updated_by]          VARCHAR (50)  NOT NULL,
    CONSTRAINT [FK_student_class_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [admin_manager] ([userid]), 
    CONSTRAINT [FK_student_class_To_students] FOREIGN KEY ([students_reg_id]) REFERENCES [students]([students_reg_id]),
    CONSTRAINT [FK_student_class_To_class] FOREIGN KEY ([classid]) REFERENCES [class]([classid]),
);