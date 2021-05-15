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
SELECT 
    k.idKlienta,
    k.imie,
    k.nazwisko,
    ko.dataOtwarcia,
    ko.nazwaOddzialu
FROM
    bank2021.klient k
        LEFT JOIN
    bank2021.konto_klienta kk USING (idKlienta)
        LEFT JOIN
    bank2021.konto ko USING (nrKonta)
WHERE
    YEAR(CURDATE()) - YEAR(ko.dataOtwarcia) < 5


/*7*/
SELECT 
    o.nazwaOddzialu, p.imie, p.nazwisko
FROM
    bank2021.oddzialbanku o
        LEFT JOIN
    bank2021.pracownik p ON o.idKierownika = p.idPracownika

    
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
    
/*9*/
SELECT 
    *
FROM
    bank2021.klient k
        LEFT JOIN
    bank2021.konto_klienta kk USING (idKlienta)
        LEFT JOIN
    bank2021.konto ko USING (nrKonta)
    where ko.saldo > 5000 and k.idOpiekuna is null
    
/*10*/
SELECT 
    *
FROM
    bank2021.klient k
        JOIN
    bank2021.konto_klienta USING (idKlienta)
        JOIN
    bank2021.lokata USING (idKlienta)
    
/*11*/
SELECT 
    *
FROM
    bank2021.klient k
        JOIN
    bank2021.lokata USING (idKlienta)
WHERE
    nazwaLokaty = 'super'
    
/*12*/
SELECT 
    *, dataOtwarcia + INTERVAL czasTrwania MONTH
FROM
    bank2021.klient k
        RIGHT JOIN
    bank2021.lokata USING (idKlienta)
        LEFT JOIN
    bank2021.rodzajLokaty USING (nazwaLokaty)
WHERE
    dataZamkniecia IS NULL
    
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
    
/*14*/
SELECT 
    *
FROM
    bank2021.klient k
        RIGHT JOIN
    bank2021.lokata USING (idKlienta)
        RIGHT JOIN
    bank2021.rodzajLokaty USING (nazwaLokaty)
WHERE
    idKlienta IS NULL
    
/*15*/
SELECT 
    *
FROM
    bank2021.klient k
        RIGHT JOIN
    bank2021.lokata USING (idKlienta)
        RIGHT JOIN
    bank2021.rodzajLokaty USING (nazwaLokaty)
WHERE
    idKlienta IS NOT NULL
    
/*16*/
SELECT 
    *
FROM
    bank2021.operacja
WHERE
    idKlienta = (SELECT 
            idKlienta
        FROM
            bank2021.klient
        WHERE
            nazwisko = 'Nowicki')
    
    
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
        
/*18*/
SELECT 
    kk.nrKonta, o.nrOperacji
FROM
    bank2021.konto_klienta kk
        LEFT JOIN
    bank2021.operacja o USING (nrKonta)
WHERE
    o.nrOperacji IS NULL
    
/*19*/


        
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
            
            
            



    