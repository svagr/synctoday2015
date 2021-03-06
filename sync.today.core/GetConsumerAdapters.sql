/*  
declare @adapterIdVal int = 0
declare @consumerIdVal int = 0
declare @dataVal nvarchar(4000) = NULL
*/

declare @adapterId int 
select @adapterId = @adapterIdVal
declare @consumerId int 
select @consumerId = @consumerIdVal
declare @data nvarchar(4000) 
select @data = @dataVal

SELECT * FROM ConsumerAdapters WHERE 
	AdapterId = ( CASE WHEN @adapterId = 0 THEN AdapterId ELSE @adapterId END ) AND
	ConsumerId = ( CASE WHEN @consumerId = 0 THEN ConsumerId ELSE @consumerId END ) AND 
	DateJSON = ISNULL(@data, DateJSON)


