CREATE TABLE BetalingMade (
    IdBetaling     INT NOT NULL,
CONSTRAINT pk_BetalingMade PRIMARY KEY CLUSTERED (IdBetaling))
GO

--
-- Create Table    : 'Kunde'   
-- KundeNr         :  
--
CREATE TABLE Kunde (
    KundeNr        INT NOT NULL,
CONSTRAINT pk_Kunde PRIMARY KEY CLUSTERED (KundeNr))
GO

--
-- Create Table    : 'Ansat'   
-- AnsatId         :  
--
CREATE TABLE Ansat (
    AnsatId        INT NOT NULL,
CONSTRAINT pk_Ansat PRIMARY KEY CLUSTERED (AnsatId))
GO

--
-- Create Table    : 'Produkt'   
-- ProduktId       :  
--
CREATE TABLE Produkt (
    ProduktId      INT NOT NULL,
CONSTRAINT pk_Produkt PRIMARY KEY CLUSTERED (ProduktId))
GO

--
-- Create Table    : 'FragtMade'   
-- FragtId         :  
--
CREATE TABLE FragtMade (
    FragtId        INT NOT NULL,
CONSTRAINT pk_FragtMade PRIMARY KEY CLUSTERED (FragtId))
GO

--
-- Create Table    : 'Ordre'   
-- OrdreId         :  
-- KundeNr         :  (references Kunde.KundeNr)
-- AnsatId         :  (references Ansat.AnsatId)
--
CREATE TABLE Ordre (
    OrdreId        INT NOT NULL,
    KundeNr        INT NULL,
    AnsatId        INT NULL,
CONSTRAINT pk_Ordre PRIMARY KEY CLUSTERED (OrdreId),
CONSTRAINT fk_Ordre2 FOREIGN KEY (KundeNr)
    REFERENCES Kunde (KundeNr)
    ON UPDATE CASCADE,
CONSTRAINT fk_Ordre3 FOREIGN KEY (AnsatId)
    REFERENCES Ansat (AnsatId)
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Forsendelse'   
-- ForsendId       :  
-- AnsatId         :  (references Ansat.AnsatId)
-- FragtId         :  (references FragtMade.FragtId)
--
CREATE TABLE Forsendelse (
    ForsendId      INT NOT NULL,
    AnsatId        INT NULL,
    FragtId        INT NOT NULL,
CONSTRAINT pk_Forsendelse PRIMARY KEY CLUSTERED (ForsendId),
CONSTRAINT fk_Forsendelse FOREIGN KEY (AnsatId)
    REFERENCES Ansat (AnsatId)
    ON UPDATE CASCADE,
CONSTRAINT fk_Forsendelse2 FOREIGN KEY (FragtId)
    REFERENCES FragtMade (FragtId)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'OrdeListe'   
-- ProduktId       :  (references Produkt.ProduktId)
-- OrdreId         :  (references Ordre.OrdreId)
--
CREATE TABLE OrdeListe (
    ProduktId      INT NOT NULL,
    OrdreId        INT NOT NULL,
CONSTRAINT pk_OrdeListe PRIMARY KEY CLUSTERED (ProduktId),
CONSTRAINT fk_OrdeListe FOREIGN KEY (ProduktId)
    REFERENCES Produkt (ProduktId)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT fk_OrdeListe2 FOREIGN KEY (OrdreId)
    REFERENCES Ordre (OrdreId)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Faktura'   
-- FakturaNr       :  
-- IdBetaling      :  (references BetalingMade.IdBetaling)
-- OrdreId         :  (references Ordre.OrdreId)
--
CREATE TABLE Faktura (
    FakturaNr      INT NOT NULL,
    IdBetaling     INT NULL,
    OrdreId        INT NOT NULL,
CONSTRAINT pk_Faktura PRIMARY KEY CLUSTERED (FakturaNr),
CONSTRAINT fk_Faktura FOREIGN KEY (IdBetaling)
    REFERENCES BetalingMade (IdBetaling)
    ON UPDATE CASCADE,
CONSTRAINT fk_Faktura2 FOREIGN KEY (OrdreId)
    REFERENCES Ordre (OrdreId)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO
