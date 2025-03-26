select * from sys.objects o inner join syscomments on object_id=id where text like '%Some text you need to find inside a StoredProcedure, View or Function%'
