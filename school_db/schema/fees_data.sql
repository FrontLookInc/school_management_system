CREATE TABLE [dbo].[fees_data] 
(
	[transaction_id] VARCHAR(50) PRIMARY KEY,
    [students_reg_id]   VARCHAR (50)  NOT NULL,
    [date]   datetime  NOT NULL,
    [fees_structure_id]   VARCHAR (50)  NOT NULL,
    [fees_type]   VARCHAR (50)  NOT NULL,
    [amount]   DECIMAL(10,2)  NOT NULL,
	[session] VARCHAR(4) NOT NULL,
    CONSTRAINT [FK_fees_data_to_students] FOREIGN KEY ([students_reg_id]) REFERENCES [dbo].[students] ([students_reg_id]),
    CONSTRAINT [FK_fees_data_to_fees_structure_id] FOREIGN KEY ([fees_structure_id]) REFERENCES [dbo].[fees_structure] ([fees_structure_id]),
);
