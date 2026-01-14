CREATE TABLE Clients( 
	NoCli int primary key, 
	Nom nvarchar(100), 
	Prenom nvarchar(100), 
	Adresse nvarchar(max), 
	Cpo char(5), 
	Ville varchar(100), 
)

CREATE TABLE Article( 
	NoRef int primary key, 
	designation nvarchar(100),
	categorie nvarchar(100), 
	gamme nvarchar(100),
)

CREATE TABLE location(
	NoLoc int primary key,
	NoCli int references Clients(NoCli),
	NoRef int references Article(NoRef),
)
