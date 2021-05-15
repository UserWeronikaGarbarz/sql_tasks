/*lab 2.1*/

/* 1*/
SELECT 
    k.idKlienta, imie, nazwisko, l.nrLokaty, l.kwota
FROM
    bank2021.klient k
        JOIN
    bank2021.lokata l ON k.idKlienta = l.idKlienta
ORDER BY kwota DESC


/* 2*/
SELECT 
    k.idKlienta, imie, nazwisko, ko.nazwaOddzialu
FROM
    bank2021.klient k
        JOIN
    bank2021.konto_klienta l ON k.idKlienta = l.idKlienta
        LEFT JOIN
    bank2021.konto ko ON ko.nrKonta = l.nrKonta
WHERE
    ko.nazwaOddzialu = 'Krakow3'
    
    /* 3*/
SELECT 
    k.idKlienta, imie, nazwisko
FROM
    bank2021.klient k
        LEFT JOIN
    bank2021.lokata l ON k.idKlienta = l.idKlienta
WHERE
    l.nrLokaty IS NULL
    
    /* 4*/
SELECT 
    p.nazwisko,
    CASE
        WHEN p.idKierownika IS NULL THEN '------'
        ELSE k.nazwisko
    END AS 'Pracownik'
FROM
    bank2021.pracownik p
        LEFT JOIN
    bank2021.pracownik k ON p.idKierownika = k.idPracownika
    
/* 5*/
SELECT 
    k.idKlienta, imie, nazwisko
FROM
    bank2021.klient k
        JOIN
    bank2021.konto_klienta l ON k.idKlienta = l.idKlienta
        LEFT JOIN
    bank2021.konto ko ON ko.nrKonta = l.nrKonta
WHERE
    ko.nazwaOddzialu = 'Krakow2'
        AND k.idOpiekuna IS NOT NULL

/*6*/
SELECT k.idKlienta, k.imie, k.nazwisko

    



    
/* 8*/
SELECT 
    ko.nrKonta,
    ko.saldo,
    ko.dataotwarcia,
    ko.typ,
    ko.nazwaOddzialu
FROM
    bank2021.klient k
		JOIN
    bank2021.konto_klienta l ON k.idKlienta = l.idKlienta
       JOIN
    bank2021.konto ko ON ko.nrKonta = l.nrKonta
WHERE
    k.idOpiekuna IS NULL
    
    
/* 13*/
SELECT 
    *, l.kwota * r.oprocentowanie/100  * r.czasTrwania /12 AS 'Zysk'
FROM
    bank2021.klient k
        LEFT JOIN
    bank2021.lokata l ON k.idKlienta = l.idKlienta
        LEFT JOIN
    bank2021.rodzajlokaty r ON l.nazwaLokaty = r.nazwaLokaty
WHERE
    l.dataZamkniecia IS NOT NULL
    
    
    
/* 17*/
SELECT 
    k.idKlienta, k.imie, k.nazwisko, kk.nrKonta, l.nrLokaty
FROM
    bank2021.klient k
        LEFT JOIN
    bank2021.konto_klienta kk ON k.idKlienta = kk.idKlienta
        LEFT JOIN
    bank2021.lokata l ON k.idKlienta = l.idKlienta
WHERE
    kk.nrKonta IS NULL
        AND l.nrLokaty IS NOT NULL
        
        
/* 1*/
SELECT 
    k.idKlienta, imie, nazwisko
FROM
    bank2021.klient k
WHERE k.idKlienta NOT IN (SELECT idKlienta from bank2021.lokata)
        

SELECT 
    k.idKlienta, imie, nazwisko
FROM
    bank2021.klient k
WHERE
    EXISTS( SELECT 
            NULL
        FROM
            bank2021.lokata l
        WHERE
            k.idKlienta = l.idKlienta)
            
            

SELECT 
    *
FROM
    bank2021.konto
WHERE
    saldo > (SELECT 
            saldo
        FROM
            bank2021.konto
        WHERE
            nrKonta = '311113')
        AND nazwaOddzialu = (SELECT 
            nazwaOddzialu
        FROM
            bank2021.konto
        WHERE
            nrKonta = '311113')
            
            
            



    