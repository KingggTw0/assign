CREATE DATABASE [DMS]
USE [DMS]
GO
/****** Object:  Table [dbo].[EMPMAJOR]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPMAJOR](
	[emp_no] [char](6) NOT NULL,
	[major] [char](3) NOT NULL,
	[major_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[major] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMP]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMP](
	[emp_no] [char](6) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[dept_no] [char](3) NOT NULL,
	[job] [varchar](50) NULL,
	[salary] [money] NOT NULL,
	[bonus] [money] NULL,
	[ed_level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEPT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPT](
	[dept_no] [char](3) NOT NULL,
	[dept_name] [varchar](50) NOT NULL,
	[mgn_no] [char](6) NULL,
	[admr_dept] [char](3) NOT NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dept_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPPROJACT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPPROJACT](
	[emp_no] [char](6) NOT NULL,
	[proj_no] [char](6) NOT NULL,
	[act_no] [int] NOT NULL,
 CONSTRAINT [PK_EPA] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[proj_no] ASC,
	[act_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACT](
	[act_no] [int] NOT NULL,
	[act_des] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[act_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Dept]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[DEPT]  WITH CHECK ADD  CONSTRAINT [FK_Dept] FOREIGN KEY([mgn_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[DEPT] CHECK CONSTRAINT [FK_Dept]
GO
/****** Object:  ForeignKey [FK__EMP__dept_no__3E52440B]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMP]  WITH CHECK ADD FOREIGN KEY([dept_no])
REFERENCES [dbo].[DEPT] ([dept_no])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK_Major]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPMAJOR]  WITH CHECK ADD  CONSTRAINT [FK_Major] FOREIGN KEY([emp_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[EMPMAJOR] CHECK CONSTRAINT [FK_Major]
GO
/****** Object:  ForeignKey [FK_EPA1]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPPROJACT]  WITH CHECK ADD  CONSTRAINT [FK_EPA1] FOREIGN KEY([emp_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[EMPPROJACT] CHECK CONSTRAINT [FK_EPA1]
GO
/****** Object:  ForeignKey [FK_EPA2]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPPROJACT]  WITH CHECK ADD  CONSTRAINT [FK_EPA2] FOREIGN KEY([act_no])
REFERENCES [dbo].[ACT] ([act_no])
GO
ALTER TABLE [dbo].[EMPPROJACT] CHECK CONSTRAINT [FK_EPA2]
GO


-- a. Add at least 8 records into each created tables
/****** Object: INSERT INTO [dbo].[EMPMAJOR] ******/
INSERT INTO [dbo].[EMPMAJOR] ([emp_no],[major],[major_name])
VALUES
	('000010','MAT','Math'),
	('000120','CSI','Computer Science'),
	('000140','PHY','Physics'),
	('000310','MAT','Math'),
	('000310','CSI','Computer Science'),
	('000510','MAT','Math'),
	('000060','CHE','Chemistry'),
	('000510','CSI','Computer Science')

/****** Object: INSERT INTO [dbo].[EMP] ******/
INSERT INTO [dbo].[EMP] ([emp_no],[last_name],[first_name],[dept_no],[job],[salary],[ed_level])
VALUES 
	('000010','HAAS','Christine','AOO','',52750.00,1),
	('000120','Kochhar','Neena','B01','',64520.00,5),
	('000050','De Haan','Lex','C00','',51200.00,8),
	('000140','Hunold','Alexander','A02','',43520.00,11),
	('000310','Ernst','Bruce','C00','',20000.00,2),
	('000210','Austin','David','B03','',15200.00,4),
	('000510','Pataballa','Valli','D01','',24008.00,3),
	('000060','Lorentz','Diana','A02','',65032.00,1)

/****** Object: INSERT INTO [dbo].[DEPT]  ******/
INSERT INTO [dbo].[DEPT] ([dept_no],[dept_name],[admr_dept],[location])
VALUES 
	('AOO','Administration','AD0',''),
	('B01','Marketing','MK0',''),
	('C00','Purchasing','PC0',''),
	('D01','Shipping','SP0',''),
	('A02','Human Resources','HR0',''),
	('B00','IT','IT0',''),
	('B03','Public Relations','PR0',''),
	('C01','Sales','Sa0','')

/****** Object: INSERT INTO [dbo].[EMPPROJACT]  ******/
INSERT INTO [dbo].[EMPPROJACT] ([emp_no],[proj_no],[act_no])
VALUES 
	('000010','PJ01',70),
	('000510','PJ02',80),
	('000140','PJ04',100),
	('000050','PJ01',90),
	('000310','PJ02',90),
	('000210','PJ03',130),
	('000050','PJ02',60),
	('000060','PJ03',80)

/****** Object: INSERT INTO [dbo].[ACT]  ******/
INSERT INTO [dbo].[ACT] ([act_no],[act_des])
VALUES 
	(80,'active'),
	(90,'currently'),
	(100,'active'),
	(110,'currently'),
	(70,'active'),
	(130,'currently'),
	(60,'currently'),
	(120,'active')

-- b. Find employees who are currently working on a project or projects. Employees working on projects will have a row(s) on the EMPPROJACT table. 
SELECT emp.[emp_no],CONCAT(emp.[first_name],' ',emp.[last_name]) AS [full_name],act.[act_no]
FROM [dbo].[EMP] emp JOIN [dbo].[EMPPROJACT] emp_pro_act ON emp.[emp_no]=emp_pro_act.[emp_no]
	JOIN (SELECT ac.[act_no] 
			FROM [dbo].[ACT] ac 
			WHERE ac.[act_des]='currently') act ON emp_pro_act.[act_no]=act.[act_no]
	
-- c. Find all employees who major in math (MAT) and computer science (CSI).
SELECT emp.[emp_no],CONCAT(emp.[first_name],' ',emp.[last_name]) AS [full_name]
FROM [dbo].[EMP] emp
WHERE emp.[emp_no] IN(
	SELECT emp_ma.[emp_no]
	FROM [dbo].[EMPMAJOR] emp_ma
	WHERE emp_ma.[major]='MAT')
	AND emp.[emp_no] IN(
	SELECT emp_ma.[emp_no]
	FROM [dbo].[EMPMAJOR] emp_ma
	WHERE emp_ma.[major]='CSI')

-- d.Find employees who work on all activities between 90 and 110 
SELECT emp.[emp_no],CONCAT(emp.[first_name],' ',emp.[last_name]) AS [full_name]
FROM [dbo].[EMP] emp JOIN [dbo].[EMPPROJACT] emp_pro_act ON emp.[emp_no]=emp_pro_act.[emp_no]
WHERE emp_pro_act.[act_no] BETWEEN 90 AND 110

--e. Provide a report of employees with employee detail information along with department aggregate information
/*** Subquery **/
SELECT emp.[emp_no] AS [EMPNO], emp.[last_name] AS [LASTNAME], emp.[first_name] AS [FIRSTNAME], emp.[salary] AS [SALARY], emp.[dept_no] AS [DEPTNO],
	(SELECT AVG(emp1.[salary]) 
	 FROM [dbo].[EMP] emp1 
	 WHERE emp1.dept_no=emp.dept_no) AS DEPT_AVG_SAL
FROM [dbo].[EMP] emp
GROUP BY emp.[emp_no],emp.[last_name],emp.[first_name],emp.[salary], emp.[dept_no]

/*** Scalar **/
CREATE FUNCTION [dbo].[DEPT_AVG_SAL] (@dep_no CHAR(3))
RETURNS DEC(10,2)
AS
BEGIN 
RETURN (
	SELECT AVG(emp1.[salary])
	FROM [dbo].[EMP] emp1
	WHERE emp1.dept_no=@dep_no
	)
END;

SELECT emp.[emp_no] AS [EMPNO], emp.[last_name] AS [LASTNAME], emp.[first_name] AS [FIRSTNAME], emp.[salary] AS [SALARY], 
	emp.[dept_no] AS [DEPTNO], [dbo].[DEPT_AVG_SAL](emp.[dept_no]) AS DEPT_AVG_SAL
FROM [dbo].[EMP] emp
GROUP BY emp.[emp_no],emp.[last_name],emp.[first_name],emp.[salary], emp.[dept_no]

--f. Use CTE technique to provide a report of employees whose education levels are higher than the average education level of their respective department. 
;WITH GET_AVG_MAX([dept_no],[AVG_MAX])
AS(
SELECT DISTINCT emp.[dept_no],
	(SELECT AVG(emp1.[ed_level]) 
	FROM [dbo].[EMP] emp1
	WHERE emp1.[dept_no]=emp.dept_no) AS [AVG_ED]
FROM [dbo].[EMP] emp
)
SELECT emp.[emp_no],CONCAT(emp.[first_name],' ',emp.[last_name]) AS [full_name],emp.[ed_level],avg_max.[AVG_MAX]
FROM [dbo].[EMP] emp JOIN GET_AVG_MAX avg_max ON emp.[dept_no]=avg_max.[dept_no]
WHERE emp.[ed_level]>avg_max.[AVG_MAX]

--g. Return the department number, department name and the total payroll for the department that has the highest payroll. Payroll will be defined as the sum of all salaries and bonuses for the department. 
;WITH GET_MAX([dept_no],[dept_name],[SUM_MAX])
AS(
SELECT dept.[dept_no], dept.[dept_name],
	(SELECT SUM(COALESCE(emp.[bonus],0)+emp.[salary]) 
	 FROM [dbo].[EMP] emp 
	 WHERE emp.[dept_no]=dept.[dept_no]) AS [SUM]
FROM [dbo].[DEPT] dept
GROUP BY dept.[dept_no], dept.[dept_name]
)
SELECT [dept_no],[dept_name],[SUM_MAX]
FROM GET_MAX
WHERE [SUM_MAX] IN (SELECT MAX([SUM_MAX]) FROM GET_MAX)

--h. Return the employees with the top 5 salaries. 
/** Could be 5 employees with different salarie */
SELECT TOP(5) tmp.[emp_no],CONCAT(tmp.[first_name],' ',tmp.[last_name]) AS [full_name], tmp.[salary]
FROM 
	(SELECT DISTINCT emp.[emp_no],emp.[first_name],emp.[last_name],DENSE_RANK() OVER (ORDER BY emp.salary DESC) AS [RANK], emp.[salary]
	 FROM [dbo].[EMP] emp
	) AS tmp
GROUP BY tmp.[emp_no],tmp.[first_name],tmp.[last_name],tmp.[salary]
ORDER BY tmp.[salary] DESC

/** Could be many employees having the same salaries. */
SELECT TOP(5) emp.[emp_no],CONCAT(emp.[first_name],' ',emp.[last_name]) AS [full_name],emp.[salary]
FROM [dbo].[EMP] emp
ORDER BY emp.[salary] DESC