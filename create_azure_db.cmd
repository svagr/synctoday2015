.nuget\NuGet restore sync.today.sln
packages\sync.today.createdb.1.0.5610.23810\lib\net45\sync.today.createdb.exe "Server=tcp:e90uay6jv1.database.windows.net,1433;Database=appveyor;User ID=appveyor@e90uay6jv1;Password=4p4TXW9LJRcsZdM6;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;"
tools\fnr\fnr.exe --cl --find "Server=(localdb)\ProjectsV12; Database=SyncToday2015.new; Trusted_Connection=True;" --replace "Data Source=kc8q88iui6.database.windows.net;Initial Catalog=sync.today.db.test;Integrated Security=False;User ID=sync.today;Password=LJYjG6xqYASdDJxV;Connect Timeout=60;Encrypt=False" --dir "C:\projects\synctoday2015" --fileMask "*.config" --includeSubDirectories
