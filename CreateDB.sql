USE master
GO

-- Create database UrgentCareCenter
IF DB_ID('UrgentCareCenter') IS NOT NULL
	DROP DATABASE UrgentCareCenter;

CREATE DATABASE UrgentCareCenter;