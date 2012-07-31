use sybsystemprocs
go

 /** SECTION END: CLEANUP **/
 

/*
**  create a procedure that will query the datasource
**  specific syscharset, and sysconfigures tables, and do a join to 
**  determine what is the correct charset that has been set as a default
**  on the server.
*/
create procedure sp_default_charset
as

    if @@trancount = 0
    begin
    	set chained off
    end
    
    set transaction isolation level 1

    select name as DEFAULT_CHARSET from master.dbo.syscharsets
       where ((select value from master.dbo.sysconfigures      
               where config=131)  /* default charset id */
              = master.dbo.syscharsets.id)
