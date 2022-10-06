section Section1;

shared Table = let
    Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WSklLKVbSUUrMyChOU4rViVYqTklLBIsAGUqxsQA=", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Column1 = _t, Column2 = _t]),
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"Column1", type text}, {"Column2", type text}}),
    #"Inserted First Characters" = Table.AddColumn(#"Changed Type", "First Characters", each Text.Start([Column2], 3), type text)
in
    #"Inserted First Characters";

shared TestTable = let
    Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WSklLKVbSUUrMyChOU4rViVYqTklLBIsAGUqxsQA=", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Column1 = _t, Column2 = _t]),
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"Column1", type text}, {"Column2", type text}}),
    #"Inserted First Characters" = Table.AddColumn(#"Changed Type", "First Characters", each Text.Start([Column2], 3), type text),
    #"Inserted Capitalize Each Word" = Table.AddColumn(#"Inserted First Characters", "Capitalize Each Word", each Text.Proper([Column2]), type text),
    #"Renamed Columns" = Table.RenameColumns(#"Inserted Capitalize Each Word",{{"Column2", "OriginalPart"}})
in
    #"Renamed Columns";