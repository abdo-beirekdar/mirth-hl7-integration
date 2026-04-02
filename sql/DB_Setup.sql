CREATE DATABASE [hospital_integration]
GO

USE [hospital_integration]
GO

--Create Received hl7 messages table
CREATE TABLE [dbo].[RawMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MessageControlId] [varchar](100) NULL,
	[RawHL7] [text] NULL,
	[Status] [varchar](20) NULL,
	[ErrorMessage] [varchar](500) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[RawMessages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO

--Create Patients table
CREATE TABLE [dbo].[Patients](
	[Id] [varchar](50) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[FullName] [varchar](200) NULL,
	[Gender] [varchar](20) NULL,
	[BirthDate] [date] NULL,
	[Doctor] [varchar](100) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Patients] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO

--Create Patients audit table
CREATE TABLE [dbo].[PatientAudit](
	[AuditId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [varchar](50) NULL,
	[ActionType] [varchar](10) NULL,
	[OldData] [nvarchar](max) NULL,
	[NewData] [nvarchar](max) NULL,
	[SourceSystem] [varchar](100) NULL,
	[MessageType] [varchar](20) NULL,
	[EventType] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[VersionNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[PatientAudit] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO