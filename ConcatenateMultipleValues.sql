  CROSS APPLY 
   ( 
	   SELECT SomeVarcharColumn + ', ' FROM [BD].[Test].[SomeTable]
	   FOR XML PATH('')
   ) A (ConcValues)
