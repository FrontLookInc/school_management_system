/*ADMIN MANAGER*/
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

/*STUDENTS*/
CREATE TABLE [dbo].[students]
(
	[students_reg_id] VARCHAR(50) NOT NULL PRIMARY KEY,
    [name]            VARCHAR (MAX) NOT NULL,
    [gender]          VARCHAR (20)  NULL,
    [religion]        VARCHAR (MAX) NULL,
    [caste]           VARCHAR (MAX) NULL,
    [blood_group]     VARCHAR (15)  NULL,
    [dob]             DATE          NOT NULL,
    [father_name]     VARCHAR (MAX) NULL,
    [mother_name]     VARCHAR (MAX) NULL,
    [guardian_name]   VARCHAR (MAX) NOT NULL,
    [p_address_hno]   VARCHAR (MAX) NULL,
    [p_address_area]  VARCHAR (MAX) NULL,
    [p_address_city]  VARCHAR (MAX) NULL,
    [p_address_pin]   INT           NULL,
    [p_address_dist]  VARCHAR (MAX) NULL,
    [p_address_state] VARCHAR (MAX) NULL,
    [l_address_hno]   VARCHAR (MAX) NULL,
    [l_address_area]  VARCHAR (MAX) NULL,
    [l_address_city]  VARCHAR (MAX) NULL,
    [l_address_pin]   INT           NULL,
    [l_address_dist]  VARCHAR (MAX) NULL,
    [l_address_state] VARCHAR (MAX) NULL,
    [contact_no1]     VARCHAR (20)  NULL,
    [contact_no2]     VARCHAR (20)  NULL,
    [email_id]        VARCHAR (MAX) NULL,
    [tc_from]         VARCHAR (50)  NULL,
    [admission_date]  DATETIME      NULL,
    [note]            VARCHAR (MAX) NULL,
    [tc]                BIT           NOT NULL DEFAULT 0,
    [tc_to]           VARCHAR (50)  NULL,
	[x_students_reg_id] VARCHAR (50)  NULL,
    [password]        VARCHAR (50)  NULL,
    [update_time]     DATETIME      NULL,
    [updated_by]      VARCHAR (50)  NULL,
	[obsolate]          BIT          NOT NULL DEFAULT 0,
    CONSTRAINT [FK_students_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [admin_manager]([userid]),
    CONSTRAINT [FK_students_to_students] FOREIGN KEY (x_students_reg_id) REFERENCES [students]([students_reg_id]),
);

/*SUBJECTS*/
CREATE TABLE [dbo].[subjects]
(
	[subject_code] VARCHAR(50) NOT NULL PRIMARY KEY,
	[subject_name] VARCHAR(50) NOT NULL,
	[written] INT,
	[oral] INT,
	[practical] INT,
	[update_time] DATETIME NOT NULL,
    [updated_by] VARCHAR (50)  NOT NULL,
    CONSTRAINT [FK_subjects_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [dbo].[admin_manager] ([userid])
);

/*CLASS*/
CREATE TABLE [dbo].[class]
(
    [classid] VARCHAR (50) NOT NULL PRIMARY KEY,
	[class_name] VARCHAR(50) NOT NULL,
	[class_section] VARCHAR(30) NOT NULL,
    [s01] VARCHAR (50) NULL,
    [s02] VARCHAR (50) NULL,
    [s03] VARCHAR (50) NULL,
    [s04] VARCHAR (50) NULL,
    [s05] VARCHAR (50) NULL,
    [s06] VARCHAR (50) NULL,
    [s07] VARCHAR (50) NULL,
    [s08] VARCHAR (50) NULL,
    [s09] VARCHAR (50) NULL,
    [s10] VARCHAR (50) NULL, 
	[update_time] DATETIME NOT NULL,
    [updated_by] VARCHAR (50) NOT NULL,
    CONSTRAINT [FK_class_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [dbo].[admin_manager] ([userid]),
    CONSTRAINT [FK_class_to_subject01] FOREIGN KEY ([s01]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject02] FOREIGN KEY ([s02]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject03] FOREIGN KEY ([s03]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject04] FOREIGN KEY ([s04]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject05] FOREIGN KEY ([s05]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject06] FOREIGN KEY ([s06]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject07] FOREIGN KEY ([s07]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject08] FOREIGN KEY ([s08]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject09] FOREIGN KEY ([s09]) REFERENCES [subjects]([subject_code]),
    CONSTRAINT [FK_class_to_subject10] FOREIGN KEY ([s10]) REFERENCES [subjects]([subject_code]),
);

/*STUDENT CLASS*/
CREATE TABLE [dbo].[student_class]
(
	[student_classid] VARCHAR(50) NOT NULL PRIMARY KEY,
	[students_reg_id] VARCHAR(50) NOT NULL,
	[classid] VARCHAR (50) NOT NULL,
    [attendence]      VARCHAR (1)  NULL,
    [promotion_check] VARCHAR (1)  NULL,
	[session] VARCHAR (4) NOT NULL,
	[update_time] DATETIME NOT NULL,
    [updated_by]          VARCHAR (50)  NOT NULL,
    CONSTRAINT [FK_student_class_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [admin_manager] ([userid]), 
    CONSTRAINT [FK_student_class_To_students] FOREIGN KEY ([students_reg_id]) REFERENCES [students]([students_reg_id]),
    CONSTRAINT [FK_student_class_To_class] FOREIGN KEY ([classid]) REFERENCES [class]([classid]),
);

/*ATTENDENCE*/
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


/*FEES UNIT DETAILS*/
CREATE TABLE [dbo].[fees_unit]
(
	[unit_id] VARCHAR(50) NOT NULL PRIMARY KEY,
	[unit_name] VARCHAR(50) NOT NULL,
    [unit_price]  MONEY NOT NULL,
	[update_time] DATETIME NOT NULL,
    [updated_by]          VARCHAR (50)  NOT NULL,
    CONSTRAINT [FK_fees_unit_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [dbo].[admin_manager] ([userid])
);

/*FEES STRUCTURE*/
CREATE TABLE [dbo].[fees_structure]
(
	[fees_structure_id] VARCHAR(50) NOT NULL PRIMARY KEY,
	[unit_id01] VARCHAR(50),
	[unit_id02] VARCHAR(50),
	[unit_id03] VARCHAR(50),
	[unit_id04] VARCHAR(50),
	[unit_id05] VARCHAR(50),
	[unit_id06] VARCHAR(50),
	[unit_id07] VARCHAR(50),
	[unit_id08] VARCHAR(50),
	[unit_id09] VARCHAR(50),
	[unit_id10] VARCHAR(50), 
    [creation_time] DATETIME NULL,
    [created_by] VARCHAR (50) NULL,
    CONSTRAINT [FK_fees_structure_to_admin_manager] FOREIGN KEY ([created_by]) REFERENCES [dbo].[admin_manager] ([userid]),
    CONSTRAINT [FK_fees_structure_to_fees_unit01] FOREIGN KEY ([unit_id01]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit02] FOREIGN KEY ([unit_id02]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit03] FOREIGN KEY ([unit_id03]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit04] FOREIGN KEY ([unit_id04]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit05] FOREIGN KEY ([unit_id05]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit06] FOREIGN KEY ([unit_id06]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit07] FOREIGN KEY ([unit_id07]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit08] FOREIGN KEY ([unit_id08]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit09] FOREIGN KEY ([unit_id09]) REFERENCES [fees_unit]([unit_id]),
    CONSTRAINT [FK_fees_structure_to_fees_unit10] FOREIGN KEY ([unit_id10]) REFERENCES [fees_unit]([unit_id]),
);

/*FEES DATA*/
CREATE TABLE [dbo].[fees_data] 
(
	[transaction_id] VARCHAR(50) PRIMARY KEY,
    [students_reg_id]   VARCHAR (50)  NOT NULL,
    [date]   datetime  NOT NULL,
    [fees_structure_id]   VARCHAR (50)  NOT NULL,
    [fees_type]   VARCHAR (50)  NOT NULL,
    [amount]   MONEY  NOT NULL,
	[session] VARCHAR(4) NOT NULL,
    CONSTRAINT [FK_fees_data_to_students] FOREIGN KEY ([students_reg_id]) REFERENCES [dbo].[students] ([students_reg_id]),
    CONSTRAINT [FK_fees_data_to_fees_structure_id] FOREIGN KEY ([fees_structure_id]) REFERENCES [dbo].[fees_structure] ([fees_structure_id]),
);

/*MARKSHEET*/
CREATE TABLE [dbo].[marksheet] 
(
	[marksheet_id] VARCHAR(50) PRIMARY KEY,
    [students_reg_id]   VARCHAR (50)  NOT NULL,
	[classid]   VARCHAR (50)  NOT NULL,
	[class_name] VARCHAR(50) NOT NULL,
	[class_section] VARCHAR(30) NOT NULL,
	[session] VARCHAR(4) NOT NULL,
	[term] VARCHAR(2) NOT NULL,
	[subject_code] VARCHAR(50) NOT NULL,
	[subject_name] VARCHAR(50) NOT NULL,
	[full_marks_written] INT,
	[marks_obtained_written] INT,
	[full_marks_oral] INT,
	[marks_obtained_oral] INT,
	[full_marks_practical] INT,
	[marks_obtained_practical] INT,
	[grade] VARCHAR(2),
    [update_time] DATETIME      NULL,
    [updated_by] VARCHAR (50)  NULL,
    CONSTRAINT [FK_marksheet_to_students] FOREIGN KEY ([students_reg_id]) REFERENCES [dbo].[students] ([students_reg_id]),
    CONSTRAINT [FK_marksheet_to_fees_structure_id] FOREIGN KEY ([classid]) REFERENCES [dbo].[class] ([classid]),
	CONSTRAINT [FK_marksheet_to_admin_manager] FOREIGN KEY ([updated_by]) REFERENCES [admin_manager]([userid]),
);

